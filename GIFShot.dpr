// JCL_DEBUG_EXPERT_INSERTJDBG ON
// JCL_DEBUG_EXPERT_GENERATEJDBG ON
program GIFShot;

{===============================================================================

   Faris's Webcam2GIF Original Source
   Copyright © Faris Khowarizmi 2012
   All Right Reserved

   Coded by Faris Khowarizmi
   Project Started on 28 April 2012

===============================================================================}

uses
  FastMM4,
  Forms,
  OgFirst,
  Windows,
  uMain in 'uMain.pas' {frmMain},
  uSelcam in 'uSelCam.pas' {frmSelCam},
  UAbt in 'UAbt.pas' {frmAbt},
  uSplash in 'uSplash.pas' {frmSplsh},
  WndToGIF in 'WndToGIF.pas',
  LangStr in 'LangStr.pas',
  ExceptionDlg in 'ExceptionDlg.pas' {ExceptionDialog},
  Tambahan in 'Tambahan.pas',
  uPrev in 'uPrev.pas' {frmPrevw},
  uCfg in 'uCfg.pas' {frmCfg},
  uSendConf in 'uSendConf.pas' {frmSendConf},
  MailSender in 'MailSender.pas',
  uMailEdit in 'uMailEdit.pas' {frmMailEdt},
  uSetvd in 'uSetvd.pas' {frmSetvd};

{$R *.res}
{$R XP-THEME.RES}
{$R IMGRES.RES}

var
  Splash: TfrmSplsh;
begin

  asm

    jmp @@loncat

    // Faris's Webcam2GIF

    db 00
    db $4B, $68, $61, $79, $61, $6C, $61, $6E, $20, $47, $49, $46, $53, $68, $6F, $74
    db 00

    @@loncat:

  end;

  Application.Title := 'Khayalan GIFShot';

  if not IsFirstInstance then
    begin
    MessageBox(Application.Handle, PChar('Another instance is running!'), PChar('Warning'), MB_ICONWARNING);
    ActivateFirstInstance;
    Exit;
  end;

  Application.Initialize;

  Splash:= TfrmSplsh.Create(Application);

  try

    Splash.BuatSplash;

    LoadSetLanguage;

    Application.CreateForm(TfrmMain, frmMain);
    Application.CreateForm(TfrmSelCam, frmSelCam);
    Application.CreateForm(TfrmAbt, frmAbt);
    Application.CreateForm(TfrmPrevw, frmPrevw);
    Application.CreateForm(TfrmCfg, frmCfg);
    Application.CreateForm(TfrmSendConf, frmSendConf);
    Application.CreateForm(TfrmMailEdt, frmMailEdt);
    Application.CreateForm(TfrmSetvd, frmSetvd);

  finally

    Splash.Free;
    Application.Run;

  end;

end.
