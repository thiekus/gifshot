object frmCfg: TfrmCfg
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configuration'
  ClientHeight = 391
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00887777007700000000000000000000008887
    7770077000000000000000000000F8887777007700000000000000000000FF88
    8777700770000000000000000000FFF88877770077000000000000000000FFFF
    88877770077000000000000000000FFFF88877770077000000000000000000FF
    FF88877770077000000000000000000FFFF88877770077777777777000000000
    FFFF88877770077777777777000000000FFFF888777700000000000770000000
    00FFFF88877777777777777077000000000FFFF8887777777777777707700000
    0000FFFF88877777777777777077000000000FFFF88888888888887777070000
    000000FFFFFFFFFFFFFFFF87777000000000000FFF77770000008FF877700000
    0000000FF8777077000008F8777000000000000FF87770770000008877700000
    0000000FF877707700000008777000000000000FF87770770000000877700000
    0000000FF877707700000008777000000000000FF87770770000000877700000
    0000000FF87770777000000F777000000000000FF877770777777000F8700000
    0000000FF8777770777777000FF000000000000FFF8777770000077000000000
    00000000FFF877777777707700000000000000000FFF87777777770770000000
    0000000000FFF888888887707000000000000000000FFFFFFFFFF87070000000
    0000000000000000000000007000003FFFFF001FFFFF000FFFFF0007FFFF0003
    FFFF0001FFFF0000FFFF80007FFFC000001FE000000FF0000007F8000003FC00
    0001FE000000FF000000FF800000FFC00000FFC00F00FFC00F80FFC00FC0FFC0
    0FC0FFC00FC0FFC00FC0FFC007C0FFC00060FFC00030FFC00018FFE0000FFFF0
    0007FFF80007FFFC0007FFFE0007280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008877070000000000F887
    707000000000FF887707000000000FF887707000000000FF887707777000000F
    F887700007000000FF887777707000000FF88FFF8707000000F70000F8700000
    00F707000F80000000F707000080000000F707700080000000F7707770000000
    000F7700070000000000FFFFF000000000000000000003FF000001FF000000FF
    0000007F000080070000C0030000E0010000F0000000F8000000F8300000F838
    0000F8180000F8040000FC030000FE030000FF030000}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 350
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object pgcCfg: TPageControl
      Left = 2
      Top = 2
      Width = 456
      Height = 346
      ActivePage = tbVid
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object tbVid: TTabSheet
        Caption = 'Video'
        object grpCapWnd: TTntGroupBox
          Left = 8
          Top = 96
          Width = 433
          Height = 105
          Caption = 'Capture Window'
          TabOrder = 1
          object lblWndW: TTntLabel
            Left = 16
            Top = 24
            Width = 69
            Height = 13
            Caption = 'Window Width'
          end
          object lblWndH: TTntLabel
            Left = 120
            Top = 24
            Width = 72
            Height = 13
            Caption = 'Window Height'
          end
          object spWndW: TSpinEdit
            Left = 16
            Top = 40
            Width = 81
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 640
          end
          object spWndH: TSpinEdit
            Left = 120
            Top = 40
            Width = 81
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 480
          end
          object cbxVsstr: TCheckBox
            Left = 16
            Top = 72
            Width = 265
            Height = 17
            Caption = 'Show Video Settings when startup'
            TabOrder = 2
          end
        end
        object grpCapSet: TTntGroupBox
          Left = 8
          Top = 208
          Width = 433
          Height = 81
          Caption = 'Capture Settings'
          TabOrder = 2
          object lblIdleSpeed: TTntLabel
            Left = 16
            Top = 24
            Width = 222
            Height = 13
            Caption = 'Preview video speed when not recorded (FPS)'
          end
          object spIdleSpd: TSpinEdit
            Left = 16
            Top = 40
            Width = 81
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 20
          end
        end
        object grpCapDev: TTntGroupBox
          Left = 8
          Top = 8
          Width = 433
          Height = 81
          Caption = 'Capture Device'
          TabOrder = 0
          object lblCapDevDesc: TTntLabel
            Left = 16
            Top = 24
            Width = 200
            Height = 13
            Caption = 'Select the default capture device you use'
          end
          object cbxCam: TTntComboBox
            Left = 16
            Top = 40
            Width = 265
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
          end
        end
      end
      object tbGaly: TTabSheet
        Caption = 'Gallery'
        ImageIndex = 1
        object grpGalySet: TTntGroupBox
          Left = 8
          Top = 8
          Width = 433
          Height = 145
          Caption = 'Gallery location'
          TabOrder = 0
          object lblGalySetDesc: TTntLabel
            Left = 16
            Top = 24
            Width = 174
            Height = 13
            Caption = 'Select the default location of Gallery'
          end
          object rdAppdir: TTntRadioButton
            Left = 16
            Top = 48
            Width = 225
            Height = 17
            Caption = 'In application folder'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = DirSelectClick
          end
          object rdCusdir: TTntRadioButton
            Left = 16
            Top = 72
            Width = 225
            Height = 17
            Caption = 'Other location'
            TabOrder = 1
            OnClick = DirSelectClick
          end
          object edtGally: TEdit
            Left = 32
            Top = 96
            Width = 265
            Height = 21
            Enabled = False
            TabOrder = 2
          end
          object btnBrowse: TLbButton
            Left = 304
            Top = 96
            Width = 100
            Height = 17
            Caption = 'Browse'
            Color = 15519380
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            HotTrackFont.Charset = ANSI_CHARSET
            HotTrackFont.Color = clWindowText
            HotTrackFont.Height = -11
            HotTrackFont.Name = 'Tahoma'
            HotTrackFont.Style = []
            LightColor = 16574164
            ModalResult = 0
            NumGlyphs = 2
            ParentColor = False
            ParentFont = False
            ShadowColor = clBlack
            Style = bsModern
            TabOrder = 3
            UseHotTrackFont = False
            OnClick = btnBrowseClick
          end
        end
      end
      object tbLang: TTabSheet
        Caption = 'Language'
        ImageIndex = 3
        object grpLangSet: TTntGroupBox
          Left = 8
          Top = 8
          Width = 433
          Height = 97
          Caption = 'Language'
          TabOrder = 0
          object lblLangSetDesc: TTntLabel
            Left = 16
            Top = 24
            Width = 141
            Height = 13
            Caption = 'Select the interface language'
          end
          object cbxLang: TTntComboBox
            Left = 16
            Top = 48
            Width = 249
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 350
    Width = 460
    Height = 41
    Align = alBottom
    Anchors = [akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      460
      41)
    object pbwh: TPaintBox
      Left = 2
      Top = 2
      Width = 456
      Height = 37
      Align = alClient
      OnPaint = pbwhPaint
    end
    object btnOk: TLbButton
      Left = 245
      Top = 8
      Width = 100
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Color = 15519380
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
      ShadowColor = clBlack
      Style = bsModern
      TabOrder = 0
      UseHotTrackFont = False
      OnClick = btnOkClick
    end
    object btnCancel: TLbButton
      Left = 349
      Top = 8
      Width = 100
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      Color = 15519380
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
      ShadowColor = clBlack
      Style = bsModern
      TabOrder = 1
      UseHotTrackFont = False
    end
  end
end
