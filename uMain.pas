unit uMain;

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
  Dialogs, ActnList, LbSpeedButton, ExtCtrls, ImgList, IniFiles, Menus, ComCtrls,
  LbButton, Spin, StdCtrls, TntStdCtrls, UnicodeAdds, LangStr, Tambahan,
  DSPack, DSUtil, DirectShow9, SXSkinForm, SXSkinLibrary, TntForms;

const
  DefaultVideoWidthSize  = 640;
  DefaultVideoHeightSize = 480;

  DefaultFrameSpeed = 20;                         // FPS
  DefaultVideoSpeed = 1000 div DefaultFrameSpeed; // lama delay dalam milisecond

type
  TfrmMain = class(TTntForm)
    pBwah: TPanel;
    btnRec: TLbSpeedButton;
    btnStop: TLbSpeedButton;
    actlRecg: TActionList;
    lblStatr: TLabel;
    actRec: TAction;
    actStop: TAction;
    ilst: TImageList;
    actPause: TAction;
    sb: TStatusBar;
    grpSet: TGroupBox;
    lblRecSpd: TLabel;
    edtFPS: TTntEdit;
    grpPth: TGroupBox;
    edtPath: TTntEdit;
    btnBrsSv: TLbButton;
    btnPref: TLbButton;
    btnAbt: TLbButton;
    btnExit: TLbButton;
    cbxCmprs: TCheckBox;
    cbxQa: TCheckBox;
    sdlg: TSaveDialog;
    cbxResz: TCheckBox;
    edtSetW: TTntEdit;
    Label2: TLabel;
    edtSetH: TTntEdit;
    pbwh: TPaintBox;
    pmPref: TPopupMenu;
    WebcamSource1: TMenuItem;
    cbxFrm: TCheckBox;
    spFrm: TSpinEdit;
    cbxRev: TCheckBox;
    cbxLoop: TCheckBox;
    cbxPrev: TCheckBox;
    ApplicationSettings1: TMenuItem;
    fGraph: TFilterGraph;
    filter: TFilter;
    vWnd: TVideoWindow;
    sGrabber: TSampleGrabber;
    btnPause: TLbSpeedButton;
    SkinLib: TSXSkinLibrary;
    SkinFrm: TSXSkinForm;
    pb: TProgressBar;
    SkinStor: TSXStoredSkin;
    actAppSet: TAction;
    actCamSrc: TAction;
    actSetVd: TAction;
    SetVideoSettings1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRecExecute(Sender: TObject);
    procedure actStopExecute(Sender: TObject);
    procedure btnAbtClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnBrsSvClick(Sender: TObject);
    procedure pbwhPaint(Sender: TObject);
    procedure cbxReszClick(Sender: TObject);
    procedure actCamSrcExecute(Sender: TObject);
    procedure cbxFrmClick(Sender: TObject);
    procedure btnPrefClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actPauseExecute(Sender: TObject);
    procedure actAppSetExecute(Sender: TObject);
    procedure actSetVdExecute(Sender: TObject);
  private
    { Private declarations }

    camidx: integer;
    IdleFps: integer;
    AutoStrCfg: boolean;
    GalleryInAppDir: boolean;
    CustomGalleryDir: string;

    procedure SetCapWindow(w, h: integer);

  public
    { Public declarations }

    StopRec: boolean;
    PauseRec: boolean;
    CapEnum: TSysDevEnum;
    VMediaType: TEnumMediaType;
    VidLst: TStringList;

    {hAVI : HWND;
    hAVIID : Integer;}

    VideoWidthSize, VideoHeightSize: integer;

    LagiProses: boolean;

    procedure InitCamera;
    procedure EnumerateCamera;
    procedure BukaCamera(reopen: boolean);
    procedure TutupCamera;
    procedure TermCamera;
    procedure SetCameraIndex(index: integer);
    procedure BacaKonfigurasi;
    procedure SetGifSaveLocation;
    procedure FinishCreate;


  end;

var
  frmMain: TfrmMain;

implementation

uses {DCAVICap32,} WndToGIF, uSelcam, uAbt, uPrev, uCfg, uSetvd;

{$R *.dfm}

//=== Private area =============================================================

procedure TfrmMain.SetCapWindow(w, h: integer);
begin

  frmMain.ClientWidth:= w;
  frmMain.ClientHeight:= h + pBwah.Height + sb.Height;

end;

//=== Public area ==============================================================

procedure TfrmMain.InitCamera;
begin

  CapEnum:= TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  VidLst:= TStringList.Create;
  VMediaType:= TEnumMediaType.Create;

end;

procedure TfrmMain.EnumerateCamera;
var
  cnt: integer;
begin

  VidLst.Clear;
  for cnt:= 0 to CapEnum.CountFilters-1 do
    VidLst.Add(CapEnum.Filters[cnt].FriendlyName);

end;

procedure TfrmMain.BukaCamera(reopen: boolean);
//var
//  DriverName, DriverVer : PWideChar;
var
  PList: TPinList;
begin

  if reopen then
    begin

    SetCameraIndex(camidx);
    fGraph.Active:= TRUE;
    fGraph.Play;

  end;

  // Set configuartion
  PList:= TPinList.Create;//(filter as IBaseFilter);
  PList.Assign(filter as IBaseFilter);
  VMediaType.Assign(PList.First);

  // configure output Video media type
  if vWnd.FilterGraph <> nil then
    with (PList.First as IAMStreamConfig) do
      SetFormat(VMediaType.Items[0].AMMediaType^);

  try

    with (PList.First as IAMStreamConfig) do
      begin

      //GetFormat(VMediaType.Items[0].AMMediaType);

      PVideoInfoHeader(VMediaType.Items[camidx].Format)^.bmiHeader.biPlanes:= 1;
      //PVideoInfoHeader(VMediaType.Items[camidx].Format)^.bmiHeader.biCompression:= 2; // As we don't use it for gif capture...
      PVideoInfoHeader(VMediaType.Items[camidx].Format)^.bmiHeader.biWidth:= VideoWidthSize;
      PVideoInfoHeader(VMediaType.Items[camidx].Format)^.bmiHeader.biHeight:= VideoHeightSize;
      PVideoInfoHeader(VMediaType.Items[camidx].Format)^.bmiHeader.biBitCount:= 24;
      PVideoInfoHeader(VMediaType.Items[camidx].Format)^.AvgTimePerFrame:= 10000000 div IdleFps;

      SetCapWindow(
      PVideoInfoHeader(VMediaType.Items[camidx].Format)^.bmiHeader.biWidth,
      PVideoInfoHeader(VMediaType.Items[camidx].Format)^.bmiHeader.biHeight);

      SetFormat(VMediaType.Items[camidx].AMMediaType^);

    end;

  finally

    PList.Free;

  end;

  //SetCapWindow(128, 128);
  Caption:= FormatW('%s v%s (%dx%d)', [appname, GetAppVer, vWnd.Width, vWnd.Height]);
  sb.Panels[1].Text:= FormatW(s_CameraName, [CapEnum.Filters[camidx].FriendlyName]);
  if AutoStrCfg then
    frmSetVd.Show;

end;

procedure TfrmMain.TutupCamera;
begin

  // Disconnect webcam
  //SendMessage(hAVI, WM_CAP_DRIVER_DISCONNECT, WPARAM(-1) , LPARAM(0));
  //CloseHandle(hAVI);

  fGraph.ClearGraph;
  fGraph.Active:= FALSE;
  frmSetvd.Hide;

end;

procedure TfrmMain.TermCamera;
begin

  VMediaType.Free;
  CapEnum.Free;
  VidLst.Free;

  {FreeAndNil(VMediaType);
  FreeAndNil(CapEnum);
  FreeAndNil(VidLst);}

end;

procedure TfrmMain.SetCameraIndex(index: integer);
begin

  fGraph.ClearGraph;
  fGraph.Active:= FALSE;
  filter.BaseFilter.Moniker:= CapEnum.GetMoniker(index);
  fGraph.Active:= TRUE;
  with fGraph as ICaptureGraphBuilder2 do
    RenderStream(@PIN_CATEGORY_PREVIEW, nil, filter as IBaseFilter, sGrabber as IBaseFilter, vWnd as IBaseFilter);
  fGraph.Play;

end;

procedure TfrmMain.SetGifSaveLocation;
var
  i: integer;
  gpath, dir: WideString;
begin

  if GalleryInAppDir then
    dir:= ExtractFilePathW(ParamStrW(0))+'Gallery\'
  else
    dir:= CustomGalleryDir;

  if not FileExistsW(dir) then
    CreateDirectoryW(PWideChar(Dir), nil);

  i:= 0;

  repeat
    gpath:= Dir+FormatW('ANIMATION_%d.GIF', [i]);
    Inc(i);
  until not FileExistsW(gpath);

  edtPath.Text:= gpath;

end;

procedure TfrmMain.BacaKonfigurasi;
var
  ini: TIniFile;
begin

  ini:= TIniFile.Create(ChangeFileExtW(ParamStrW(0), '.ini'));

  try

    camidx:= ini.ReadInteger(set_Camera, 'Index', -1);

    VideoWidthSize:= ini.ReadInteger(set_Video, 'Width', 0);
    VideoHeightSize:= ini.ReadInteger(set_Video, 'Height', 0);
    IdleFps:= ini.ReadInteger(set_Video, 'IdleSpeed', -1);
    AutoStrCfg:= ini.ReadBool(set_Video, 'ShowVideoConfigurationOnStartup', TRUE);

    CustomGalleryDir:= ini.ReadString(set_Gallery, 'CustomGalleryPath', ExtractFilePathW(ParamStrW(0))+'Gallery\');
    GalleryInAppDir:= ini.ReadBool(set_Gallery, 'SaveInAppDir', TRUE);

    //Main Form Related
    edtFPS.Text:= FloatToStr(ini.ReadFloat(set_General, 'CaptureFrameRate', 5.0));
    cbxFrm.Checked:= ini.ReadBool(set_General, 'EnableFrameLimit', FALSE);
    cbxFrmClick(nil);
    spFrm.Value:= ini.ReadInteger(set_General, 'FrameLimitRate', 15);
    cbxResz.Checked:= ini.ReadBool(set_General, 'ResizeAnimation', FALSE);
    cbxReszClick(nil);
    edtSetW.Text:= IntToStr(ini.ReadInteger(set_General, 'ResizeWidth', 128));
    edtSetH.Text:= IntToStr(ini.ReadInteger(set_General, 'ResizeHeight', 128));
    cbxCmprs.Checked:= ini.ReadBool(set_General, 'UseCompression', TRUE);
    cbxLoop.Checked:= ini.ReadBool(set_General, 'UnlimitedAnimationLoop', TRUE);
    cbxQa.Checked:= ini.ReadBool(set_General, 'HighQuality', FALSE);
    cbxRev.Checked:= ini.ReadBool(set_General, 'AddReversalFrame', FALSE);
    cbxPrev.Checked:= ini.ReadBool(set_General, 'PreviewAfterCapture', FALSE);

    if (VideoWidthSize = 0) or (VideoHeightSize = 0) then
      begin

      VideoWidthSize:= DefaultVideoWidthSize;
      VideoHeightSize:= DefaultVideoHeightSize;

    end;

    if IdleFps < 0 then
      IdleFps:= DefaultVideoSpeed;

    if CustomGalleryDir[Length(CustomGalleryDir)] <> '\' then
      CustomGalleryDir:= CustomGalleryDir+'\';

  finally

    ini.Free;

  end;

end;

procedure TfrmMain.FinishCreate;
var
  lastpath: WideString;
begin

  try

    // Setelah pembuatan dihentikan/selesai

    StopRec:= FALSE;

    lblStatr.Caption:= s_AnimSaved;
    sb.Panels[0].Text:= s_Ready;

    if cbxPrev.Checked then
      LastPath:= edtPath.Text;

    SetGifSaveLocation;

    if (cbxPrev.Checked) and (LagiProses) then
      with frmPrevw do
        begin
        imgPrikitew.Picture.LoadFromFile(LastPath);
        FilePath:= LastPath;
        ShowModal;
      end;

  finally

    LagiProses:= FALSE;

    actRec.Enabled:= TRUE;
    actPause.Enabled:= FALSE;
    actStop.Enabled:= FALSE;

    grpSet.Enabled:= TRUE;
    grpPth.Enabled:= TRUE;

    //capPreviewRate(hAVI, IdleFps);
    //capPreview(hAVI, TRUE);
    fGraph.Play;

  end;

end;

//=== Events area ==============================================================

procedure TfrmMain.FormCreate(Sender: TObject);
begin

  InitCamera;
  BacaKonfigurasi;
  EnumerateCamera;

  if VidLst.Count < 1 then
    begin

    MessageBoxW(Handle, PWideChar(s_ErrNoWebcam), PWideChar(s_ErrCap), MB_ICONERROR);
    Halt;

  end;

  SkinLib.Active:= TRUE;

end;

procedure TfrmMain.FormShow(Sender: TObject);

  procedure SetCam(idx: integer);
  var
    ini: TIniFile;
  begin

    ini:= TIniFile.Create(ChangeFileExtW(ParamStrW(0), '.ini'));

    try

      ini.WriteInteger('Camera', 'Index', idx);

    finally

      ini.Free;
      SetCameraIndex(idx);
      SetFocus;

    end;

  end;

begin

  // pas form mau tayang...

  // akuisisi bahasa
  {$I LangAcc_uMain.inc}

  try

    LagiProses:= FALSE;
    lblStatr.Caption:= s_Ready;
    sb.Panels[0].Text:= s_Ready;
    SetGifSaveLocation;

    if camidx = -1 then
      begin

      if CapEnum.CountFilters > 1 then
        begin
        if frmSelCam.ShowModal = mrOk then
          SetCam(frmSelCam.cbxCam.ItemIndex)
        else
          SetCam(0);
      end
      else
        SetCam(0);

      end
      else
        SetCameraIndex(camidx);

      BukaCamera(FALSE);

  finally

    Self.SetFocus;

  end;

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini: TIniFile;
begin

  TutupCamera;

  ini:= TIniFile.Create(ChangeFileExtW(ParamStrW(0), '.ini'));

  try

    ini.WriteFloat(set_General, 'CaptureFrameRate', StrToFloat(edtFPS.Text));
    ini.WriteBool(set_General, 'EnableFrameLimit', cbxFrm.Checked);
    ini.WriteInteger(set_General, 'FrameLimitRate', spFrm.Value);
    ini.WriteBool(set_General, 'ResizeAnimation', cbxResz.Checked);
    ini.WriteInteger(set_General, 'ResizeWidth', StrToInt(edtSetW.Text));
    ini.WriteInteger(set_General, 'ResizeHeight', StrToInt(edtSetH.Text));
    ini.WriteBool(set_General, 'UseCompression', cbxCmprs.Checked);
    ini.WriteBool(set_General, 'UnlimitedAnimationLoop', cbxLoop.Checked);
    ini.WriteBool(set_General, 'HighQuality', cbxQa.Checked);
    ini.WriteBool(set_General, 'AddReversalFrame', cbxRev.Checked);
    ini.WriteBool(set_General, 'PreviewAfterCapture', cbxPrev.Checked);

  finally

    ini.Free;

  end;

end;

procedure TfrmMain.actRecExecute(Sender: TObject);
var
  flimit: integer;
begin

  try

    // state lagi proses
    LagiProses:= TRUE;

    //capPreview(hAVI, TRUE);

    actRec.Enabled:= FALSE;
    actPause.Enabled:= TRUE;
    actStop.Enabled:= TRUE;

    PauseRec:= FALSE;
    StopRec:= FALSE;

    grpSet.Enabled:= FALSE;
    grpPth.Enabled:= FALSE;

    sb.Panels[0].Text:= s_Recording;

    if cbxFrm.Checked then
      flimit:= spFrm.Value
    else
      flimit:= -1;

    // bikin thread untuk diproses lebih lanjut
    TWndToGIF.WndToGIFExec(vWnd.Handle, VideoWidthSize, VideoHeightSize, StrToFloat(edtFPS.Text),
                           flimit, cbxCmprs.Checked, cbxLoop.Checked, cbxQa.Checked,
                           cbxRev.Checked, cbxResz.Checked, StrToInt(edtSetW.Text),
                           StrToInt(edtSetH.Text), edtPath.Text);

  except

     LagiProses:= FALSE;
     FinishCreate;
     lblStatr.Caption:= s_Ready;
     raise Exception.Create(s_ErrStartCap);

  end;

end;

procedure TfrmMain.actStopExecute(Sender: TObject);
begin
  StopRec:= TRUE;
end;

procedure TfrmMain.btnAbtClick(Sender: TObject);
begin
  frmAbt.ShowModal;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnBrsSvClick(Sender: TObject);
begin
  sdlg.FileName:= edtPath.Text;
  if sdlg.Execute then
    edtPath.Text:= sdlg.FileName;
end;

procedure TfrmMain.pbwhPaint(Sender: TObject);
begin

  if IsWindowsXpOrHigher then
    DrawGradient($00ECCE94, $00FCE6D4, FALSE, pbwh.Canvas, pbwh.ClientRect);

end;

procedure TfrmMain.cbxReszClick(Sender: TObject);
begin
  edtSetW.Enabled:= cbxResz.Checked;
  edtSetH.Enabled:= cbxResz.Checked;
end;

procedure TfrmMain.actCamSrcExecute(Sender: TObject);
begin
  //if not capDlgVideoSource(hAVI) then
    //MessageBox(Handle, PChar(s_ErrNoOptions), PChar(s_ErrCap), MB_ICONERROR);

  if frmSelCam.ShowModal = mrOk then
    SetCameraIndex(frmSelCam.cbxCam.ItemIndex);

end;

procedure TfrmMain.cbxFrmClick(Sender: TObject);
begin
  spFrm.Enabled:= cbxFrm.Checked;
end;

procedure TfrmMain.btnPrefClick(Sender: TObject);
var
  poin: TPoint;
begin
  GetCursorPos(poin);
  pmPref.Popup(poin.X, poin.Y);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if LagiProses then
    begin
    // Tayang kalo lagi dalam proses
    if MessageBoxW(Handle, PWideChar(s_ConfRRun), PWideChar(s_ConfCap), MB_ICONWARNING + MB_YESNO) = IDYES then
      CanClose:= TRUE
    else
      CanClose:= FALSE;
  end
  else
    CanClose:= TRUE;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin

  btnRec.Repaint;
  btnStop.Repaint;
  lblStatr.Repaint;
  grpSet.Repaint;
  grpPth.Repaint;
  btnPref.Repaint;
  btnAbt.Repaint;
  btnExit.Repaint;

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  TermCamera;
end;

procedure TfrmMain.actPauseExecute(Sender: TObject);
begin
  if not PauseRec then
    begin
    sb.Panels[0].Text:= s_Paused;
    actPause.Hint:= s_Resume;
  end
  else
    begin
    sb.Panels[0].Text:= s_Recording;
    actPause.Hint:= s_Pause;
  end;
  PauseRec:= not PauseRec;
end;

procedure TfrmMain.actAppSetExecute(Sender: TObject);
begin
  frmCfg.ShowModal;
end;

procedure TfrmMain.actSetVdExecute(Sender: TObject);
begin
  if frmSetvd.Showing then
    begin
    frmSetvd.SetFocus;
    Beep;
  end
  else
    frmSetvd.Show;
end;

end.
