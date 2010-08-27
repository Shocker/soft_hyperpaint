unit clients_unit;

interface
uses main, idcontext, sysutils;

    procedure addClient(ip_port: string; context: TIdContext);
    procedure deleteClient(ip_port:string);
    function countClients:integer;
    procedure disconnectAllClients;
    procedure updateClientsCounter;
    procedure broadcastToClients(action:string;tool:string='';data:string=''; forwardedPaint:boolean=false);
    procedure tellServer(action:string;tool:string='';data:string='');

implementation

procedure tellServer(action:string;tool:string='';data:string='');
  var colors, brush: string;
begin
  colors:=IntToStr(foreColor)+','+IntToStr(backColor);
  brush:=IntToStr(ord(brush_style))+','+IntToStr(ord(pen_style));
  form1.tcpclient.IOHandler.WriteLn(action+tool+':'+colors+','+brush+','+DATA);
end;

procedure broadcastToClients(action:string;tool:string='';data:string=''; forwardedPaint:boolean=false);
  var i: integer;
      colors, brush: string;
begin
  colors:='';
  brush:='';
  if not forwardedPaint then
    begin
      colors:=IntToStr(foreColor)+','+IntToStr(backColor)+',';
      brush:=IntToStr(ord(brush_style))+','+IntToStr(ord(pen_style))+',';
    end;
  for i:=1 to 255 do
    if (clients[i].ip_port<>'') and (clients[i].ip_port<>skipClient) then
      if action='IMAGE' then
        form1.WriteImage(clients[i].context)
      else
        clients[i].context.Connection.IOHandler.WriteLn(action+tool+':'+colors+brush+DATA);
end;

procedure deleteClient(ip_port:string);
  var i: integer;
begin
  for i:=1 to 255 do
    if clients[i].ip_port=ip_port then
      begin
        clients[i].ip_port:='';
        clients[i].context:=nil;
      end;
end;

function countClients:integer;
  var i, cnt: integer;
begin
  cnt:=0;
  for i:=1 to 255 do
    if clients[i].ip_port<>'' then
      inc(cnt);
  result:=cnt;
end;

procedure disconnectAllClients;
  var i: integer;
begin
  for i:=1 to 255 do
    if clients[i].ip_port<>'' then
      begin
        clients[i].context.Connection.IOHandler.WriteLn('OKBYE');
        clients[i].context.Connection.Disconnect;
        clients[i].ip_port:='';
        clients[i].context:=nil;
      end;
  //
end;

procedure addClient(ip_port: string; context: TIdContext);
  var i: integer;
begin
  for i:=1 to 255 do
    if clients[i].ip_port='' then
      begin
        clients[i].ip_port:=ip_port;
        clients[i].context:=context;
        break;
      end;
end;
     
procedure updateClientsCounter;
begin
  form1.client_count.Caption:=IntToStr(countClients)+' clients';
end;

end.
