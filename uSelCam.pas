unit uSelCam;

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
  Dialogs, LbButton, StdCtrls, DSPack, DSUtil, DirectShow9, LangStr, TntForms;

type
  TfrmSelCam = class(TTntForm)
    lblCamSel: TLabel;
    cbxCam: TComboBox;
    btnOk: TLbButton;
    btnCancel: TLbButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelCam: TfrmSelCam;

implementation

uses uMain;

//uses DCAVICap32;

{$R *.dfm}

procedure TfrmSelCam.FormShow(Sender: TObject);
//var
  //i: integer;
  //DriverName: PChar;
begin

  {$I LangAcc_uSelCam.inc}

  //GetMem(DriverName, 250);

  cbxCam.Items.Clear;
  //i:= 0;

  {while capGetDriverDescription(i, DriverName, 250, nil, 0) do
    begin
    cbxCam.Items.Add(string(DriverName));
    Inc(i);
  end;

  FreeMem(DriverName);}

  cbxCam.Items.AddStrings(frmMain.VidLst);
  cbxCam.ItemIndex:= 0;

end;

end.
