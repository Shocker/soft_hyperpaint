unit Server;

interface
  uses Windows, SysUtils,
       IdContext;

    procedure TCP_ServerExecute(AContext: TIdContext);
    procedure TCP_ServerConnect(AContext: TIdContext);
    procedure TCP_ServerDisconnect(AContext: TIdContext);
  procedure server_received_draw(context: TIdContext);
  procedure server_received_effect(context: TIdContext);

implementation

uses main, ClientCommunication;


procedure TCP_ServerExecute(AContext: TIdContext);
  var tmp:string;
begin
  try
    tmp := AContext.Connection.IOHandler.ReadString(5);
    if tmp<>'' then
      begin
        //log_memo.Lines.Add('GOT: ' + tmp + ' from ' + AContext.Connection.Socket.Binding.IP + ':' + inttostr(AContext.Connection.Socket.Binding.PeerPort));
        if tmp = 'DRAW_' then server_received_draw(AContext)
        else if tmp = 'EFECT' then server_received_effect(AContext)
        else if tmp = 'LEAVE' then
          begin
            AContext.Connection.IOHandler.WriteLn('OKBYE');
            AContext.Connection.IOHandler.ReadLn;
            TCP_Server.Contexts.Clear;
            AContext.Connection.Disconnect;
            EnterCriticalSection(crit);
              deleteClient(AContext.Connection.Socket.Binding.IP + ':' + IntToStr(AContext.Connection.Socket.Binding.PeerPort));
            LeaveCriticalSection(crit);
            updateClientsCounter;
            connected := false;
          end;
      end;
  except
    exit;
  end;
end;

procedure TCP_ServerConnect(AContext: TIdContext);
  var tmp: string;
begin
  tmp := Format('%s:%d', [AContext.Binding.IP,AContext.Binding.PeerPort]);
  //log_memo.lines.add('New client: ' + tmp);
  EnterCriticalSection(Crit);
    addClient(tmp, AContext);
  LeaveCriticalSection(Crit);

  Form1.WriteImage(AContext);

  updateClientsCounter;
end;

procedure TCP_ServerDisconnect(AContext: TIdContext);
  var tmp: string;
begin
  tmp := Format('%s:%d', [AContext.Binding.IP,AContext.Binding.PeerPort]);
  //log_memo.lines.add('Client disconnected: ' + tmp);
  EnterCriticalSection(Crit);
    deleteClient(tmp);
  LeaveCriticalSection(Crit);
  updateClientsCounter;
end;


procedure server_received_draw(context: TIdContext);
  var tmp, toolstr: string;
begin
  tmp := context.Connection.IOHandler.ReadLn;
  toolstr := copy(tmp, 1, pos(':', tmp) - 1);
  delete(tmp, 1, length(toolstr) + 1);
  skipClient := context.Connection.Socket.Binding.IP + ':' + IntToStr(context.Connection.Socket.Binding.PeerPort);
  broadcastToClients('DRAW_', toolstr, tmp, true);
  skipClient := '';
  form1.Image1.Canvas.Lock;
  Form1.drawStuff_core(tmp, toolstr);
  Form1.Image1.Canvas.Unlock;
  //updstr := 'DRAW ' + toolstr + ' @ ' + tmp;
  //Synchronize(update);
end;

procedure server_received_effect(context: TIdContext);
  var effect, eff_orig, data: string;
      i: integer;
begin
  effect := context.Connection.IOHandler.ReadLn;
  eff_orig := effect;

  data := copy(effect, pos(':', effect) + 1, length(effect));
  for i := 1 to 4 do
    Form1.extractNextVal(data); //jump over the first 4 unused values
  effect := copy(effect, 1, pos(':', effect)-1);
  {$IFDEF DEBUG}
  Form1.client_log.Lines.Add('effect: ' + effect);
  {$ENDIF}

  skipClient := context.Connection.Socket.Binding.IP + ':' + IntToStr(context.Connection.Socket.Binding.PeerPort);
  broadcastToClients('EFECT', effect, data);
  skipClient := '';

  Form1.Image1.Hide;
  Form1.Image1.Canvas.Lock;

  Form1.drawEffects_core(eff_orig);

  Form1.Image1.Canvas.Unlock;
  Form1.Image1.Show;
end;

end.
