unit uMailEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LbButton, ExtCtrls, StdCtrls, Tambahan, TntForms, TntClasses,
  TntStdCtrls, UnicodeAdds, LangStr;

type
  TfrmMailEdt = class(TTntForm)
    pAtas: TPanel;
    pBawah: TPanel;
    lblSubjDesc: TLabel;
    edtSubj: TTntEdit;
    lblBodyDesc: TLabel;
    mmBody: TTntMemo;
    pbAtas: TPaintBox;
    pbBawah: TPaintBox;
    btnOk: TLbButton;
    btnCancel: TLbButton;
    btnClr: TLbButton;
    procedure pbAtasPaint(Sender: TObject);
    procedure pbBawahPaint(Sender: TObject);
    procedure btnClrClick(Sender: TObject);
    procedure TntFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMailEdt: TfrmMailEdt;

implementation

{$R *.dfm}

procedure TfrmMailEdt.pbAtasPaint(Sender: TObject);
begin

  if IsWindowsXpOrHigher then
    DrawGradient($00ECCE94, $00FCE6D4, TRUE, pbAtas.Canvas, pbAtas.ClientRect);

end;

procedure TfrmMailEdt.pbBawahPaint(Sender: TObject);
begin

  if IsWindowsXpOrHigher then
    DrawGradient($00ECCE94, $00FCE6D4, FALSE, pbBawah.Canvas, pbBawah.ClientRect);

end;

procedure TfrmMailEdt.btnClrClick(Sender: TObject);
begin
  edtSubj.Clear;
  mmBody.Clear;
end;

procedure TfrmMailEdt.TntFormShow(Sender: TObject);
var
  SubLd, BodyLd: TTntStringList;
begin

  {$I LangAcc_umailEdit.inc}

  SubLd:= TTntStringList.Create;
  BodyLd:= TTntStringList.Create;
  try
    SubLd.LoadFromFile(ExtractFilePathW(ParamStrW(0))+'MailSubject.dat');
    BodyLd.LoadFromFile(ExtractFilePathW(ParamStrW(0))+'MailBody.dat');
    edtSubj.Text:= SubLd.Text;
    mmBody.Clear;
    mmBody.Lines.AddStrings(BodyLd);
  finally
    SubLd.Free;
    BodyLd.Free;
  end;
end;

end.
