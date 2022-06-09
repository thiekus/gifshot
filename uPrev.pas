unit uPrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, LbButton, GIFImage, Tambahan, LangStr, ShellAPI, MailSender,
  ShlObj, UnicodeAdds, TntForms, TntClasses;

type
  TfrmPrevw = class(TTntForm)
    pRiv: TPanel;
    pBawah: TPanel;
    imgPrikitew: TImage;
    btnDel: TLbButton;
    btnExp: TLbButton;
    pbPrv: TPaintBox;
    btnOk: TLbButton;
    btnSend: TLbButton;
    procedure pbPrvPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnExpClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure TntFormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FilePath: WideString;
  end;

var
  frmPrevw: TfrmPrevw;

implementation

uses uMain, uSendConf, uMailEdit;

{$R *.dfm}

procedure TfrmPrevw.pbPrvPaint(Sender: TObject);
begin

  if IsWindowsXpOrHigher then
    DrawGradient($00ECCE94, $00FCE6D4, FALSE, pbPrv.Canvas, pbPrv.ClientRect);

  btnDel.Repaint;
  btnExp.Repaint;
  btnSend.Repaint;
  btnOk.Repaint;

end;

procedure TfrmPrevw.FormShow(Sender: TObject);
var
  pvW, pvH: integer;
begin

  {$I LangAcc_uPrev.inc}

  if imgPrikitew.Width <= frmMain.VideoWidthSize then
    pvW:= frmMain.VideoWidthSize
  else
    pvW:= imgPrikitew.Width;

  if imgPrikitew.Height <= frmMain.VideoHeightSize then
    pvH:= frmMain.VideoHeightSize
  else
    pvH:= imgPrikitew.Height;

  frmPrevw.ClientWidth:= pvW+(pRiv.Width-pRiv.ClientWidth);
  frmPrevw.ClientHeight:= pvH+(pRiv.Height-pRiv.ClientHeight)+pBawah.Height;

  frmPrevw.Left:= (Screen.DesktopWidth - frmPrevw.Width) div 2;
  frmPrevw.Top:= (Screen.DesktopHeight - frmPrevw.Height) div 2;

end;

procedure TfrmPrevw.btnDelClick(Sender: TObject);
begin

  if MessageBoxW(Handle, PWideChar(s_ConfDelete), PWideChar(s_ConfCap), MB_ICONWARNING + MB_YESNO) = IDYES then
    begin
    imgPrikitew.Picture.Bitmap.FreeImage;
    DeleteFileW(PWideChar(FilePath));
    MessageBoxW(Handle, PWideChar(s_DeleteOk), PWideChar(s_SuccCap), MB_ICONINFORMATION);
    ModalResult:= mrOk;
  end;

end;

procedure TfrmPrevw.btnExpClick(Sender: TObject);
begin

  ShellExecuteW(Handle, PWideChar(WideString('OPEN')), PWideChar(WideString('explorer.exe')),
                PWideChar('/select, "' + FilePath + '"'), nil, SW_NORMAL) ;

end;

procedure TfrmPrevw.btnSendClick(Sender: TObject);
var
  MData: TStringList;
  recipent: string;
  //subject: string;
  lp: integer;
  dirdest: string;
  DestFile: WideString;
  SubSv, BodySv: TTntStringList;
begin
  if frmSendConf.ShowModal = mrOk then
    begin

    if frmSendConf.rbSendMail.Checked then
      begin

      recipent:= InputBox(s_SendImage, s_RecipentEnter1+#13+s_RecipentEnter2, '');
      if recipent = '' then
        Exit;

      MData:= TStringList.Create;

      try

        MData.Values['to']:= recipent;

        if frmMailEdt.ShowModal = mrOk then
          begin

          SubSv:= TTntStringList.Create;
          BodySv:= TTntStringList.Create;
          try
            SubSv.Add(frmMailEdt.edtSubj.Text);
            BodySv.AddStrings(frmMailEdt.mmBody.Lines);
            SubSv.SaveToFile(ExtractFilePathW(ParamStrW(0))+'MailSubject.dat');
            BodySv.SaveToFile(ExtractFilePathW(ParamStrW(0))+'MailBody.dat');
          finally
            SubSv.Free;
            BodySv.Free;
          end;

          MData.Values['subject']:= frmMailEdt.edtSubj.Text;
          if frmMailedt.mmBody.Lines.Count > 0 then
            for lp:= 0 to frmMailedt.mmBody.Lines.Count-1 do
              MData.Values['body']:= frmMailedt.mmBody.Lines[lp];

        end
        else
          Exit;

        MData.Values['attachment0']:= FilePath;

        SendEMail(Application.Handle, MData);

      finally

        MData.Free;

      end;

    end
    else
    if frmSendConf.rbSendDev.Checked then
      begin

      dirdest:= BrowseDialog(s_SelImgSendDest, BIF_RETURNONLYFSDIRS);
      if dirdest <> '' then
        begin
        if dirdest[Length(dirdest)] <> '\' then
          dirdest:= dirdest+'\';
        DestFile:= dirdest+ExtractFileNameW(FilePath);
        if FileExistsW(DestFile) then
          if MessageBoxW(Handle, PWideChar(FormatW(s_ReplFile, [DestFile])), PWideChar(s_ConfCap), MB_ICONWARNING + MB_YESNO) = IDNO then
            Exit;
        if CopyFileW(PWideChar(FilePath), PWideChar(WideString(DestFile)), FALSE) then
          MessageBoxW(Handle, PWideChar(FormatW(s_CopySuccess, [FilePath, DestFile])), PWideChar(s_SuccCap), MB_ICONINFORMATION)
        else
          MessageBoxW(Handle, PWideChar(FormatW(s_CopyError, [FilePath, DestFile])), PWideChar(s_ErrCap), MB_ICONERROR);
      end;

    end;

  end;
end;

procedure TfrmPrevw.TntFormResize(Sender: TObject);
begin

  imgPrikitew.Left:= (pRiv.ClientWidth - imgPrikitew.Width) div 2;
  imgPrikitew.Top:= (pRiv.ClientHeight - imgPrikitew.Height) div 2;

end;

end.
