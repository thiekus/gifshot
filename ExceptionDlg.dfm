object ExceptionDialog: TExceptionDialog
  Left = 636
  Top = 122
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'ExceptionDialog'
  ClientHeight = 283
  ClientWidth = 483
  Color = clBtnFace
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    483
    283)
  PixelsPerInch = 96
  TextHeight = 13
  object BevelDetails: TBevel
    Left = 3
    Top = 119
    Width = 473
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object SendBtn: TLbButton
    Left = 403
    Top = 32
    Width = 75
    Height = 25
    Hint = 'Send bug report using default mail client'
    Anchors = [akTop, akRight]
    Caption = '&Send'
    Color = 15519380
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF4193C9378BC63689C53487C43285C33184C23082C12E80
      C02D7EBF2B7CBF5696CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D9DCFDDECF6BD
      EEF9ACEAF8ABEAF8ABEAF8ABEAF8ADEAF8D4F3FBA4C8E46DA6D3FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFAED4EA8EC2E197E8F961DCF65BDBF53288C25BDBF56ADE
      F6B1E7F63F8EC7DCEAF5AA7D60B56D3EBC733CBF793FC27D43C081485D98B4AB
      DBEF74E0F758DAF558DAF55DDBF590E6F892C1E175878DAA7D60AF724CF8F3EE
      F5ECE4FBF5F0FBF7F1FBF7F3C9E1EB7BBDDFA2EAF961DCF63187C277E1F7B6DE
      F058A3CFE2D6CEB6885BBE703DFCF9F5ECD0BCF9E4D6FEECDFFEEBDFFDEBDE8D
      C1D7ACD9EC82E3F83388C2ACEDFA449ECFB3BBBCF3EBE3C78B51C27646FDFBF8
      F9E3D2ECCFB9F8E1D0FDE7D6F4D5BDD0BDA95CB0D3B4EBF88EE6F8B5DDEE7AB1
      C8F5DAC4F8F2ECC98C50C57D50FDFBF9FDE9D8F9E1D0EBCAB3ECC5A7E3B698F7
      E7DDA7CFDDA4D7EBDCF4FB5BB0D4D5D1C6FCDFC6F8F3EDC88D50C9865BFDFBF9
      FDE8D7FDE6D4EDC6ABDCAA89F9ECE3FFFBF9F6F8F873C2DEABDBED9ABABFFCDB
      C0FCDBC0F8F3EDC88C50CC8E66FDFBF9FDE5D3F1CCB2E3B596F9EAE0FFF9F5FE
      F3EAFEF4EDC9E7F07EC7E0D7B194F0C19EFCD7B7F8F3EDC88C50D09670FDFBF9
      F1CDB1E3B596F9E9DEFEF7F1FDEDE1FEEFE4FEF1E7FEF3EAFFFAF7F9ECE3E2AE
      8AF0BC95F8F4ECC88C50D39D7CFBF6F2E3B496F9E8DCFEF5EEFDE9DAFDEADCFD
      ECDEFDEDE1FEEFE4FEF1E7FFFAF6F9EAE0E2AA85F1E4D9C88C51DCB7A0FDFAF8
      FCF5F1FFFCF9FFFCF9FFFCF9FFFCF9FFFCFAFFFCFAFFFCFAFFFCFBFFFDFBFFFD
      FCFBF6F3F8EFEAB78A5ED6B39DD7A98BD19972CC9065CC8F63CB8F61CA8D5EC9
      8C5CC88B59C78957C68754C58551C5834FC38753BA885CAA7D60FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    LightColor = 16574164
    ModalResult = 0
    NumGlyphs = 1
    ParentColor = False
    ParentFont = False
    ShadowColor = clBlack
    Style = bsModern
    TabOrder = 0
    UseHotTrackFont = False
    OnClick = SendBtnClick
  end
  object TextMemo: TMemo
    Left = 56
    Top = 8
    Width = 332
    Height = 105
    Hint = 'Use Ctrl+C to copy the report to the clipboard'
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsNone
    Ctl3D = True
    ParentColor = True
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    WantReturns = False
  end
  object OkBtn: TLbButton
    Left = 403
    Top = 4
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'OK'
    Color = 15519380
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
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
    Kind = bkOK
    LightColor = 16574164
    ModalResult = 1
    NumGlyphs = 2
    ParentColor = False
    ParentFont = False
    ShadowColor = clBlack
    Style = bsModern
    TabOrder = 2
    UseHotTrackFont = False
  end
  object DetailsBtn: TLbButton
    Left = 403
    Top = 88
    Width = 75
    Height = 25
    Hint = 'Show or hide additional information|'
    Anchors = [akTop, akRight]
    Caption = '&Details'
    Color = 15519380
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    LightColor = 16574164
    ModalResult = 0
    ParentColor = False
    ParentFont = False
    ShadowColor = clBlack
    Style = bsModern
    TabOrder = 3
    UseHotTrackFont = False
    OnClick = DetailsBtnClick
  end
  object DetailsMemo: TMemo
    Left = 4
    Top = 129
    Width = 472
    Height = 147
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
    WantReturns = False
    WordWrap = False
  end
end
