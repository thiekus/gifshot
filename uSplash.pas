unit uSplash;

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
  Dialogs, ExtCtrls, StdCtrls, LangStr;

type
  TfrmSplsh = class(TForm)
    psp: TPanel;
    imgSpl: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BuatSplash;
  end;

var
  frmSplsh: TfrmSplsh;

implementation

{$R *.dfm}

{ TfrmSplsh }

procedure TfrmSplsh.BuatSplash;
begin

  //cap1.Caption:= appname;
  //cap2.Caption:= appname;
  //copyr.Caption:= copyrg;

  //imgIco.Picture.Icon.Handle:= LoadIcon(hInstance, 'MAINICON');
  imgSpl.Picture.Bitmap.LoadFromResourceName(hInstance, 'APPLOGO');

  Show;
  Update;

end;

procedure TfrmSplsh.FormShow(Sender: TObject);
begin
  Left:= (Screen.DesktopWidth - Width) div 2;
  Top:= (Screen.DesktopHeight - Height) div 2;
  AnimateWindow(Handle, 1000, AW_BLEND);
end;

end.
