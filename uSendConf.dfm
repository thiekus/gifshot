object frmSendConf: TfrmSendConf
  Left = 698
  Top = 419
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Send to...'
  ClientHeight = 243
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = TntFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pAtas: TPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 197
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object pbAtas: TPaintBox
      Left = 2
      Top = 2
      Width = 384
      Height = 193
      Align = alClient
      OnPaint = pbAtasPaint
    end
    object bvSel: TBevel
      Left = 16
      Top = 48
      Width = 353
      Height = 57
      Shape = bsFrame
      Style = bsRaised
    end
    object lblSendDesc: TTntLabel
      Left = 16
      Top = 16
      Width = 238
      Height = 16
      Caption = 'Select the ways to send your result!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSendMailDesc: TTntLabel
      Left = 40
      Top = 80
      Width = 228
      Height = 13
      Caption = 'Send via e-Mail through your default mail client.'
    end
    object lblSendDevDesc: TTntLabel
      Left = 40
      Top = 144
      Width = 317
      Height = 13
      Caption = 
        'Send to aviable portable drive from protable device you attached' +
        '.'
    end
    object rbSendMail: TTntRadioButton
      Left = 24
      Top = 56
      Width = 337
      Height = 17
      Cursor = crHandPoint
      Caption = 'Send to Mail'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = rbSendMailClick
    end
    object rbSendDev: TTntRadioButton
      Left = 24
      Top = 120
      Width = 337
      Height = 17
      Cursor = crHandPoint
      Caption = 'Send to portable drive'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = rbSendDevClick
    end
  end
  object pBawah: TPanel
    Left = 0
    Top = 197
    Width = 388
    Height = 46
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      388
      46)
    object pbBawah: TPaintBox
      Left = 2
      Top = 2
      Width = 384
      Height = 42
      Align = alClient
      OnPaint = pbBawahPaint
    end
    object btnOk: TLbButton
      Left = 176
      Top = 10
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Color = 15519380
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LightColor = 16574164
      ModalResult = 1
      NumGlyphs = 2
      ParentColor = False
      ParentFont = False
      ShadowColor = clBlack
      Style = bsModern
      TabOrder = 0
      UseHotTrackFont = False
    end
    object btnCancel: TLbButton
      Left = 280
      Top = 10
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      Color = 15519380
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LightColor = 16574164
      ModalResult = 2
      NumGlyphs = 2
      ParentColor = False
      ParentFont = False
      ShadowColor = clBlack
      Style = bsModern
      TabOrder = 1
      UseHotTrackFont = False
    end
  end
end
