unit uSendConf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, LbButton, Tambahan, TntForms, TntStdCtrls,
  LangStr;

type
  TfrmSendConf = class(TTntForm)
    pAtas: TPanel;
    pBawah: TPanel;
    pbBawah: TPaintBox;
    btnOk: TLbButton;
    btnCancel: TLbButton;
    lblSendDesc: TTntLabel;
    rbSendMail: TTntRadioButton;
    lblSendMailDesc: TTntLabel;
    rbSendDev: TTntRadioButton;
    lblSendDevDesc: TTntLabel;
    pbAtas: TPaintBox;
    bvSel: TBevel;
    procedure rbSendMailClick(Sender: TObject);
    procedure rbSendDevClick(Sender: TObject);
    procedure pbAtasPaint(Sender: TObject);
    procedure pbBawahPaint(Sender: TObject);
    procedure TntFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSendConf: TfrmSendConf;

implementation

{$R *.dfm}

procedure TfrmSendConf.rbSendMailClick(Sender: TObject);
begin
  bvSel.Top:= 48;
end;

procedure TfrmSendConf.rbSendDevClick(Sender: TObject);
begin
  bvSel.Top:= 112;
end;

procedure TfrmSendConf.pbAtasPaint(Sender: TObject);
begin

  if IsWindowsXpOrHigher then
    DrawGradient($00ECCE94, $00FCE6D4, TRUE, pbAtas.Canvas, pbAtas.ClientRect);

end;

procedure TfrmSendConf.pbBawahPaint(Sender: TObject);
begin

  if IsWindowsXpOrHigher then
    DrawGradient($00ECCE94, $00FCE6D4, FALSE, pbBawah.Canvas, pbBawah.ClientRect);

end;

procedure TfrmSendConf.TntFormShow(Sender: TObject);
begin
  {$I LangAcc_uSendConf.inc}
end;

end.
