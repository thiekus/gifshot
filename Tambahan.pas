unit Tambahan;

interface

uses
  Windows, Classes, SysUtils, ExtCtrls, Forms, Graphics, ShellAPI, ShlObj,
  UnicodeAdds;

//=== Fungsi + Prosedur ========================================================

function GetAppVer: string;
function IsWindowsXpOrHigher: boolean;
function BlendRGB(const Color1, Color2: TColor; const Blend: Integer): TColor;

procedure DrawGradient(Color1, Color2: TColor; Vertical: boolean; Canv: TCanvas; RectArea: TRect);
function BrowseDialog(const Title: string; const Flag: integer): string;

implementation

function GetAppVer: string;
var
  Major, Minor, Rev, Build: Word;
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin

  VerInfoSize := GetFileVersionInfoSizeW(PWideChar(ParamStrW(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfoW(PWideChar(ParamStrW(0)), 0, VerInfoSize, VerInfo);
  if not VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize) then
    Result := '0.0.0.0'
  else
    with VerValue^ do
      begin
      Major := HiWord(dwFileVersionMS);
      Minor := LoWord(dwFileVersionMS);
      Rev   := HiWord(dwFileVersionLS);
      Build := LoWord(dwFileVersionLS);
      Result := Format('%d.%d.%d.%d', [Major, Minor, Rev, Build]);
    end;

  FreeMem(VerInfo, VerInfoSize);

end;

function IsWindowsXpOrHigher: boolean;
{ Check apakah windows yang dipake Windows XP atau keatas
  Supaya tau bisa bisa transparan. }
begin

  if Win32MajorVersion = 5 then
    begin
    if Win32MinorVersion >= 1 then
      Result:= TRUE
    else
      Result:= FALSE;
  end
  else
    if Win32MajorVersion > 5 then
      Result:= TRUE
    else
      Result:= FALSE;

end;

function BlendRGB(const Color1, Color2: TColor; const Blend: Integer): TColor;
{ Buat ColorBlend dengan paduan Warna1 dan Warna2 supaya bisa nge-buat form
  ColorBlend. Blend warna harus diantara 0 dan 63; 0 = semua Warna1,
  63 = semua Warna2. }
type
  TColorBytes = array[0..3] of Byte;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to 2 do
    TColorBytes(Result)[I] := Integer(TColorBytes(Color1)[I] +
      ((TColorBytes(Color2)[I] - TColorBytes(Color1)[I]) * Blend) div 63);
end;

procedure DrawGradient(Color1, Color2: TColor; Vertical: boolean; Canv: TCanvas; RectArea: TRect);
var
  Z: integer;
  CS: TPoint;
  CV: array[0..63] of TCanvas;
begin

  for Z := 0 to 63 do begin

    CV[Z]:= Canv; //frmMain.Canvas dapat diganti sesuai nama form.
    CS:= RectArea.BottomRight;
    CV[Z].Pen.Width:= 0;
    CV[Z].Brush.Style:= bsSolid;
    CV[Z].Brush.Color:= BlendRGB(ColorToRGB(Color1), ColorToRGB(Color2), Z);

    CV[Z].Pen.Color:= CV[Z].Brush.Color;

    if Vertical then
      CV[Z].Rectangle(Rect(0, MulDiv(CS.Y, Z, 63), CS.X, MulDiv(CS.Y, Z+1, 63)))
    else
      CV[Z].Rectangle(Rect(MulDiv(CS.X, Z, 63), 0, MulDiv(CS.X, Z+1, 63), CS.Y));

  end;

end;

function BrowseDialogCallBack
  (Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): 
  integer stdcall;
var
  wa, rect : TRect;
  dialogPT : TPoint;
begin
  //center in work area
  if uMsg = BFFM_INITIALIZED then
  begin
    wa := Screen.WorkAreaRect;
    GetWindowRect(Wnd, Rect);
    dialogPT.X := ((wa.Right-wa.Left) div 2) - 
                  ((rect.Right-rect.Left) div 2);
    dialogPT.Y := ((wa.Bottom-wa.Top) div 2) - 
                  ((rect.Bottom-rect.Top) div 2);
    MoveWindow(Wnd,
               dialogPT.X,
               dialogPT.Y,
               Rect.Right - Rect.Left,
               Rect.Bottom - Rect.Top,
               True);
  end;

  Result := 0;
end;

function BrowseDialog
 (const Title: string; const Flag: integer): string;
var
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin
  Result:='';
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  with BrowseInfo do begin
    hwndOwner := Application.Handle;
    pszDisplayName := @DisplayName;
    lpszTitle := PChar(Title);
    ulFlags := Flag;
    lpfn := BrowseDialogCallBack;
  end;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if lpItemId <> nil then begin
    SHGetPathFromIDList(lpItemID, TempPath);
    Result := TempPath;
    GlobalFreePtr(lpItemID);
  end;
end;

end.
