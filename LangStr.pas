unit LangStr;

{===============================================================================

   Faris's Webcam2GIF Original Source
   Copyright © Faris Khowarizmi 2012
   All Right Reserved

   Coded by Faris Khowarizmi
   Project Started on 28 April 2012

===============================================================================}

interface

uses
  Windows, IniFiles, Forms, SysUtils, TntClasses, UnicodeAdds;

const

  appname = 'Khayalan GIFShot';
  //appver  = '0.8.1.130';
  appvend = 'Khayalan Software';
  copyrg  = 'Copyright '#169' Khayalan Software 2012';

  web  = 'http://www.khayalan.tk';
  mail = 'thekill96@gmail.com';

  // Untuk penamaan section dalam pengaturan
  set_Camera  = 'Camera';
  set_Video   = 'Video';
  set_Gallery = 'Gallery';
  set_General = 'General';

var

  //=== String table translation ===============================================

  s_ErrCap: WideString = 'Error!';
  s_ConfCap: WideString = 'Confirmation';
  s_SuccCap: WideString = 'Success!';

  s_Ok: WideString = '&OK';
  s_Cancel: WideString = '&Cancel';

  s_Pause: WideString = 'Pause';
  s_Resume: WideString = 'Resume';

  s_ErrNoWebcam: WideString = 'Sorry, you detected doesn''t have any webcam! Please plug or install your webcam driver!';
  //s_ErrNoOptions: WideString = 'Driver anda tidak menyediakan fitur ini atau anda belum memasangnya!';
  s_ErrStartCap: WideString = 'Error while want to recording! Maybe because you entered invalid input!';
  s_ConfRRun: WideString = 'Animation recording proccess still running. Do you want to exit?';
  s_ConfDelete: WideString = 'Do you want to delete this result?';
  s_DeleteOk: WideString = 'File has been deleted!';
  s_ReplFile: WideString = 'Are you sure to overwite file "%s" ?';
  s_CopySuccess: WideString = 'File copying "%s" to "%s" success!';
  s_CopyError: WideString = 'File copying "%s" to "%s" error!';

  s_InRecord: WideString = 'Recording time %s second, %d frame captured.';
  s_RecPause: WideString = 'Capture paused!';
  s_InCombine: WideString = 'Combine frame %d of %d to GIF buffer...';
  s_InCombineRev: WideString = 'Combine reversal of frame %d...';
  s_InSetDelay: WideString = 'Setting up for animation delay...';
  s_InSetLoops: WideString = 'Setting up for animation loops...';
  s_Saving: WideString = 'Saving...';
  s_Finishing: WideString = 'Finishing...';

  s_SendImage: WideString = 'Send Image';
  s_RecipentEnter1: WideString = 'Enter the recipent e-Mail address!';
  s_RecipentEnter2: WideString = '(e.g: people@themail)';
  s_SelImgSendDest: WideString = 'Select the destination of Device or Directory.';

  s_Ready: WideString = 'Ready';
  s_Recording: WideString = 'Recording...';
  s_Paused: WideString = 'Paused';
  s_AnimSaved: WideString = 'Animation Saved!';

  s_CameraName: WideString = 'Camera: %s';

  s_SendMailHint: WideString = 'Send eMail to %s';
  s_WebsiteHint: WideString = 'Goto our website at %s';

  //=== VCL control translations ===============================================

  // Main Form
  fm_actRec_hint: WideString = 'Record';
  fm_actPause_hint: WideString = 'Pause';
  fm_actStop_hint: WideString = 'Stop';
  fm_actAppSet_cap: WideString = '&Application Settings';
  fm_actCamSrc_cap: WideString = 'Webcam &Source';
  fm_actSetvd_cap: WideString = 'Set &Video Settings';
  fm_grpSet_cap: WideString = 'Animation Settings';
  fm_lblRecSpd_cap: WideString = 'Speed (FPS)';
  fm_cbxFrm_cap: WideString = 'Limit Frame';
  fm_cbxResz_cap: WideString = 'Resize';
  fm_cbxCmprs_cap: WideString = 'Use LZW Compression';
  fm_cbxLoop_cap: WideString = 'Unlimited loops animation';
  fm_cbxQa_cap: WideString = 'High Quality Result';
  fm_cbxRev_cap: WideString = 'Add reversal frames';
  fm_grpPth_cap: WideString = 'Save to File';
  fm_btnBrsSv_cap: WideString = '&Browse';
  fm_cbxPrev_cap: WideString = 'Preview after';
  fm_btnPref_cap: WideString = '&Preferences';
  fm_btnAbt_cap: WideString = '&About';
  fm_btnExit_cap: WideString = 'E&xit';

  // Configure Form

  fs_cap: WideString = 'Configuration';
  fs_tbVid_cap: WideString = 'Video';
  //fs_tbSetv_cap: WideString = 'Settings';
  fs_tbGaly_cap: WideString = 'Gallery';
  fs_tbLang_cap: WideString = 'Language';
  fs_grpCapDev_cap: WideString = 'Capture Device';
  fs_lblCapDevDesc_cap: WideString = 'Select the default capture device you use';
  fs_grpCapWnd_cap: WideString = 'Capture Window';
  fs_lblWndW_cap: WideString = 'Window Width';
  fs_lblWndH_cap: WideString = 'Window Height';
  fs_cbxVsstr_cap: WideString = 'Show Video Settings when startup';
  fs_grpCapSet_cap: WideString = 'Capture Settings';
  fs_lblIdleSpeed_cap: WideString = 'Preview video speed when not recorded (FPS)';
  {fs_grpVidSet_cap: WideString = 'Video Settings';
  fs_lblBrightnessDesc_cap: WideString = 'Brightness';
  fs_lblContrastDesc_cap: WideString = 'Contrast';
  fs_lblHueDesc_cap: WideString = 'Hue';
  fs_lblSaturationDesc_cap: WideString = 'Saturation';
  fs_lblSharpnessDesc_cap: WideString = 'Sharpness';
  fs_lblGammaDesc_cap: WideString = 'Gamma';
  fs_lblColorEnableDesc_cap: WideString = 'Color Enable';
  fs_lblWhiteBalanceDesc_cap: WideString = 'White Balance';
  fs_lblBacklightDesc_cap: WideString = 'Backlight';
  fs_lblGainDesc_cap: WideString = 'Gain';}
  fs_grpGalySet_cap: WideString = 'Gallery location';
  fs_lblGalySetDesc_cap: WideString = 'Select the default location of Gallery';
  fs_rdAppdir_cap: WideString = 'In application folder';
  fs_rdCusdir_cap: WideString = 'Other location';
  fs_btnBrowse_cap: WideString = 'Browse';
  fs_grpLangSet_cap: WideString = 'Language';
  fs_lblLangSetDesc_cap: WideString = 'Select the interface language';

  // Change camera Form

  fc_cap: WideString = 'Select Webcam';
  fc_lblCamSel_cap: WideString = 'Select webcam that do you want to use';

  // About Form

  fa_cap: WideString = 'About';
  fa_Comments_cap: WideString = 'Critics and feedback are open to eMail that shown in bottom or enter to our site.';
  fa_PhysMemDesc_cap: WideString = 'Physical Memory Available:';
  fa_FreeResDesc_cap: WideString = 'Memory in Use:';
  fa_OsNameDesc_cap: WideString = 'Operating System:';
  fa_lblUpd_cap: WideString = 'Check and update to the lastest version now!';
  fa_btnCredits_cap: WideString = '&Credits';

  // Preview Image Form

  fv_cap: WideString = 'Preview Result';
  fv_btnDel_cap: WideString = '&Delete';
  fv_btnExp_cap: WideString = '&Open in explorer';
  fv_btnSend_cap: WideString = '&Send to...';

  // Send confirmation Form

  fd_cap: WideString = 'Send to...';
  fd_lblSendDesc_cap: WideString = 'Select the ways to send your result!';
  fd_rbSendMail_cap: WideString = 'Send to Mail';
  fd_lblSendMailDesc_cap: WideString = 'Send via e-Mail through your default mail client.';
  fd_rbSendDev_cap: WideString = 'Send to portable drive';
  fd_lblSendDevDesc_cap: WideString = 'Send to aviable portable drive from protable device you attached.';

  // Mail editor Form

  fe_cap: WideString = 'Mail Editor';
  fe_lblSubjDesc_cap: WideString = 'Subject';
  fe_lblBodyDesc_cap: WideString = 'Body';
  fe_btnClr_cap: WideString = '&Clear All';

  // Setting Video Form

  ft_cap: WideString = 'Video Settings';
  ft_lblBrightnessDesc_cap: WideString = 'Brightness';
  ft_lblContrastDesc_cap: WideString = 'Contrast';
  ft_lblHueDesc_cap: WideString = 'Hue';
  ft_lblSaturationDesc_cap: WideString = 'Saturation';
  ft_lblSharpnessDesc_cap: WideString = 'Sharpness';
  ft_lblGammaDesc_cap: WideString = 'Gamma';
  ft_lblColorEnableDesc_cap: WideString = 'Color Enable';
  ft_lblWhiteBalanceDesc_cap: WideString = 'White Balance';
  ft_lblBacklightDesc_cap: WideString = 'Backlight';
  ft_lblGainDesc_cap: WideString = 'Gain';

  //=== Procedure Decl =========================================================

  procedure LoadSetLanguage;
  function GetLangFiles: TTntStringList;

  //=== The end of the decl ====================================================

implementation

procedure LoadLanguage(FileName: WideString);
const MsgCap: WideString = 'Error';
var
  StringFile: TTntStringList;
  ErrLst: WideString;
  FilePath: WideString;

  procedure StringLoad(var Text: WideString; Const Id: String);
  var
    StrBuf: WideString;
  begin
    StrBuf:= StringFile.Values[Id];
    if StrBuf <> '' then
      Text:= StrBuf
    else
      ErrLst:= ErrLst+Id+#13;
  end;

begin

  FilePath:= ExtractFilePath(ParamStr(0))+'Lang\'+FileName+'.ini';

  if not FileExistsW(FilePath) then
    begin

    MessageBoxW(0, PWideChar(FormatW('Language File "%s" not found!', [FilePath])), PWideChar(s_ErrCap), MB_ICONINFORMATION);
    exit;

  end;

  StringFile:= TTntStringList.Create;

  try

    StringFile.LoadFromFile(FilePath);
    StringFile.Delimiter:= '=';
    Errlst:= '';

    //load here

    {$I StrLoad.inc}

    {$I LangLoad_uMain.inc}
    {$I LangLoad_uCfg.inc}
    {$I LangLoad_uSelCam.inc}
    {$I LangLoad_uAbt.inc}
    {$I LangLoad_uPrev.inc}
    {$I LangLoad_uSendConf.inc}
    {$I LangLoad_uMailEdit.inc}
    {$I LangLoad_uSetvd.inc}

  finally

    StringFile.Free;

    if Errlst <> '' then
      MessageBoxW(Application.Handle, PWideChar(FormatW('Error while reading language with the following ID in file "%s.ini". Please check it, maybe missing or nulled!', [FileName])+#13#13+ErrLst), PWideChar(MsgCap), MB_ICONERROR);

  end;

end;

procedure LoadSetLanguage;
var
  ini: TIniFile;
  lang: WideString;
begin

  ini:= TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));

  try

    lang:= ini.ReadString(set_General, 'Language', 'Indonesia');

  finally

    ini.Free;

  end;

  LoadLanguage(lang);

end;

function GetLangFiles: TTntStringList;
const
  Ext = 'ini';
var
  sr: TSearchRec;
  Found: boolean;
begin

  Result:= TTntStringList.Create;

  Found:= FindFirst(ExtractFilePath(ParamStr(0))+'Lang\*.'+Ext, faAnyFile, sr)= 0;
  while Found do begin
    Result.Add(ChangeFileExtW(sr.Name, ''));
    Found:= FindNext(sr)= 0;
  end;
  FindClose(sr);

end;

end.
