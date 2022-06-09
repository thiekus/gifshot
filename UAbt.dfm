object frmAbt: TfrmAbt
  Left = 197
  Top = 119
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'About'
  ClientHeight = 314
  ClientWidth = 626
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
    0000FF00FF00FFFF0000FFFFFF00000000000000000000077000000000000000
    0000000000000077700000000000000000000000000000077000000000000000
    0000000000000F077000000000000000000000000000FF077000000000000000
    00000000070FFF07700000000000000000000077770FFF077777000000000000
    00007770008FFF07777777000000000000070008FFFFFF800077777000000000
    00008FFFFFFFFFFFF800777700000000008FFFFFFFFFFFFFFFF8077770000000
    0FFFFFFFFFFFFFFFFFFFF07777000000FFFFFFFFF8CC8FFFFFFFFF077770007F
    FFFFFFFFFCCCCFFFFFFFFFF07770078FFFFFFFFFFCCCCFFFFFFFFFF8077707FF
    FFFFFFFFF8CC8FFFFFFFFFFF077778FFFFFFFFFFFFFFFFFFFFFFFFFF80777FFF
    FFFFFFFFFFCCFFFFFFFFFFFFF0777FFFFFFFFFFFFFCC8FFFFFFFFFFFF0777FFF
    FFFFFFFFFFCCCFFFFFFFFFFFF0777FFFFFFFFFFFFF8CCCFFFFFFFFFFF0777FFF
    FFFFFF8CC8FCCCCFFFFFFFFFF07078FFFFFFFFCCCCF8CCCCFFFFFFFF807007FF
    FFFFFFCCCCFFCCCCFFFFFFFF0700078FFFFFFFCCFFFFCCCCFFFFFFF80000007F
    FFFFFF8C8FFCCCC8FFFFFFF000000007FFFFFFF8CCCCCC8FFFFFFF0000000000
    7FFFFFFFFFFFFFFFFFFFF00000000000078FFFFFFFFFFFFFFFF8700000000000
    00778FFFFFFFFFFFF87700000000000000007778FFFFFF877700000000000000
    0000000777777770000000000000FFFFE7FFFFFFC7FFFFFF87FFFFFF07FFFFFE
    07FFFFF807FFFFC000FFFF00003FFE00001FFC00000FF8000007F0000003E000
    0001C00000018000000080000000000000000000000000000000000000000000
    000000000001000000018000000380000007C000000FE000001FF000003FF800
    007FFC0000FFFF0003FFFFE01FFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000700000000
    00070F07000000000700FF0700000000008FFF07700000008FFFFF0077000078
    FFF8FFF8077007FFFF8C8FFFF07007FFFFF8FFFFF0777FFFFFFCFFFFFF077FFF
    FFFCCFFFFF077FFFFFF8CCFFFF077FFFFCCFCCFFFF0007FFF8CCC8FFF000078F
    FF8C8FFFF00000778FFFFFF770000000777777700000FF8F0000FE0F0000F80F
    0000F0070000E0030000C0010000800100008000000000000000000000000000
    0000000100008003000080030000C0070000F01F0000}
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  OnPaint = FormPaint
  OnShow = FormShow
  DesignSize = (
    626
    314)
  PixelsPerInch = 96
  TextHeight = 13
  object imgLogo: TImage
    Left = 8
    Top = 8
    Width = 256
    Height = 256
  end
  object Bevel1: TBevel
    Left = 8
    Top = 272
    Width = 609
    Height = 2
    Shape = bsBottomLine
  end
  object lblUpd: TLabel
    Left = 8
    Top = 288
    Width = 337
    Height = 13
    Cursor = crHandPoint
    Alignment = taCenter
    AutoSize = False
    Caption = 'Check and update to the lastest version now!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblUpdClick
    OnMouseMove = lblUpdMouseMove
  end
  object imgExp: TImage
    Left = 144
    Top = 72
    Width = 96
    Height = 90
    OnClick = imgExpClick
  end
  object pAb1: TPanel
    Left = 272
    Top = 8
    Width = 345
    Height = 137
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    OnMouseMove = FormMouseMove
    DesignSize = (
      345
      137)
    object ProgramIcon: TImage
      Left = 24
      Top = 16
      Width = 32
      Height = 32
      AutoSize = True
      Stretch = True
      IsControl = True
    end
    object ProductName: TLabel
      Left = 88
      Top = 16
      Width = 86
      Height = 13
      Caption = 'Webcam to GIF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Version: TLabel
      Left = 88
      Top = 32
      Width = 54
      Height = 13
      Caption = 'Version 0.5'
      IsControl = True
    end
    object Copyright: TLabel
      Left = 8
      Top = 56
      Width = 169
      Height = 13
      Caption = 'Copyright '#169' Faris Khowarizmi 2012'
      IsControl = True
    end
    object Comments: TLabel
      Left = 8
      Top = 72
      Width = 329
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 
        'Kritik dan saran bisa disampaikan melalui eMail yang tertera dib' +
        'awah atau langsung ke Website kami.'
      WordWrap = True
      IsControl = True
    end
    object lblMail: TLabel
      Left = 8
      Top = 112
      Width = 96
      Height = 13
      Cursor = crHandPoint
      Caption = 'thekill96@gmail.com'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblMailClick
      OnMouseMove = lblMailMouseMove
    end
    object lblWeb: TLabel
      Left = 208
      Top = 112
      Width = 128
      Height = 13
      Cursor = crHandPoint
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'http://sifaris.blogspot.com'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblWebClick
      OnMouseMove = lblWebMouseMove
    end
  end
  object btnOk: TLbButton
    Left = 488
    Top = 281
    Width = 122
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Color = 15519380
    Default = True
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
    TabOrder = 3
    UseHotTrackFont = False
  end
  object pAb2: TPanel
    Left = 272
    Top = 152
    Width = 345
    Height = 113
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object PhysMemDesc: TLabel
      Left = 8
      Top = 8
      Width = 154
      Height = 13
      Caption = 'Physical Memory Available:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object FreeResDesc: TLabel
      Left = 8
      Top = 40
      Width = 87
      Height = 13
      Caption = 'Memory in Use:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object OsNameDesc: TLabel
      Left = 8
      Top = 72
      Width = 105
      Height = 13
      Caption = 'Operating System:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PhysMem: TLabel
      Left = 8
      Top = 24
      Width = 45
      Height = 13
      Caption = 'PhysMem'
    end
    object FreeRes: TLabel
      Left = 8
      Top = 56
      Width = 40
      Height = 13
      Caption = 'FreeRes'
    end
    object OsName: TLabel
      Left = 8
      Top = 88
      Width = 40
      Height = 13
      Caption = 'OsName'
    end
  end
  object btnCredits: TLbButton
    Left = 360
    Top = 281
    Width = 122
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Credits'
    Color = 15519380
    HotTrackFont.Charset = ANSI_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    LightColor = 16574164
    ModalResult = 0
    ParentColor = False
    ShadowColor = clBlack
    Style = bsModern
    TabOrder = 2
    UseHotTrackFont = False
    OnClick = btnCreditsClick
  end
  object pnlCredits: TPanel
    Left = 272
    Top = 8
    Width = 345
    Height = 257
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object creds: TMemo
      Left = 8
      Top = 8
      Width = 329
      Height = 241
      Color = clBtnFace
      Lines.Strings = (
        'creds')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
