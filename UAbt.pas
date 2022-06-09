unit UAbt;

{===============================================================================

   Faris's Webcam2GIF Original Source
   Copyright © Faris Khowarizmi 2012
   All Right Reserved

   Coded by Faris Khowarizmi
   Project Started on 28 April 2012

===============================================================================}

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, LbButton, ShellAPI, LangStr, GIFImage, Tambahan,
  credits, Dialogs, TntForms, UnicodeAdds;

type
  TfrmAbt = class(TTntForm)
    pAb1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    btnOk: TLbButton;
    lblMail: TLabel;
    lblWeb: TLabel;
    imgLogo: TImage;
    pAb2: TPanel;
    PhysMemDesc: TLabel;
    FreeResDesc: TLabel;
    OsNameDesc: TLabel;
    PhysMem: TLabel;
    FreeRes: TLabel;
    OsName: TLabel;
    Bevel1: TBevel;
    lblUpd: TLabel;
    imgExp: TImage;
    btnCredits: TLbButton;
    pnlCredits: TPanel;
    creds: TMemo;
    procedure FormShow(Sender: TObject);
    procedure lblMailClick(Sender: TObject);
    procedure lblWebClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblMailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblWebMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgExpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure lblUpdMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblUpdClick(Sender: TObject);
    procedure btnCreditsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbt: TfrmAbt;

implementation

uses uMain;

{$R *.dfm}
{$R creditsinc.res}

procedure TfrmAbt.FormShow(Sender: TObject);

  procedure MsgBoxEEG(const Msg: string);
  const
    Capt = 'FARISSS Says..';
  begin
    MessageBox(Handle, PChar(Msg), PChar(Capt), MB_ICONWARNING);
  end;

var
  MS: TMemoryStatus;
  OSString, OSUpdate: string;
  eeg: string;
  GrabCredits: TResourceStream;
begin

  {$I LangAcc_uAbt.inc}

  ShowHint:= TRUE;

  GrabCredits:= TResourceStream.Create(hInstance, 'CREDITS', RT_RCDATA);
  try
    creds.Lines.LoadFromStream(GrabCredits);
  finally
    GrabCredits.Free;
  end;

  //creds.Animate:= FALSE;
  pnlCredits.Hide;
  pAb1.Show;
  pAb2.Show;

  lblMail.Caption:= mail;
  lblMail.Hint:= FormatW(s_SendMailHint, [mail]);

  lblWeb.Caption:= web;
  lblWeb.Hint:= FormatW(s_WebsiteHint, [web]);

  imgLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'APPLOGO');
  ProgramICon.Picture.Icon.Handle:= LoadIcon(hInstance, 'MAINICON');

  GlobalMemoryStatus(MS);
  PhysMem.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys / 1024);
  FreeRes.Caption := Format('%d %%', [MS.dwMemoryLoad]);

  case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS : OSString:= 'Windows 9x';
    VER_PLATFORM_WIN32_NT      : OSString:= 'Windows NT';
  end;

  OSUpdate:= Win32CSDVersion;
  if OSUpdate <> '' then
    OsName.Caption:= Format('%s %d.%d (Build %d), Update %s.', [OSString, Win32MajorVersion, Win32MinorVersion, Win32BuildNumber, OSUpdate])
  else
    OsName.Caption:= Format('%s %d.%d (Build %d).', [OSString, Win32MajorVersion, Win32MinorVersion, Win32BuildNumber]);

  // easter egg #2
  if (GetASyncKeyState(VK_F9) <> 0) then
    begin

    eeg:= InputBox('Get wise info', 'Type the possible value here!', '');

    if eeg = 'brokenheart' then
      MsgBoxEEG('Don''t worry about love, God will makes your love if possible :)')
    else
    if eeg = 'kamseupay' then
      MsgBoxEEG('Forget it and just make new relationship with other people :p')
    else
    if eeg = 'khayalan' then
      MsgBoxEEG('In indonesian language, "Khayalan" simillar to word "Dream".')
    else
    if eeg = 'quality' then
      MsgBoxEEG('Quality! Not Quantity!')
    else
    if eeg = 'dev' then
      MsgBoxEEG('Developed by Faris Khowarizmi.')
    else
    if eeg = 'typethismessageuntilboredbecausealayercandoit' then
      MsgBoxEEG('Damn 2 ALAYER!')
    else
    if eeg = 'receipe' then
      MsgBoxEEG('Just using your brain man!')
    else
    if eeg = 'close' then
      frmMain.Close
    else
      MsgBoxEEG('Nothing magic man!');

  end;

end;

procedure TfrmAbt.lblMailClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('mailto:'+mail), '', '', SW_SHOWNORMAL);
end;

procedure TfrmAbt.lblWebClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(web), '', '', SW_SHOWNORMAL);
end;

procedure TfrmAbt.FormCreate(Sender: TObject);
begin
  ProductName.Caption:= appname;
  Version.Caption:= Format('Version %s', [GetAppVer]);
  Copyright.Caption:= copyrg;
end;

procedure TfrmAbt.lblMailMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lblWeb.Font.Style:= [fsUnderline];
  lblMail.Font.Style:= [fsBold, fsUnderline];
end;

procedure TfrmAbt.lblWebMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lblMail.Font.Style:= [fsUnderline];
  lblWeb.Font.Style:= [fsBold, fsUnderline];
end;

procedure TfrmAbt.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lblMail.Font.Style:= [fsUnderline];
  lblWeb.Font.Style:= [fsUnderline];
  lblUpd.Font.Style:= [fsUnderline];
end;

procedure TfrmAbt.imgExpClick(Sender: TObject);
var
  res: TResourceStream;
  GIFImg: TGIFImage;
  //nama: string;
begin

  if GetASyncKeyState(VK_CONTROL) <> 0 then
    begin

    // easter egg #1
    res:= TResourceStream.Create(hInstance, 'CAMEXPL', RT_RCDATA);
    GIFImg:= TGIFImage.Create;

    try
      //nama:= ExtractFilePath(ParamStr(0))+'camegg.gif';
      //res.SaveToFile(nama);
      GIFImg.LoadFromStream(res);
      imgExp.Picture.Assign(GIFImg);
    finally
      res.Free;
      GIFImg.Free;
    end;

  end;
  
end;

procedure TfrmAbt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  imgExp.Picture.Bitmap.FreeImage;
  //DeleteFile(PChar(ExtractFilePath(ParamStr(0))+'camegg.gif'));
end;

procedure TfrmAbt.FormPaint(Sender: TObject);
begin

  if IsWindowsXpOrHigher then
    DrawGradient($00ECCE94, $00FCE6D4, FALSE, frmAbt.Canvas, frmAbt.ClientRect);

end;

procedure TfrmAbt.lblUpdMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lblUpd.Font.Style:= [fsBold, fsUnderline];
end;

procedure TfrmAbt.lblUpdClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(web+'/gifshot.html'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmAbt.btnCreditsClick(Sender: TObject);
begin

  if not pnlCredits.Showing then
    begin
    pAb1.Hide;
    pAb2.Hide;
    pnlCredits.Show;
    //creds.Animate:= TRUE;
  end
  else
    begin
    //creds.Animate:= FALSE;
    pnlCredits.Hide;
    pAb1.Show;
    pAb2.Show;
  end;

end;

end.
 
