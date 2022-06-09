object frmExcLog: TfrmExcLog
  Left = 192
  Top = 124
  Width = 362
  Height = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Exceptions List'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmExcp: TMemo
    Left = 0
    Top = 0
    Width = 346
    Height = 161
    Align = alClient
    Color = clBtnFace
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 192
    Top = 40
  end
end
