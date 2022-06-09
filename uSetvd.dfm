object frmSetvd: TfrmSetvd
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Video Settings'
  ClientHeight = 289
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pSet: TPanel
    Left = 0
    Top = 0
    Width = 310
    Height = 289
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      310
      289)
    object grpVidSet: TTntGroupBox
      Left = 8
      Top = 8
      Width = 292
      Height = 273
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      DesignSize = (
        292
        273)
      object lblBrightnessDesc: TTntLabel
        Left = 16
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Brightness'
      end
      object lblContrastDesc: TTntLabel
        Left = 16
        Top = 48
        Width = 42
        Height = 13
        Caption = 'Contrast'
      end
      object lblHueDesc: TTntLabel
        Left = 16
        Top = 72
        Width = 19
        Height = 13
        Caption = 'Hue'
      end
      object lblSaturationDesc: TTntLabel
        Left = 16
        Top = 96
        Width = 50
        Height = 13
        Caption = 'Saturation'
      end
      object lblSharpnessDesc: TTntLabel
        Left = 16
        Top = 120
        Width = 50
        Height = 13
        Caption = 'Sharpness'
      end
      object lblGammaDesc: TTntLabel
        Left = 16
        Top = 144
        Width = 35
        Height = 13
        Caption = 'Gamma'
      end
      object lblWhiteBalanceDesc: TTntLabel
        Left = 16
        Top = 192
        Width = 68
        Height = 13
        Caption = 'White Balance'
      end
      object lblBacklightDesc: TTntLabel
        Left = 16
        Top = 216
        Width = 42
        Height = 13
        Caption = 'Backlight'
      end
      object lblGainDesc: TTntLabel
        Left = 16
        Top = 240
        Width = 21
        Height = 13
        Caption = 'Gain'
      end
      object lblColorEnableDesc: TTntLabel
        Left = 16
        Top = 168
        Width = 60
        Height = 13
        Caption = 'Color Enable'
      end
      object trBrightness: TTrackBar
        Left = 88
        Top = 24
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ThumbLength = 10
        TickStyle = tsManual
      end
      object trContrast: TTrackBar
        Tag = 1
        Left = 88
        Top = 48
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ThumbLength = 10
        TickStyle = tsManual
      end
      object trHue: TTrackBar
        Tag = 2
        Left = 88
        Top = 72
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ThumbLength = 10
        TickStyle = tsManual
      end
      object trSaturation: TTrackBar
        Tag = 3
        Left = 88
        Top = 96
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        ThumbLength = 10
        TickStyle = tsManual
      end
      object trSharpness: TTrackBar
        Tag = 4
        Left = 88
        Top = 120
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ThumbLength = 10
        TickStyle = tsManual
      end
      object trGamma: TTrackBar
        Tag = 5
        Left = 88
        Top = 144
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        ThumbLength = 10
        TickStyle = tsManual
      end
      object trColorEnable: TTrackBar
        Tag = 6
        Left = 88
        Top = 168
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        ThumbLength = 10
        TickStyle = tsManual
      end
      object trWhiteBalance: TTrackBar
        Tag = 7
        Left = 88
        Top = 192
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        ThumbLength = 10
        TickStyle = tsManual
      end
      object trBacklight: TTrackBar
        Tag = 8
        Left = 88
        Top = 216
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        ThumbLength = 10
        TickStyle = tsManual
      end
      object trGain: TTrackBar
        Tag = 9
        Left = 88
        Top = 240
        Width = 120
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        ThumbLength = 10
        TickStyle = tsManual
      end
      object cbxBrightness: TCheckBox
        Left = 263
        Top = 24
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 10
      end
      object cbxContrast: TCheckBox
        Left = 263
        Top = 48
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 11
      end
      object cbxHue: TCheckBox
        Left = 263
        Top = 72
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 12
      end
      object cbxSaturation: TCheckBox
        Left = 263
        Top = 96
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 13
      end
      object cbxSharpness: TCheckBox
        Left = 263
        Top = 120
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 14
      end
      object cbxGamma: TCheckBox
        Left = 263
        Top = 144
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 15
      end
      object cbxColorEnable: TCheckBox
        Left = 263
        Top = 168
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 16
      end
      object cbxWhiteBalance: TCheckBox
        Left = 263
        Top = 192
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 17
      end
      object cbxBacklight: TCheckBox
        Left = 263
        Top = 216
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 18
      end
      object cbxGain: TCheckBox
        Left = 263
        Top = 240
        Width = 17
        Height = 17
        Anchors = [akTop, akRight]
        TabOrder = 19
      end
      object edtBrightness: TTntEdit
        Left = 215
        Top = 24
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 20
        Text = '0'
      end
      object edtContrast: TTntEdit
        Tag = 1
        Left = 215
        Top = 48
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 21
        Text = '0'
      end
      object edtHue: TTntEdit
        Tag = 2
        Left = 215
        Top = 72
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 22
        Text = '0'
      end
      object edtSaturation: TTntEdit
        Tag = 3
        Left = 215
        Top = 96
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 23
        Text = '0'
      end
      object edtSharpness: TTntEdit
        Tag = 4
        Left = 215
        Top = 120
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 24
        Text = '0'
      end
      object edtGamma: TTntEdit
        Tag = 5
        Left = 215
        Top = 144
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 25
        Text = '0'
      end
      object edtColorEnable: TTntEdit
        Tag = 6
        Left = 215
        Top = 168
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 26
        Text = '0'
      end
      object edtWhiteBalance: TTntEdit
        Tag = 7
        Left = 215
        Top = 192
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 27
        Text = '0'
      end
      object edtBacklight: TTntEdit
        Tag = 8
        Left = 215
        Top = 216
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 28
        Text = '0'
      end
      object edtGain: TTntEdit
        Tag = 9
        Left = 215
        Top = 240
        Width = 41
        Height = 17
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clBtnFace
        TabOrder = 29
        Text = '0'
      end
    end
  end
end
