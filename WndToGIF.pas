unit WndToGIF;

{===============================================================================

   Faris's Webcam2GIF Original Source
   Copyright © Faris Khowarizmi 2012
   All Right Reserved

   Coded by Faris Khowarizmi
   Project Started on 28 April 2012

===============================================================================}

// Main routine warning off
{$DEFINE NOROUTINEWARN}

interface

uses
  Classes, Windows, Graphics, SysUtils, GIFImage, uMain, LangStr,
  UnicodeAdds, TntClasses, IdGlobal;

type
  TWndToGIF = class(TThread)
  private
    { Private declarations }

    Wnd: HWnd;
    WndW, WndH: integer;
    Speed: real;
    FrLimit: integer;
    Cprs, Lp, HQ, Rev, RSize: boolean;
    NW, NH: integer;
    GIFpath: WideString;
    TempSht: TBitmap;

    pbMax, pbPos: integer;

    StopRec, PauseRec: boolean;
    StatusCap: WideString;

  protected
    procedure Execute; override;
    procedure SetCaption(Capt: string);
    procedure GetRecStat;
    procedure PausePreview;
    procedure UpdateStatus;
    procedure GetShot;
    procedure SetPrbMaxAsync;
    procedure SetPrbPosAsync;
    procedure SetPrbMax(val: integer);
    procedure IncPrbPos;
    procedure ShowPrb;
    procedure HidePrb;
    procedure FinalStage;
  public
    constructor WndToGIFExec(rWnd: HWnd; rWndW, rWndH: integer; rSpeed: real; rFrLimit: integer; rCprs, rLp, rHQ, rRev, rRSize: boolean; rNW, rNH: integer; rGIFpath: WideString);
  end;

implementation

{$IFDEF NOROUTINEWARN}{$WARNINGS OFF}{$ENDIF}
procedure TWndToGIF.Execute;

  procedure WaitMsg(delay, CurrentTick: Cardinal);
  var
    it: Cardinal;
  begin

    it:= 0;

    while it < CurrentTick do
      it:= GetTickDiff(delay, GetTickCount);

  end;

label Ulangi;
var
  gf: GIFImage.TGIFImage;
  loopext: TGIFAppExtNSLoop;
  delayext: TGIFGraphicControlExtension;
  //CamCv: TCanvas;
  //HndDC: HDC;
  bm: array of TBitmap;
  frme: integer;
  prbSet: integer;
  iWidth, iHeight: integer;
  delayrate: Cardinal;
  loop: integer;
  cn, fcn, ncn, capcn: Cardinal;
  tme: double;
  SvStream: TTntFileStream;

  procedure EnlargeFrame;
  begin

    SetLength(bm, frme+1);
    bm[frme]:= TBitmap.Create;
    bm[frme].Width:= iWidth;
    bm[frme].Height:= iHeight;

  end;

begin

  try

    //SetThreadPriority(GetCurrentThread, HIGH_PRIORITY_CLASS);

    delayrate:= Trunc(1000/Speed);
    frme:= 0;
    //cn:= 0;
    //tme:= 0;

    //HndDC:= GetWindowDC(Wnd);

    TempSht:= TBitmap.Create;

    gf:= GIFImage.TGIFImage.Create;
    gf.DrawOptions:= [goAsync, goAnimate, goLoopContinously];

    if RSize then
      begin

      gf.Width:= nW;
      gf.Height:= nH;

    end
    else
      begin

      gf.Width:= WndW;
      gf.Height:= WndH;

    end;

    iWidth:= gf.Width;
    iHeight:= gf.Height;

    if HQ then
      gf.ColorReduction:= rmQuantizeWindows
    else
      gf.ColorReduction:= rmQuantize;

    if Cprs then
      gf.Compression:= gcLZW;

    //CamCv:= TCanvas.Create;
    //CamCv.Handle:= HndDC;

    try

      Synchronize(GetRecStat);
      EnlargeFrame;

      capcn:= delayrate;
      //dcn:= GetTickCount;

      while not StopRec do
        begin

        cn:= GetTickCount;

        // Ini juga bisa
        // Tapi makan banyak CPU :P
        //
        //capFileSaveDIB(hAVI, PChar(tmp));
        //bm.LoadFromFile(tmp);
        //

        // Setiap penggambaran harus diawali dengan Lock & diakhiri dengan Unlock
        // lihat disini: http://qc.embarcadero.com/wc/qcmain.aspx?d=55871

        Synchronize(GetShot);

        bm[frme].Canvas.Lock;

        try

          bm[frme].Canvas.StretchDraw(Rect(0, 0, iWidth, iHeight), TempSht);

        finally

          bm[frme].Canvas.Unlock;

        end;

        //TempSht.SaveToFile(Format('debugframe\fl_%d.bmp', [frme]));

        Inc(frme);
        tme:= capcn/1000;

        SetCaption(FormatW(s_InRecord, [FormatFloat('#0.00', tme), frme]));

        EnlargeFrame;

        Synchronize(GetRecStat);

        if PauseRec then
          begin

          SetCaption(s_RecPause);
          repeat
            Synchronize(GetRecStat);
          until (not PauseRec) or (StopRec);

        end;

        if frme <> FrLimit then
          begin
          fcn:= GetTickCount;
          ncn:= GetTickDiff(cn, fcn);
          Inc(capcn, delayrate);
          WaitMsg(delayrate-ncn, fcn);
        end
        else
          StopRec:= TRUE;

      end;

    finally

      //capPreview(Wnd, FALSE);
      Synchronize(PausePreview);
      pbPos:= 0;
      Synchronize(SetPrbPosAsync);
      prbSet:= frme;
      if Rev then
        Inc(prbSet, frme-1);
      if Lp then
        Inc(prbSet);
      Inc(prbSet, 1);
      SetPrbMax(prbSet);
      Synchronize(ShowPrb);

      bm[frme].Free;

      for loop:= 0 to frme-1 do
        begin
        gf.Add(bm[loop]);
        bm[loop].Free;
        IncPrbPos;
        SetCaption(FormatW(s_InCombine, [loop+1, frme]));
      end;

      if Rev then
        begin

        for loop:= frme-2 downto 1 do
          begin
          gf.Add(gf.Images[loop].Bitmap);
          IncPrbPos;
          SetCaption(FormatW(s_InCombineRev, [loop+1]));
        end;

        frme:= frme+(frme-1);

      end;

      delayext:= TGIFGraphicControlExtension.Create(gf.Images[0]);
      delayext.Delay:= DelayRate div 10;
      gf.Images[0].Extensions.Add(delayext);

      IncPrbPos;
      SetCaption(s_InSetDelay);

      if Lp then
        begin

        loopext:= TGIFAppExtNSLoop.Create(gf.Images[0]);
        loopext.Loops:= 0;
        gf.Images[0].Extensions.Add(loopext);

        IncPrbPos;
        SetCaption(s_InSetLoops);

      end;

      IncPrbPos;
      SetCaption(s_Saving);

      SvStream:= TTntFileStream.Create(GIFPath, fmCreate);

      try

        SvStream.Position:= 0;
        gf.SaveToStream(SvStream);

      finally

        SvStream.Free;

      end;

      IncPrbPos;
      SetCaption(s_Finishing);

      delayext.Free;

      if Lp then
        loopext.Free;

      gf.Free;
      TempSht.Free;
      //CamCv.Free;

    end;

  finally

    Synchronize(HidePrb);
    Synchronize(FinalStage);
    Self.FreeOnTerminate:= TRUE;

  end;

end;

{$IFDEF NOROUTINEWARN}{$WARNINGS ON}{$ENDIF}

procedure TWndToGIF.SetCaption(Capt: string);
begin
  StatusCap:= Capt;
  Synchronize(UpdateStatus);
end;

procedure TWndToGIF.FinalStage;
begin
  frmMain.FinishCreate;
end;

procedure TWndToGIF.GetShot;
begin
  frmMain.sGrabber.GetBitmap(TempSht);
end;

procedure TWndToGIF.PausePreview;
begin
  frmMain.fGraph.Stop;
end;

procedure TWndToGIF.GetRecStat;
begin
  PauseRec:= frmMain.PauseRec;
  StopRec:= frmMain.StopRec;
end;

procedure TWndToGIF.UpdateStatus;
begin
  frmMain.lblStatr.Caption:= StatusCap;
end;

constructor TWndToGIF.WndToGIFExec(rWnd: HWnd; rWndW, rWndH: integer; rSpeed: real;
  rFrLimit: integer; rCprs, rLp, rHQ, rRev, rRSize: boolean; rNW, rNH: integer;
  rGIFpath: WideString);
begin

  // Inisialisasi variabel
  Wnd:= rWnd;
  WndW:= rWndW;
  WndH:= rWndH;
  Speed:= rSpeed;
  FrLimit:= rFrLimit;
  Cprs:= rCprs;
  Lp:= rLp;
  HQ:= rHQ;
  Rev:= rRev;
  RSize:= rRSize;
  NW:= rNW;
  NH:= rNH;
  GIFpath:= rGIFPath;

  // Membuat Thread
  inherited Create(FALSE);

end;

procedure TWndToGIF.SetPrbMaxAsync;
begin
  frmMain.pb.Max:= pbMax;
end;

procedure TWndToGIF.SetPrbPosAsync;
begin
  frmMain.pb.Position:= pbPos;
end;

procedure TWndToGIF.SetPrbMax(val: integer);
begin
  pbMax:= Val;
  Synchronize(SetPrbMaxAsync);
end;

procedure TWndToGIF.IncPrbPos;
begin
  Inc(pbPos);
  Synchronize(SetPrbPosAsync);
end;

procedure TWndToGIF.ShowPrb;
begin
  frmMain.pb.Show;
end;

procedure TWndToGIF.HidePrb;
begin
  frmMain.pb.Hide;
end;

end.
