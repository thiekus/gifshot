unit uCfg;

{===============================================================================

   Faris's Webcam2GIF Original Source
   Copyright © Faris Khowarizmi 2012
   All Right Reserved

   Coded by Faris Khowarizmi
   Project Started on 28 April 2012

===============================================================================}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LbButton, ExtCtrls, StdCtrls, Spin, ComCtrls, Tambahan, IniFiles,
  ShlObj, DirectShow9, RxCtrls, RXSlider, TntClasses, LangStr, TntStdCtrls,
  TntForms, SXSkinForm;

type
  TfrmCfg = class(TTntForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnOk: TLbButton;
    btnCancel: TLbButton;
    pgcCfg: TPageControl;
    tbVid: TTabSheet;
    tbGaly: TTabSheet;
    grpCapWnd: TTntGroupBox;
    lblWndW: TTntLabel;
    lblWndH: TTntLabel;
    spWndW: TSpinEdit;
    spWndH: TSpinEdit;
    grpCapSet: TTntGroupBox;
    lblIdleSpeed: TTntLabel;
    spIdleSpd: TSpinEdit;
    grpCapDev: TTntGroupBox;
    lblCapDevDesc: TTntLabel;
    cbxCam: TTntComboBox;
    grpGalySet: TTntGroupBox;
    lblGalySetDesc: TTntLabel;
    rdAppdir: TTntRadioButton;
    rdCusdir: TTntRadioButton;
    edtGally: TEdit;
    btnBrowse: TLbButton;
    pbwh: TPaintBox;
    tbLang: TTabSheet;
    grpLangSet: TTntGroupBox;
    lblLangSetDesc: TTntLabel;
    cbxLang: TTntComboBox;
    cbxVsstr: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure pbwhPaint(Sender: TObject);
    procedure DirSelectClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCfg: TfrmCfg;

implementation

uses uMain;

{$R *.dfm}

procedure TfrmCfg.FormShow(Sender: TObject);
var
  //i: integer;
  //DriverName: PChar;
  ini: TIniFile;
  galleryinappdir: boolean;
  LangLst: TTntStringList;
  LangName: WideString;
  LangLoop: integer;
begin

  {$I LangAcc_uCfg.inc}

  pgcCfg.ActivePageIndex:= 0;

  cbxCam.Items.Clear;
  cbxCam.Items.AddStrings(frmMain.VidLst);

  LangLst:= GetLangFiles;
  try
    cbxLang.Clear;
    cbxLang.Items.AddStrings(LangLst);
  finally
    LangLst.Free;
  end;
  
  //cbxCam.ItemIndex:= 0;
  ini:= TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));

  try

    With ini do
      begin

      cbxCam.ItemIndex:= ReadInteger(set_Camera, 'Index', 0);
      spWndW.Value:= ReadInteger(set_Video, 'Width', 0);
      spWndH.Value:= ReadInteger(set_Video, 'Height', 0);
      cbxVsstr.Checked:= ReadBool(set_Video, 'ShowVideoConfigurationOnStartup', TRUE);
      spIdleSpd.Value:= ReadInteger(set_Video, 'IdleSpeed', -1);

      edtGally.Text:= ReadString(set_Gallery, 'CustomGalleryPath', ExtractFilePath(ParamStr(0))+'Gallery\');
      galleryinappdir:= ReadBool(set_Gallery, 'SaveInAppDir', TRUE);

      LangName:= ReadString(set_General, 'Language', '');

      rdAppDir.Checked:= galleryinappdir;
      rdCusdir.Checked:= not galleryinappdir;

      DirSelectClick(nil);

    end;

  finally

    ini.Free;

  end;

  if cbxLang.Items.Count > 0 then
    for LangLoop:= 0 to cbxLang.Items.Count-1 do
      if cbxLang.Items[LangLoop] = LangName then
        cbxLang.ItemIndex:= LangLoop;

end;

procedure TfrmCfg.pbwhPaint(Sender: TObject);
begin
  if IsWindowsXpOrHigher then
    DrawGradient($00ECCE94, $00FCE6D4, FALSE, pbwh.Canvas, pbwh.ClientRect);
end;

procedure TfrmCfg.DirSelectClick(Sender: TObject);
begin

  edtGally.Enabled:= rdCusdir.Checked;
  btnBrowse.Enabled:= rdCusdir.Checked;

end;

procedure TfrmCfg.btnOkClick(Sender: TObject);
var
  ini: TIniFile;
begin

  ini:= TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));

  try

    With ini do
      begin

      WriteInteger(set_Camera, 'Index', cbxCam.ItemIndex);
      WriteInteger(set_Video, 'Width', spWndW.Value);
      WriteInteger(set_Video, 'Height', spWndH.Value);
      WriteBool(set_Video, 'ShowVideoConfigurationOnStartup', cbxVsstr.Checked);
      WriteInteger(set_Video, 'IdleSpeed', spIdleSpd.Value);

      WriteString(set_Gallery, 'CustomGalleryPath', edtGally.Text);

      WriteBool(set_Gallery, 'SaveInAppDir', rdAppDir.Checked);

      WriteString(set_General, 'Language', cbxLang.Items[cbxLang.ItemIndex]);

    end;

  finally

    ini.Free;

  end;

  frmMain.TutupCamera;
  LoadSetLanguage;
  frmMain.BacaKonfigurasi;
  frmMain.Hide;
  frmMain.Show;
  frmMain.BukaCamera(TRUE);

end;

procedure TfrmCfg.btnBrowseClick(Sender: TObject);
var
  dirstr: string;
begin
  dirstr:= BrowseDialog('Select the location of Gallery.', BIF_RETURNONLYFSDIRS);
  if dirstr <> '' then
    edtGally.Text:= dirstr;
end;

end.
