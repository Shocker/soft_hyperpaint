unit ClientCommunication;

interface

uses SysUtils, Classes, Windows,
     IdContext, IdTCPClient, IdBaseComponent, IdComponent;

    procedure addClient(ip_port: string; context: TIdContext);
    procedure deleteClient(ip_port:string);
    function countClients:integer;
    procedure disconnectAllClients;
    procedure updateClientsCounter;
    procedure broadcastToClients(action:string; tool:string = ''; data:string = ''; forwardedPaint:boolean=false);
    procedure tellServer(action:string;tool:string = ''; data:string = '');

type
  TClientThread=class(TThread)
    procedure phase_first;
    procedure phase_last;

    procedure readImage;
    procedure got_image;
    procedure update;

    procedure drawStuff;
    procedure drawEffects;

    protected
      procedure execute; override;
end;

implementation

uses main;

procedure tellServer(action:string; tool: string = ''; data: string = '');
  var colors, brush: string;
begin
  colors := IntToStr(foreColor) + ',' + IntToStr(backColor);
  brush := IntToStr(ord(brushStyle)) + ',' + IntToStr(ord(penStyle));
  TCP_Client.IOHandler.WriteLn(action+tool + ':' + colors + ',' + brush + ',' + DATA);
end;

procedure broadcastToClients(action: string; tool: string = '';data:string = ''; forwardedPaint: boolean = false);
  var i: integer;
      colors, brush: string;
begin
  colors := '';
  brush := '';
  if not forwardedPaint then
    begin
      colors := IntToStr(foreColor) + ',' + IntToStr(backColor) + ',';
      brush := IntToStr(ord(brushStyle)) + ',' + IntToStr(ord(penStyle)) + ',';
    end;
  for i := 1 to 255 do
    if (clients[i].ip_port <> '') and (clients[i].ip_port <> skipClient) then
      if action = 'IMAGE' then
        form1.WriteImage(clients[i].context)
      else
        clients[i].context.Connection.IOHandler.WriteLn(action+tool + ':' + colors+brush+DATA);
end;

procedure deleteClient(ip_port: string);
  var i: integer;
begin
  for i := 1 to 255 do
    if clients[i].ip_port=ip_port then
      begin
        clients[i].ip_port := '';
        clients[i].context := nil;
      end;
end;

function countClients:integer;
  var i, cnt: integer;
begin
  cnt := 0;
  for i := 1 to 255 do
    if clients[i].ip_port<>'' then
      inc(cnt);
  result := cnt;
end;

procedure disconnectAllClients;
  var i: integer;
begin
  for i := 1 to 255 do
    if clients[i].ip_port <> '' then
      begin
        clients[i].context.Connection.IOHandler.WriteLn('OKBYE');
        clients[i].context.Connection.Disconnect;
        clients[i].ip_port := '';
        clients[i].context := nil;
      end;
end;

procedure addClient(ip_port: string; context: TIdContext);
  var i: integer;
begin
  for i := 1 to 255 do
    if clients[i].ip_port = '' then
      begin
        clients[i].ip_port := ip_port;
        clients[i].context := context;
        break;
      end;
end;

// TClientThread
procedure TClientThread.drawEffects;
  var effect:string;
begin
  effect := TCP_Client.IOHandler.ReadLn;
  form1.drawEffects_core(effect);
end;

procedure TClientThread.drawStuff;
  var client: TIdTCPClient;
      tmp, toolstr: string;
begin
  client := TCP_Client;
  tmp := client.IOHandler.ReadLn;
  toolstr := copy(tmp, 1, pos(':', tmp)-1);
  delete(tmp, 1, length(toolstr) + 1);
  updstr := 'DRAW ' + toolstr + ' @ ' + tmp;
  Synchronize(update);

  form1.drawStuff_core(tmp, toolstr);
end;

procedure TClientThread.update;
begin
  //form1.client_log.Lines.Add(updstr);
end;

procedure TClientThread.phase_last;
begin
  form1.connect_to_server.Enabled := true;
  form1.connect_to_server.Caption := 'Connect';
  form1.TCP_ClientDisconnected(nil);
  form1.update_info_bars;
end;

procedure TClientThread.phase_first;
begin
  form1.connect_to_server.Enabled := true;
  form1.connect_to_server.Caption := 'Disconnect';
  form1.update_info_bars;
end;

procedure TClientThread.execute;
  var client: TIdTCPClient;
      tmp: string;
      error: boolean;
  label done;
begin
  FreeOnTerminate := true;
  client := TCP_Client;
  try
    client.Connect;
  except
    updstr := 'There was an error while connecting';
    Synchronize(update);
    Synchronize(phase_last);
    exit;
  end;

  while not connected do sleep(100);
  Synchronize(phase_first);
  error := false;
  while not terminated do
    begin
      try
        tmp := '';
        tmp := client.IOHandler.ReadString(5);
      except
        error := true;
      end;
      if error then goto done;
      if tmp<>'' then
        begin
          updstr := 'GOT: ' + tmp;
          Synchronize(update);
          if tmp = 'IMAGE' then readImage
            else if tmp = 'DRAW_' then Synchronize(drawStuff)
            else if tmp = 'EFECT' then Synchronize(drawEffects)
            else if tmp = 'OKBYE' then Terminate;
        end;
    end;

  done:
  try
    client.IOHandler.ReadLn;
    client.Disconnect;
    connected := false;
    client.Socket.Free;
    client.IOHandler.Free;
    ClientThread := nil;
  finally
    Synchronize(phase_last);
  end;
end;

procedure TClientThread.got_image;
begin
  Form1.Image1.Picture.Bitmap.LoadFromStream(imageStream);
  saved := false;
  updstr := 'Image received';
  update;
end;

procedure TClientThread.readImage;
  var size: integer;
      tmp: string;
begin
  updstr := 'Reading image';
  Synchronize(update);
  TCP_Client.IOHandler.readLn; //go to next line
  tmp := TCP_Client.IOHandler.readLn;
  size := StrToInt(tmp);
  imageStream.Clear;
  imageStream.Size := size;
  tmp := TCP_Client.IOHandler.ReadString(size);
  CopyMemory(imageStream.Memory, @tmp[1], size);
  Synchronize(got_image);
end;

procedure updateClientsCounter;
begin
  form1.client_count.Caption := IntToStr(countClients) + ' clients';
end;

end.
