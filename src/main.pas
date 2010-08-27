//{$DEFINE DEBUG}
unit main;

interface

uses
  // base
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Buttons, ComCtrls, XPMan, jpeg, Mask,

  // indy
  IdTCPClient, IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer, IdContext, IdSchedulerOfThreadDefault,
  IdGlobal, IdIOHandler, IdIOHandlerStream, IdTCPConnection, IdScheduler, IdSchedulerOfThread,

  // HyperPaint units
  ClientCommunication;

type
  _TOOLS = (tool_simple_line, tool_rect, tool_ellipse, tool_rect_round,
            tool_crayon, tool_fill, tool_eye);

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Initializeshutdownsequence1: TMenuItem;
    Plans1: TMenuItem;
    Newdefenseplan1: TMenuItem;
    Openexistingplan1: TMenuItem;
    save_normal: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ColorDialog1: TColorDialog;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    save_as: TMenuItem;
    Panel3: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    out_fore_color_preview: TImage;
    bar_blue: TTrackBar;
    bar_green: TTrackBar;
    bar_red: TTrackBar;
    out_back_color_preview: TImage;
    Effects1: TMenuItem;
    Swapcolors1: TMenuItem;
    Invertcolors1: TMenuItem;
    Grayscale1: TMenuItem;
    N1: TMenuItem;
    Eliminatered1: TMenuItem;
    Eliminategreen1: TMenuItem;
    Eliminateblue1: TMenuItem;
    N2: TMenuItem;
    Blur1: TMenuItem;
    BrusStyle_panel: TPanel;
    fill_bt_clear: TSpeedButton;
    fill_bt_solid: TSpeedButton;
    Panel4: TPanel;
    tool_bt_rect: TSpeedButton;
    tool_bt_line: TSpeedButton;
    tool_bt_ellipse: TSpeedButton;
    tool_bt_rect_round: TSpeedButton;
    tool_bt_crayon: TSpeedButton;
    PenStyle_panel: TPanel;
    fill_bt_horiz: TSpeedButton;
    fill_bt_vert: TSpeedButton;
    fill_bt_LR_diag: TSpeedButton;
    fill_bt_RL_diag: TSpeedButton;
    fill_bt_cross: TSpeedButton;
    fill_bt_diag_cross: TSpeedButton;
    pen_bt_solid: TSpeedButton;
    pen_bt_dash: TSpeedButton;
    pen_bt_dot: TSpeedButton;
    pen_bt_dash_dot: TSpeedButton;
    pen_bt_dash_dot_dot: TSpeedButton;
    pen_bt_clear: TSpeedButton;
    tool_bt_fill: TSpeedButton;
    tool_bt_eye: TSpeedButton;
    Image5: TImage;
    Bevel1: TBevel;
    N3: TMenuItem;
    Brightness1: TMenuItem;
    Darkness1: TMenuItem;
    Solarize1: TMenuItem;
    N4: TMenuItem;
    BlacknWhite1: TMenuItem;
    Whitenblack1: TMenuItem;
    Colorize1: TMenuItem;
    Shipcommander1: TMenuItem;
    N6: TMenuItem;
    Rotatehorizontaly1: TMenuItem;
    Overlaprotatedimage1: TMenuItem;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    client_log: TMemo;
    log_memo: TMemo;
    Panel5: TPanel;
    start_server: TButton;
    client_count: TLabel;
    destination_ip: TEdit;
    connect_to_server: TButton;
    N7: TMenuItem;

    // drawing
    function ToolToStr(tool: _TOOLS):string;
    function PoIntToStr(pnt: TPoint):string;
    procedure update_plan_section(end_zone: TPoint);
    procedure MoveTo(x,y:integer);
    procedure tool_change(Sender: TObject);
    procedure BrushStyleChange(Sender: TObject);
    procedure bar_Change(Sender: TObject);
    procedure update_info_bars;
    procedure Log(end_zone: TPoint; other: string = '');
    procedure WriteImage(cont: TIdContext);

    //effects
    procedure AnnounceEffectChange(effect:string; data:string = '');
    procedure drawStuff_core(tmp, toolstr: string);
    procedure drawEffects_core(effect:string);

    // client/server handlers
    procedure TCP_ServerExecute(AContext: TIdContext);
    procedure TCP_ServerConnect(AContext: TIdContext);
    procedure TCP_ServerDisconnect(AContext: TIdContext);
    procedure TCP_ClientConnected(Sender: TObject);
    procedure TCP_ClientDisconnected(Sender: TObject);

    // menu
    procedure save_normalClick(Sender: TObject);
    procedure Initializeshutdownsequence1Click(Sender: TObject);
    procedure Openexistingplan1Click(Sender: TObject);
    procedure Newdefenseplan1Click(Sender: TObject);
    procedure Swapcolors1Click(Sender: TObject);
    procedure Invertcolors1Click(Sender: TObject);
    procedure Grayscale1Click(Sender: TObject);
    procedure Blur1Click(Sender: TObject);
    procedure Eliminatered1Click(Sender: TObject);
    procedure Brightness1Click(Sender: TObject);
    procedure Darkness1Click(Sender: TObject);
    procedure Solarize1Click(Sender: TObject);
    procedure BlacknWhite1Click(Sender: TObject);
    procedure Whitenblack1Click(Sender: TObject);
    procedure Colorize1Click(Sender: TObject);
    procedure Shipcommander1Click(Sender: TObject);
    procedure Rotatehorizontaly1Click(Sender: TObject);
    procedure Overlaprotatedimage1Click(Sender: TObject);

    // misc
    procedure start_serverClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure connect_to_serverClick(Sender: TObject);
    procedure out_fore_color_previewClick(Sender: TObject);
    procedure PenStyle_Change(Sender: TObject);
    procedure out_fore_color_previewDblClick(Sender: TObject);
    function extractNextVal(var str: string):string;

    // drawing
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
      
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  _connections = record
    ip_port: string;
    context: TIdContext;
  end;

  _RGB = record
      R, G, B: byte;
  end;
var
  TCP_Client: TIdTCPClient;
  TCP_Server: TIdTCPServer;
  ClientThread: TClientThread;

  Form1: TForm1;
  tool: _TOOLS;
  plan_is_being_modified: boolean;
  section_origin: TPoint;
  old_pos: TPoint;
  pen_mode: TPenMode;
  brushStyle: TBrushStyle;
  penStyle: TPenStyle;
  CurFile: string;
  saved: boolean;
  imageStream: TMemoryStream;

  updstr: string;

  clients: array[1..255] of _connections;

  connected: boolean = false;
  propagateModif: boolean = false;
  toPropagate: string;

  backColor, foreColor: TColor;

  cur_color_selected: TImage;

  skipClient: string = '';
  force_color: TColor;

  Crit: RTL_CRITICAL_SECTION;

  total_pen_points: integer;
  pen_points: array[1..50000] of TPoint;

implementation

uses NewFile, Effects, Server;

{$R *.dfm}
procedure TForm1.WriteImage(cont: TIdContext);
  var mem: TMemoryStream;
      tb: TIdBytes;
begin
  mem := TMemoryStream.Create;
  Form1.Image1.Picture.Bitmap.SaveToStream(mem);
  cont.Connection.IOHandler.WriteLn('IMAGE');
  cont.Connection.IOHandler.WriteLn(IntToStr(mem.Size));
  SetLength(tb, mem.size);
  CopyMemory(tb, mem.Memory, mem.size);
  cont.Connection.IOHandler.Write(tb);
  mem.Free;
end;


function TForm1.extractNextVal(var str: string):string;
begin
  if pos(',', str) > 0 then
    begin
      result := copy(str, 1, pos(',', str) - 1);
      delete(str, 1, length(result) + 1);
    end
  else
    begin
      result := str;
      str := '';
    end;
end;

procedure TForm1.drawEffects_core(effect:string);
  var data: string;
      i: integer;
begin
  data := copy(effect, pos(':', effect) + 1, length(effect));
  for i := 1 to 4 do
    extractNextVal(data); //jump over the first 4 unused values
  effect := copy(effect, 1, pos(':', effect) - 1);
  {$IFDEF DEBUG}
  Form1.client_log.Lines.Add('effect: ' + effect);
  {$ENDIF}

  effect_main(effect, StrToIntDef(data,0));
end;

procedure TForm1.drawStuff_core(tmp, toolstr: string);
  var canv: TCanvas;
      cnt, i, i1, i2, i3, i4, i5, i6: integer;
      tmp1: string;
      tmpC: TColor;
begin
  canv := Form1.Image1.Canvas;
  canv.Pen.Color := StrToInt(extractNextVal(tmp));
  canv.Brush.Color := StrToInt(extractNextVal(tmp));
  canv.Brush.Style := TBrushStyle(StrToInt(extractNextVal(tmp)));
  canv.Pen.Style := TPenStyle(StrToInt(extractNextVal(tmp)));

  if (toolstr = 'line') or (toolstr = 'ellipse') or (toolstr = 'rect') or (toolstr = 'rect_r') then
    begin
      i1 := StrToInt(extractNextVal(tmp));
      i2 := StrToInt(extractNextVal(tmp));
      i3 := StrToInt(extractNextVal(tmp));
      i4 := StrToInt(extractNextVal(tmp));

      if toolstr = 'line' then begin canv.MoveTo(i1, i2);canv.LineTo(i3, i4);end
        else if toolstr = 'ellipse' then canv.Ellipse(i1, i2, i3, i4)
        else if toolstr = 'rect' then canv.Rectangle(i1, i2, i3, i4)
        else if toolstr = 'rect_r' then
          begin
            i5 := StrToInt(extractNextVal(tmp));
            i6 := StrToInt(extractNextVal(tmp));
            canv.RoundRect(i1, i2, i3, i4, i5, i6);
          end;
    end
  else if toolstr = 'crayon' then
    begin
      tmp1 := copy(tmp, 1, pos('|', tmp) - 1);
      delete(tmp, 1, length(tmp1) + 1);
      cnt := StrToInt(tmp1);
      i1 := StrToInt(extractNextVal(tmp));
      i2 := StrToInt(extractNextVal(tmp));
      canv.MoveTo(i1, i2);
      for i := 3 to cnt do
        begin
          i1 := StrToInt(extractNextVal(tmp));
          i2 := StrToInt(extractNextVal(tmp));
          canv.LineTo(i1, i2);
        end;
    end
  else if toolstr = 'fill' then
    begin
      tmpC := canv.Pen.Color;
      canv.Brush.Color := canv.Pen.Color;
      canv.Pen.Color := tmpC;

      i1 := StrToInt(extractNextVal(tmp));
      i2 := StrToInt(extractNextVal(tmp));
      canv.FloodFill(i1, i2, canv.Pixels[i1, i2], fsSurface);
    end;
end;

procedure TForm1.MoveTo(x,y:integer);
begin
  Image1.Canvas.MoveTo(x,y);
end;

function TForm1.ToolToStr(tool: _TOOLS):string;
begin
  case tool of
    tool_simple_line: result := 'line';
    tool_rect: result := 'rect';
    tool_ellipse: result := 'ellipse';
    tool_rect_round: result := 'rect_r';
    tool_crayon: result := 'crayon';
    tool_fill: result := 'fill';
  end;
end;

function TForm1.PoIntToStr(pnt: TPoint):string;
begin
  Result := IntToStr(pnt.X) + ',' + IntToStr(pnt.Y);
end;

procedure TForm1.Log(end_zone: TPoint; other: string = '');
begin
  {$IFDEF DEBUG}
  log_memo.Lines.Add(ToolToStr(tool) + ' : ' + PoIntToStr(section_origin) + ',' + PoIntToStr(end_zone) + ' , ' + other);
  {$ENDIF}
end;

procedure TForm1.update_plan_section(end_zone:TPoint);
  var canv: TCanvas;
      def: boolean;
      tmpi1, tmpi2, i: integer;
begin
  canv := Image1.Canvas;
  canv.Pen.Mode := pen_mode;
  def := false;
  case tool of
    tool_simple_line:
      begin
        MoveTo(section_origin.X, section_origin.Y);
        canv.LineTo(end_zone.X, end_zone.Y);
        def := true;
      end;
    tool_rect:
      begin
        canv.Rectangle(section_origin.X, section_origin.Y, end_zone.X, end_zone.Y);
        def := true;
      end;
    tool_ellipse:
      begin
        canv.Ellipse(section_origin.X, section_origin.Y, end_zone.X, end_zone.Y);
        def := true;
      end;
    tool_rect_round:
      begin
        tmpi1 := section_origin.X-end_zone.X div 2;
        tmpi2 := section_origin.Y-end_zone.Y div 2;
        canv.RoundRect(section_origin.X, section_origin.Y, end_zone.X, end_zone.Y, tmpi1, tmpi2);
        if not Plan_is_being_modified then
          begin
            toPropagate := PoIntToStr(section_origin) + ',' + PoIntToStr(end_zone) + ',' + format('%d,%d', [tmpi1, tmpi2]);
            Log(end_zone, format('%d,%d', [tmpi1, tmpi2]));
          end;
      end;
    tool_crayon:
      begin
        canv.LineTo(end_zone.x, end_zone.y);
        toPropagate := IntToStr(total_pen_points) + '|';
        for i := 1 to total_pen_points do
          toPropagate := toPropagate+PoIntToStr(pen_points[i]) + ',';
        //Log(point(0,0), toPropagate);
      end;
  end;

  if def then
    if not Plan_is_being_modified then
      begin
        toPropagate := PoIntToStr(section_origin) + ',' + PoIntToStr(end_zone);
        Log(end_zone);
      end;

  if propagateModif then
    if TCP_Server.Active then
      begin //if server, broadcast to clients
        broadcastToClients('DRAW_', ToolToStr(tool), toPropagate);
      end
    else if (connected) and (TCP_Client.Connected) then
      begin //if client, announce server
        tellServer('DRAW_',ToolToStr(tool),toPropagate);
      end;
  propagateModif := false;
end;

procedure TForm1.start_serverClick(Sender: TObject);
begin
  if connected then
    begin
      MessageDlg('You cannot start a server while being connected to another server.', mtWarning, [mbOk], 0);
      exit;
    end;
  if TCP_Server.Active then
    begin
      start_server.Caption := 'Start server';
      disconnectAllClients;
      TCP_Server.Active := false;
      {$IFDEF DEBUG}
      log_memo.Lines.Add('Server off');
      {$ENDIF}
    end
  else
    try
      TCP_Server.Active := true;
      start_server.Caption := 'Stop server';
      {$IFDEF DEBUG}
      log_memo.Lines.Add('Server on');
      {$ENDIF}
    except
     on e:exception do
      begin
        MessageDlg(e.Message, mtWarning, [mbOk],0);
        TCP_Server.Active := false;
      end;
    end;
  client_count.Visible := TCP_Server.Active;
  update_info_bars;
end;

procedure TForm1.Initializeshutdownsequence1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Are you sure you want to quit?', mtConfirmation, [mbYes, mbNo], 0)<>6 then
    begin
      CanClose := false;
      exit;
    end;
  if not saved then
    if MessageDlg('You have changed the current file since the last save. '#13'Do you want to do it right now?', mtConfirmation, [mbYes, mbNo], 0)=6 then
      save_normalClick(save_normal);
end;

procedure TForm1.Openexistingplan1Click(Sender: TObject);
begin
  if connected then
    begin
      MessageDlg('You cannot open another file while being connected to another server.',mtWarning, [mbOk],0);
      exit;
    end;
  if OpenDialog1.Execute then
    begin
      if not saved then
        if MessageDlg('You have changed the current file since the last save. '#13'Do you want to do it right now?', mtConfirmation, [mbYes, mbNo], 0)=6 then
          save_normalClick(save_normal);
      //Image1.Picture.LoadFromFile(OpenDialog1.FileName);
      Image1.Picture.Bitmap.LoadFromFile(OpenDialog1.FileName);
      Image1.Picture.Bitmap.PixelFormat := pf24bit;
      CurFile := OpenDialog1.FileName;
      update_info_bars;
      broadcastToClients('IMAGE');
    end;
end;

procedure TForm1.save_normalClick(Sender: TObject);
  var directSave: boolean;
begin
  if (TMenuItem(Sender).Name<>'save_as') and (curFile<>'untitled') then directSave := true
    else directSave := false;
  SaveDialog1.InitialDir := GetCurrentDir;
  if (directSave) or (SaveDialog1.Execute) then
    begin
      saved := true;
      if directSave then SaveDialog1.FileName := CurFile;
      Image1.Picture.SaveToFile(SaveDialog1.FileName);
      CurFile := SaveDialog1.FileName;
      update_info_bars;
    end;
end;
procedure setDrawingInfo;
    var canv: TCanvas;
begin
  canv := Form1.Image1.Canvas;
  canv.Pen.Color := foreColor;
  canv.Pen.Style := penStyle;
  canv.Brush.Color := backColor;
  canv.Brush.Style := brushStyle;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var tmp: TColor;
      RGB: _RGB;
begin
  Plan_is_being_modified := true;
  if tool = tool_eye then
    begin
      if Button=mbLeft then cur_color_selected := out_fore_color_preview
        else cur_color_selected := out_back_color_preview;
      tmp := Image1.Canvas.Pixels[x,y];
      dwordToRgb(dword(tmp), RGB);
      bar_red.Position := 255 - RGB.R;
      bar_green.Position := 255 - RGB.G;
      bar_blue.Position := 255 - RGB.B;
      exit;
    end;
  setDrawingInfo;
  if (tool = tool_fill) and (button = mbLeft) then
    begin
      tmp := Image1.Canvas.Pen.Color;
      Image1.Canvas.Pen.Color := Image1.Canvas.Brush.Color;
      Image1.Canvas.Brush.Color := tmp;
      if TCP_Server.Active then
          broadcastToClients('DRAW_','fill', PoIntToStr(Point(x,y)))
      else if (connected) and (TCP_Client.Connected) then
          tellServer('DRAW_','fill', PoIntToStr(Point(x,y)));
      Image1.Canvas.FloodFill(x, y, image1.Canvas.Pixels[x,y], fsSurface);
      exit;
    end;

  saved := false;
  old_pos := point(x,y);
  section_origin := point(x,y);

  if tool = tool_crayon then
    MoveTo(x,y);

  fillchar(total_pen_points, sizeof(TPoint) * 50000, 0);
  total_pen_points := 1;
  pen_points[total_pen_points].X := X;
  pen_points[total_pen_points].Y := Y;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inc(total_pen_points);
  pen_points[total_pen_points].X := X;
  pen_points[total_pen_points].Y := Y;

  setDrawingInfo;
  
  pen_mode := pmCopy;
  propagateModif := true;
  if Plan_is_being_modified then
    begin
      Plan_is_being_modified := false;
      update_plan_section(point(x,y));
      Plan_is_being_modified := false;
    end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
  var tmp: TColor;
      RGB: _RGB;
begin
  if (tool = tool_eye) and (plan_is_being_modified) then
    begin
      tmp := Image1.Canvas.Pixels[x, y];
      dwordToRgb(dword(tmp), RGB);
      bar_red.Position := 255 - RGB.R;
      bar_green.Position := 255 - RGB.G;
      bar_blue.Position := 255 - RGB.B;
      exit;
    end;

  pen_mode := pmNotXor;
  if tool=tool_crayon then pen_mode := pmCopy;
  StatusBar1.Panels[2].Text := IntToStr(X) + ', ' + IntToStr(y) + '        ';
  if plan_is_being_modified then
    begin
      inc(total_pen_points);
      pen_points[total_pen_points].X := X;
      pen_points[total_pen_points].Y := Y;

      update_plan_section(old_pos);
      old_pos := point(X,Y);
      update_plan_section(old_pos);
    end;
end;

procedure TForm1.Newdefenseplan1Click(Sender: TObject);
  var new_bit: TBitmap;
      w, h: integer;
begin
  if connected then
    begin
      MessageDlg('You cannot open another file while being connected to another server.',mtWarning, [mbOk],0);
      exit;
    end;
  if Form2.ShowModal <> mrOk then exit;
  CurFile := 'untitled';
  update_info_bars;

  new_bit := TBitmap.Create;

  w := strtointdef(form2.e_width.Text, 400);
  h := strtointdef(form2.e_height.Text, 400);
  Image1.Width := w;
  Image1.Height := h;

  new_bit.Width := w;
  new_bit.Height := h;
  new_bit.Canvas.FillRect(rect(0, 0, w, h));

  Image1.Picture.Graphic := new_bit;
  Image1.Picture.Bitmap.PixelFormat := pf24bit;
  new_bit.Free;

  broadcastToClients('IMAGE');
end;

procedure TForm1.FormCreate(Sender: TObject);
  var new_bit: TBitmap;
begin
  TCP_Client := TIdTCPClient.Create;
  TCP_Client.IPVersion := Id_IPv4;
  TCP_Client.OnDisconnected := TCP_ClientDisconnected;
  TCP_Client.OnConnected := TCP_ClientConnected;
  TCP_Client.ConnectTimeout := 0;
  TCP_Client.Port := 6666;
  TCP_Client.ReadTimeout := -1;
  TCP_Server := TIdTCPServer.Create;
  TCP_Server.DefaultPort := 6666;
  TCP_Server.OnConnect := TCP_ServerConnect;
  TCP_Server.OnDisconnect := TCP_ServerDisconnect;
  TCP_Server.OnExecute := TCP_ServerExecute;

  if (ParamStr(1) <> '') and (FileExists(ParamStr(1))) then
    begin
      Image1.Picture.Bitmap.LoadFromFile(ParamStr(1));
      CurFile := ParamStr(1);
    end
  else
    begin
      new_bit := TBitmap.Create;
      new_bit.Width := 400;
      new_bit.Height := 300;
      new_bit.Canvas.FillRect(rect(0, 0, 400, 300));
      Image1.Picture.Graphic := new_bit;
      Image1.Picture.Bitmap.PixelFormat := pf24bit;
      new_bit.Free;

      CurFile := 'untitled';
    end;
  update_info_bars;

  saved := true;
  brushStyle := bsClear;
  tool := tool_simple_line;

  imageStream := TMemoryStream.Create;
  cur_color_selected := out_back_color_preview;
  force_color := clWhite;
  bar_Change(nil);
  cur_color_selected := out_fore_color_preview;
  force_color := clBlack;
  bar_Change(nil);

  InitializeCriticalSection(Crit);
end;

procedure TForm1.update_info_bars;
begin
  StatusBar1.Panels[0].Text := 'Current plan: ' + CurFile;
  if connected then StatusBar1.Panels[1].Text := 'Connected to ' + TCP_Client.Host
    else StatusBar1.Panels[1].Text := 'Not connected';
  if TCP_Server.Active then StatusBar1.Panels[1].Text := 'Server listening on port 6666';
  Form1.Caption := 'HyperPaintNet - ' + ExtractFileName(CurFile);
end;

procedure TForm1.tool_change(Sender: TObject);
begin
  if sender=tool_bt_line then tool := tool_simple_line
    else if sender=tool_bt_rect then tool := tool_rect
    else if sender=tool_bt_ellipse then tool := tool_ellipse
    else if sender=tool_bt_rect_round then tool := tool_rect_round
    else if sender=tool_bt_crayon then tool := tool_crayon
    else if sender=tool_bt_fill then begin tool := tool_fill;fill_bt_solid.Down := true;end
    else if sender=tool_bt_eye then tool := tool_eye;
end;

procedure TForm1.BrushStyleChange(Sender: TObject);
begin
  if sender=fill_bt_clear then brushStyle := bsClear
    else if sender=fill_bt_solid then brushStyle := bsSolid
    else if sender=fill_bt_horiz then brushStyle := bsHorizontal
    else if sender=fill_bt_vert then brushStyle := bsVertical
    else if sender=fill_bt_LR_diag then brushStyle := bsFDiagonal
    else if sender=fill_bt_RL_diag then brushStyle := bsBDiagonal
    else if sender=fill_bt_cross then brushStyle := bsCross
    else if sender=fill_bt_diag_cross then brushStyle := bsDiagCross;
end;

procedure TForm1.bar_Change(Sender: TObject);
  var color:dword;
begin
  if sender<>nil then
    begin
      color := (255 - bar_blue.Position) shl 16;
      color := color+((255 - dword(bar_green.Position)) shl 8);
      color := color+(255 - dword(bar_red.Position));
    end
  else color := force_color;
  cur_color_selected.Picture.Bitmap.Width := cur_color_selected.Width;
  cur_color_selected.Picture.Bitmap.Height := cur_color_selected.Height;
  cur_color_selected.Picture.Bitmap.Canvas.Brush.Color := TColor(color);
  cur_color_selected.Picture.Bitmap.Canvas.FloodFill(1, 1, cur_color_selected.Picture.Bitmap.Canvas.Pixels[0, 0], fsSurface);

  foreColor := out_fore_color_preview.Canvas.Pixels[0,0];
  backColor := out_back_color_preview.Canvas.Pixels[0,0];
end;

procedure TForm1.connect_to_serverClick(Sender: TObject);
begin
  if TCP_Server.Active then
    begin
      MessageDlg('You cannot connect to another server while having a server active',mtWarning, [mbOk],0);
      exit;
    end;
  TCP_Client.Host := destination_ip.Text;
  if connect_to_server.Caption = 'Connect' then
    begin
      connect_to_server.Caption := 'Connecting';
      connect_to_server.Enabled := false;
      ClientThread := TClientThread.Create(false);
    end
  else
    begin
      connect_to_server.Caption := 'Disconnecting';
      connect_to_server.Enabled := false;
      TCP_Client.IOHandler.WriteLn('LEAVE');
      ClientThread.Terminate;
    end;
end;


procedure TForm1.TCP_ClientConnected(Sender: TObject);
begin
  {$IFDEF DEBUG}
  client_log.Lines.Add('Connected to ' + destination_ip.Text);
  client_log.Lines.Add('Fetching image');
  {$ENDIF}
  connected := true;
  update_info_bars;
end;

procedure TForm1.TCP_ClientDisconnected(Sender: TObject);
begin
  {$IFDEF DEBUG}
  client_log.Lines.Add('Disconnected from ' + destination_ip.Text);
  {$ENDIF}
  ShowMessage('Disconnected from server');
  connected := false;
  update_info_bars;
end;

procedure TForm1.TCP_ServerExecute(AContext: TIdContext);
  var tmp:string;
begin
  try
    tmp := AContext.Connection.IOHandler.ReadString(5);
    if tmp<>'' then
      begin
        {$IFDEF DEBUG}
        log_memo.Lines.Add('GOT: ' + tmp + ' from ' + AContext.Connection.Socket.Binding.IP + ':' + inttostr(AContext.Connection.Socket.Binding.PeerPort));
        {$ENDIF}
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

procedure TForm1.TCP_ServerConnect(AContext: TIdContext);
  var tmp: string;
begin
  tmp := Format('%s:%d', [AContext.Binding.IP,AContext.Binding.PeerPort]);
  {$IFDEF DEBUG}
  log_memo.lines.add('New client: ' + tmp);
  {$ENDIF}
  EnterCriticalSection(Crit);
    addClient(tmp, AContext);
  LeaveCriticalSection(Crit);

  Form1.WriteImage(AContext);

  updateClientsCounter;
end;

procedure TForm1.TCP_ServerDisconnect(AContext: TIdContext);
  var tmp: string;
begin
  tmp := Format('%s:%d', [AContext.Binding.IP,AContext.Binding.PeerPort]);
  {$IFDEF DEBUG}
  log_memo.lines.add('Client disconnected: ' + tmp);
  {$ENDIF}
  EnterCriticalSection(Crit);
    deleteClient(tmp);
  LeaveCriticalSection(Crit);
  updateClientsCounter;
end;

procedure TForm1.out_fore_color_previewClick(Sender: TObject);
  var tmp: TColor;
      col: DWord;
      R, G, B: dword;
begin
  cur_color_selected := timage(sender);
  cur_color_selected.BringToFront;
  tmp := cur_color_selected.Canvas.Pixels[0, 0];
  col := dword(tmp) and $00FFFFFF;
  R := col shr 16;
  G := (col shl 16) shr 24;
  B := (col shl 24) shr 24;

  bar_red.Position := 255 - B;
  bar_green.Position := 255 - G;
  bar_blue.Position := 255 - R;
end;

procedure TForm1.AnnounceEffectChange(effect:string; data:string = '');
begin
  if TCP_Server.Active then broadcastToClients('EFECT',effect,data)
    else if TCP_Client.Connected then tellServer('EFECT', effect, data);
end;

procedure TForm1.Swapcolors1Click(Sender: TObject);
begin
  AnnounceEffectChange('swap', '');
  effect_main('swap');
end;

procedure TForm1.Invertcolors1Click(Sender: TObject);
begin
  AnnounceEffectChange('invert', '');
  effect_main('invert');
end;

procedure TForm1.Grayscale1Click(Sender: TObject);
begin
  AnnounceEffectChange('grayscale', '');
  effect_main('grayscale');
end;

procedure TForm1.Blur1Click(Sender: TObject);
begin
  AnnounceEffectChange('blur', '');
  effect_main('blur');
end;

procedure TForm1.Eliminatered1Click(Sender: TObject);
  var tmp: dword;
begin
  tmp := 0;
  HexToBin(@TMenuItem(sender).hint[1], @tmp, 6);
  AnnounceEffectChange('remove_col', IntToStr(tmp));
  effect_main('remove_col', tmp);
end;

procedure TForm1.PenStyle_Change(Sender: TObject);
begin
  if Sender=pen_bt_solid then penStyle := psSolid
    else if Sender=pen_bt_dash then penStyle := psDash
    else if Sender=pen_bt_dot then penStyle := psDot
    else if Sender=pen_bt_dash_dot then penStyle := psDashDot
    else if Sender=pen_bt_dash_dot_dot then penStyle := psDashDotDot
    else if Sender=pen_bt_clear then penStyle := psClear;
end;

procedure TForm1.out_fore_color_previewDblClick(Sender: TObject);
begin
  if not ColorDialog1.Execute then exit;
  
  TImage(sender).Picture.Bitmap.Canvas.Brush.Color := ColorDialog1.Color;
  TImage(sender).Picture.Bitmap.Canvas.FloodFill(1, 1, TImage(sender).Picture.Bitmap.Canvas.Pixels[0,0], fsSurface);

  out_fore_color_previewClick(TImage(sender));
end;

procedure TForm1.Image5MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var tmp: TColor;
      RGB: _RGB;
begin
  if Button = mbLeft then cur_color_selected := out_fore_color_preview
    else cur_color_selected := out_back_color_preview;
  tmp := image5.Canvas.Pixels[x,y];
  dwordToRgb(dword(tmp), RGB);
  bar_red.Position := 255 - RGB.R;
  bar_green.Position := 255 - RGB.G;
  bar_blue.Position := 255 - RGB.B;
  bar_Change(cur_color_selected);
end;

procedure TForm1.Brightness1Click(Sender: TObject);
begin
  AnnounceEffectChange('bright', '');
  effect_main('bright');
end;

procedure TForm1.Darkness1Click(Sender: TObject);
begin
  AnnounceEffectChange('dark', '');
  effect_main('dark');
end;

procedure TForm1.Solarize1Click(Sender: TObject);
begin
  AnnounceEffectChange('solarize', '');
  effect_main('solarize');
end;

procedure TForm1.BlacknWhite1Click(Sender: TObject);
begin
  AnnounceEffectChange('blacknwhite', '');
  effect_main('blacknwhite');
end;

procedure TForm1.Whitenblack1Click(Sender: TObject);
begin
  AnnounceEffectChange('whitenblack', '');
  effect_main('whitenblack');
end;

procedure TForm1.Colorize1Click(Sender: TObject);
begin
  AnnounceEffectChange('colorize', '');
  effect_main('colorize');
end;

procedure TForm1.Shipcommander1Click(Sender: TObject);
begin
  MessageDlg('HyperPaintNet by Shocker'#13'For InfoEducatie 2008', mtInformation, [mbOk], 0);
end;

procedure TForm1.Rotatehorizontaly1Click(Sender: TObject);
begin
  AnnounceEffectChange('rotate_180');
  effect_main('rotate_180');
end;

procedure TForm1.Overlaprotatedimage1Click(Sender: TObject);
begin
  AnnounceEffectChange('rotate_merge_overlap');
  effect_main('rotate_merge_overlap');
end;

end.
