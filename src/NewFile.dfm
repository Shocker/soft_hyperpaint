object Form2: TForm2
  Left = 192
  Top = 110
  BorderStyle = bsToolWindow
  Caption = 'New plan'
  ClientHeight = 74
  ClientWidth = 177
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Width:'
  end
  object Label2: TLabel
    Left = 10
    Top = 30
    Width = 34
    Height = 13
    Caption = 'Height:'
  end
  object e_width: TEdit
    Left = 48
    Top = 6
    Width = 121
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Text = '400'
  end
  object e_height: TEdit
    Left = 48
    Top = 30
    Width = 121
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    Text = '400'
  end
  object Button1: TButton
    Left = 114
    Top = 52
    Width = 55
    Height = 17
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
  end
end
