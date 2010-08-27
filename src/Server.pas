unit Server;

interface
  uses Windows, SysUtils,
       IdContext;

  procedure server_received_draw(context: TIdContext);
  procedure server_received_effect(context: TIdContext);

implementation

uses main, ClientCommunication;



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
