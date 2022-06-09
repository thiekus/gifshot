unit uSetvd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, TntStdCtrls, ExtCtrls, DirectShow9, LangStr;

type
  TPropertiesItem = packed record
    Min : Integer;
    Max : Integer;
    StepDelta : Integer;
    Step: Integer;
    Default : LongInt;
    Value : Integer;
    Flags : tagVideoProcAmpFlags;
  end;

type
  TfrmSetvd = class(TForm)
    pSet: TPanel;
    grpVidSet: TTntGroupBox;
    lblBrightnessDesc: TTntLabel;
    lblContrastDesc: TTntLabel;
    lblHueDesc: TTntLabel;
    lblSaturationDesc: TTntLabel;
    lblSharpnessDesc: TTntLabel;
    lblGammaDesc: TTntLabel;
    lblWhiteBalanceDesc: TTntLabel;
    lblBacklightDesc: TTntLabel;
    lblGainDesc: TTntLabel;
    lblColorEnableDesc: TTntLabel;
    trBrightness: TTrackBar;
    trContrast: TTrackBar;
    trHue: TTrackBar;
    trSaturation: TTrackBar;
    trSharpness: TTrackBar;
    trGamma: TTrackBar;
    trColorEnable: TTrackBar;
    trWhiteBalance: TTrackBar;
    trBacklight: TTrackBar;
    trGain: TTrackBar;
    cbxBrightness: TCheckBox;
    cbxContrast: TCheckBox;
    cbxHue: TCheckBox;
    cbxSaturation: TCheckBox;
    cbxSharpness: TCheckBox;
    cbxGamma: TCheckBox;
    cbxColorEnable: TCheckBox;
    cbxWhiteBalance: TCheckBox;
    cbxBacklight: TCheckBox;
    cbxGain: TCheckBox;
    edtBrightness: TTntEdit;
    edtContrast: TTntEdit;
    edtHue: TTntEdit;
    edtSaturation: TTntEdit;
    edtSharpness: TTntEdit;
    edtGamma: TTntEdit;
    edtColorEnable: TTntEdit;
    edtWhiteBalance: TTntEdit;
    edtBacklight: TTntEdit;
    edtGain: TTntEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    VideoProcAmp: IAMVideoProcAmp;
    VPAFlags : array[0..9] of {tag}TVideoProcAmpFlags;

    procedure ReadVideoProp;
    // Event OnChange untuk trackbar setting
    procedure VideoPropChange(Sender: TObject);
    procedure AutoSettingCheck(Sender: TObject);

    function GetVideoPropIdx(idx: integer): TVideoProcAmpProperty;

  public
    { Public declarations }
  end;

var
  frmSetvd: TfrmSetvd;

implementation

uses uMain;

{$R *.dfm}

{ TfrmSetvd }

procedure TfrmSetvd.ReadVideoProp;

  procedure GetProperties(Tag: {tag}TVideoProcAmpProperty; var RetFlags : {tag}TVideoProcAmpFlags;
                          SetTrackbar: TTrackBar; SetEdit: TTntEdit; SetCheckbox: TCheckBox);
  var
    DestProp: TPropertiesItem;
  begin

    with DestProp do
      begin

      if VideoProcAmp.GetRange(Tag, Min, Max, StepDelta, Default, Flags) = Windows.S_OK then
        begin

        Step:= Default;
        VideoProcAmp.Get(Tag, Value, Flags);

        RetFlags:= Flags;
        SetTrackbar.Enabled:= TRUE;
        SetEdit.Enabled:= TRUE;
        SetCheckbox.Enabled:= TRUE;
        SetCheckbox.Checked:= Flags = VideoProcAmp_Flags_Auto;
        SetTrackbar.Min:= Min;
        SetTrackbar.Max:= Max;
        {if (Value < Min) or (Value > Max) then
          begin
          if not Succeeded(VideoProcAmp.Get(Tag, Value, Flags)) then
            Value:= Default;
        end;}
        //SetTrackbar.Position:= DestProp.Default;
        //SetCaption.Caption:= IntToStr(DestProp.Default);
        SetTrackbar.Position:= Value;
        SetEdit.Text:= IntToStr(Value);
        SetTrackbar.OnChange:= VideoPropChange;
        SetEdit.OnChange:= VideoPropChange;
        SetCheckbox.OnClick:= AutoSettingCheck;

      end
      else
        begin
        SetTrackbar.Enabled:= FALSE;
        SetEdit.Enabled:= FALSE;
        SetEdit.Text:= '0';
        SetCheckbox.Enabled:= FALSE;
        SetCheckbox.Checked:= FALSE;
      end;

    end;

  end;

begin

  if Succeeded(frmMain.filter.QueryInterface(IID_IAMVideoProcAmp, VideoProcAmp)) then
    begin

    GetProperties(VideoProcAmp_Brightness, VPAFlags[0], trBrightness, edtBrightness, cbxBrightness);
    GetProperties(VideoProcAmp_Contrast, VPAFlags[1], trContrast, edtContrast, cbxContrast);
    GetProperties(VideoProcAmp_Hue, VPAFlags[2], trHue, edtHue, cbxHue);
    GetProperties(VideoProcAmp_Saturation, VPAFlags[3], trSaturation, edtSaturation, cbxSaturation);
    GetProperties(VideoProcAmp_Sharpness, VPAFlags[4], trSharpness, edtSharpness, cbxSharpness);
    GetProperties(VideoProcAmp_Gamma, VPAFlags[5], trGamma, edtGamma, cbxGamma);
    GetProperties(VideoProcAmp_ColorEnable, VPAFlags[6], trColorEnable, edtColorEnable, cbxColorEnable);
    GetProperties(VideoProcAmp_WhiteBalance, VPAFlags[7], trWhiteBalance, edtWhiteBalance, cbxWhiteBalance);
    GetProperties(VideoProcAmp_BacklightCompensation, VPAFlags[8], trBacklight, edtBacklight, cbxBacklight);
    GetProperties(VideoProcAmp_Gain, VPAFlags[9], trGain, edtGain, cbxGain);

  end;

end;

procedure TfrmSetvd.VideoPropChange(Sender: TObject);
var
  Posisi: integer;
  stag: integer;

  procedure UpdateSetting(var edt: TTntEdit; var trb: TTrackBar);
  var
    SetTag: TVideoProcAmpProperty;
  begin

    SetTag:= GetVideoPropIdx(stag);

    if Succeeded(frmMain.filter.QueryInterface(IID_IAMVideoProcAmp,VideoProcAmp)) then
      begin
      if Succeeded(VideoProcAmp.Set_(SetTag, Posisi, VPAFlags[stag])) then
        begin
        edt.Text:= IntToStr(Posisi);
        trb.Position:= Posisi;
      end;
    end;

  end;

  function GetFromEdit(var edt: TTntEdit): integer;
  var
    p: integer;
    sb: string;
  begin

    Result:= 0;
    if edt.Text <> '' then
      begin
      sb:= '';
      for p:= 1 to Length(edt.Text) do
        if (Ord(edt.Text[p]) >= Ord('0')) and (Ord(edt.Text[p]) <= Ord('9')) then
          sb:= sb+edt.Text[p];
      edt.Text:= sb;
      Result:= StrToInt(edt.Text);
    end
    else
      edt.Text:= '0';

  end;

begin

  Posisi:= 0;

  if Sender is TTrackBar then
    begin
    Posisi:= TTrackBar(Sender).Position;
    stag:= TTrackBar(Sender).Tag;
  end
  else
  if Sender is TTntEdit then
    begin
    Posisi:= GetFromEdit(TTntEdit(Sender));
    stag:= TTntEdit(Sender).Tag;
  end
  else
    Exit;

  case stag of
    0: UpdateSetting(edtBrightness, trBrightness);
    1: UpdateSetting(edtContrast, trContrast);
    2: UpdateSetting(edtHue, trHue);
    3: UpdateSetting(edtSaturation, trSaturation);
    4: UpdateSetting(edtSharpness, trSharpness);
    5: UpdateSetting(edtGamma, trGamma);
    6: UpdateSetting(edtColorEnable, trColorEnable);
    7: UpdateSetting(edtWhiteBalance, trWhiteBalance);
    8: UpdateSetting(edtBacklight, trBacklight);
    9: UpdateSetting(edtGain, trGain);
  end;

end;

procedure TfrmSetvd.AutoSettingCheck(Sender: TObject);
var
  stag: integer;
  PrcAmp: TVideoProcAmpProperty;
  crval: integer;
  flags: TVideoProcAmpFlags;
begin

  if Sender is TCheckBox then
    stag:= TCheckBox(Sender).Tag
  else
    Exit;

  PrcAmp:= GetVideoPropIdx(stag);

  if Succeeded(frmMain.filter.QueryInterface(IID_IAMVideoProcAmp, VideoProcAmp)) then
    begin

    VideoProcAmp.Get(PrcAmp, crval, flags);

    if TCheckBox(Sender).Checked then
      flags:= VideoProcAmp_Flags_Auto
    else
      flags:= VideoProcAmp_Flags_Manual;

    VideoProcAmp.Set_(PrcAmp, crval, flags);

  end;

end;


{$WARNINGS OFF}
function TfrmSetvd.GetVideoPropIdx(idx: integer): TVideoProcAmpProperty;
begin
  case idx of
    0: Result:= VideoProcAmp_Brightness;
    1: Result:= VideoProcAmp_Contrast;
    2: Result:= VideoProcAmp_Hue;
    3: Result:= VideoProcAmp_Saturation;
    4: Result:= VideoProcAmp_Sharpness;
    5: Result:= VideoProcAmp_Gamma;
    6: Result:= VideoProcAmp_ColorEnable;
    7: Result:= VideoProcAmp_WhiteBalance;
    8: Result:= VideoProcAmp_BacklightCompensation;
    9: Result:= VideoProcAmp_Gain;
  end;
end;
{$WARNINGS ON}

//==============================================================================

procedure TfrmSetvd.FormShow(Sender: TObject);
begin

  {$I LangAcc_uSetvd.inc}

  Left:= 0;
  Top:= 0;

  ReadVideoProp;

end;

end.
