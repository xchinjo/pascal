object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 179
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 11
    Top = 21
    Width = 29
    Height = 13
    Caption = 'Token'
  end
  object Button1: TButton
    Left = 399
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edMessage: TEdit
    Left = 48
    Top = 64
    Width = 313
    Height = 21
    TabOrder = 1
    Text = 'message'
  end
  object edToken: TEdit
    Left = 48
    Top = 18
    Width = 313
    Height = 21
    TabOrder = 2
    Text = '{Token}'
  end
end
