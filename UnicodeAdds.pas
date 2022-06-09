unit UnicodeAdds;

{===============================================================================

  Khayalan Library for Unicode String Support
  Copyright © Khayalan Software 2011-2012.
  Some copyright are vary from representative source.

  Version  1.0
  Revision 47

===============================================================================}

interface

uses
  SysUtils, Windows;

function StrScanWide( const Str: PWideChar; Chr: WideChar ): PWideChar;
function LastDelimiterW( const Delimiters, S: WideString ): Integer;
// Only for this unit use
//function gfnsFilePathGet(sFile: WideString): WideString;
//function gfnsFileDirGet (sFile: WideString): WideString;
function ExtractFileNameW(FullPath:WideString):WideString;
function ExtractFilePathW(sFile: WideString): WideString;
function ExtractFileDirW (sFile: WideString): WideString;
function ChangeFileExtW( const FileName, Extension: WideString ): WideString;
function FormatW(const Format: WideString; const Args: array of const): WideString;
function FileExistsW(const FileName: WideString): Boolean;
function ParamStrW(Index: Integer): WideString;

implementation

//=== Useful for ExtractFileDirW ===============================================

function gfnsFilePathGet(sFile: WideString): WideString;
var
  i: Integer;
begin
  Result := '';
  if (sFile <> '') then begin
    for i := Length(sFile) downto 1 do begin
      if (sFile[i] = '\') then begin
        Result := Copy(sFile, 1, i);
        Break;
      end else if (sFile[i] = ':') then begin
        Result := Copy(sFile, 1, i) + '\';
        Break;
      end;
    end;
  end;
end;

function gfnsFileDirGet(sFile: WideString): WideString;
var
  i: Integer;
begin
  Result := '';
  if (sFile <> '') then begin
    for i := Length(sFile) downto 1 do begin
      if (sFile[i] = '\') then begin
        Result := Copy(sFile, 1, i - 1);
        Break;
      end else if (sFile[i] = ':') then begin
        Result := Copy(sFile, 1, i);
        Break;
      end;
    end;
  end;
end;

//=== START function from TNTControls http://www.tntware.com/ ==================

function StrScanWide( const Str: PWideChar; Chr: WideChar ): PWideChar;
begin
  Result := Str;
  while Result^ <> Chr do
  begin
    if Result^ = #0 then
    begin
      Result := nil;
      Exit;
    end;
    Inc( Result );
  end;
end;

//==============================================================================

function LastDelimiterW( const Delimiters, S: WideString ): Integer;
var
  P: PWideChar;
begin
  Result := Length( S );
  P := PWideChar( Delimiters );
  while Result > 0 do
  begin
    if ( S[ Result ] <> #0 ) and ( StrScanWide( P, S[ Result ] ) <> nil ) then
      Exit;
    Dec( Result );
  end;
end;

//=== END function from TNTControls http://www.tntware.com/ ====================

function ExtractFileNameW(FullPath:WideString):WideString;
var i,pos:Integer;
begin
  // Find the last path separator
  pos := -1;
  for i:=Length(FullPath) downto 1 do
    if (FullPath[i] = '/') or (FullPath[i] = '\') then
    begin
      pos := i;
      Break;
    end;
  if pos = -1 then
    Result := FullPath
  else
    begin
  Result := '';
      SetLength(Result, Length(FullPath)  - pos);
      System.Move(FullPath[pos+1], Result[1], (Length(FullPath) - pos) * SizeOf(WideChar));
    end;
end;

//==============================================================================

function ExtractFilePathW(sFile: WideString): WideString;
var
  i: Integer;
begin
  Result := '';
  if (sFile <> '') then begin
    for i := Length(sFile) downto 1 do begin
      if (sFile[i] = '\') or (sFile[i] = ':') then begin
        Result := Copy(sFile, 1, i);
        Break;
      end;
    end;
  end;
end;

//==============================================================================

function ExtractFileDirW(sFile: WideString): WideString;
var
  li_Len: Integer;
begin
  Result := gfnsFilePathGet(sFile);
  li_Len := Length(Result);
  if (li_Len >= 3) then begin
    if  (Result[li_Len]      = '\') //AIU
    and (Result[li_Len - 1] <> ':')
    then begin
      //???'\'?????
      SetLength(Result, li_Len - 1);
    end;
  end;
end;

//==============================================================================

function ChangeFileExtW( const FileName, Extension: WideString ): WideString;
var
  I: Integer;
begin
  I := LastDelimiterW( '.\:',Filename );
  if ( I = 0 ) or ( FileName[ I ] <> '.' ) then I := MaxInt;
  Result := Copy( FileName, 1, I - 1 ) + Extension;
end;

//==============================================================================

function FormatW(const Format: WideString; const Args: array of const): WideString;
begin
  WideFmtStr(Result, Format, Args);
end;

//==============================================================================

function FileExistsW(const FileName: WideString): Boolean;

  function FileAgeW(const FileName: WideString): Integer;
  var
    Handle: THandle;
    FindData: _WIN32_FIND_DATAW;
    LocalFileTime: TFileTime;
  begin
    Handle := FindFirstFileW(PWideChar(FileName), FindData);
    if Handle <> INVALID_HANDLE_VALUE then
    begin
      Windows.FindClose(Handle);
      if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
      begin
        FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
        if FileTimeToDosDateTime(LocalFileTime, LongRec(Result).Hi,
          LongRec(Result).Lo) then Exit;
      end;
    end;
    Result := -1;
  end;

begin
  Result := FileAgeW(FileName) <> -1;
end;

//=== Use for ParamStrW function ===============================================

function GetParamStrW(P: PWideChar; var Param: WideString): PWideChar;
var
  i, Len: Integer;
  Start, S, Q: PWideChar;
begin
  while True do
  begin
    while (P[0] <> #0) and (P[0] <= ' ') do
      P := CharNextW(P);
    if (P[0] = '"') and (P[1] = '"') then Inc(P, 2) else Break;
  end;
  Len := 0;
  Start := P;
  while P[0] > ' ' do
  begin
    if P[0] = '"' then
    begin
      P := CharNextW(P);
      while (P[0] <> #0) and (P[0] <> '"') do
      begin
        Q := CharNextW(P);
        Inc(Len, Q - P);
        P := Q;
      end;
      if P[0] <> #0 then
        P := CharNextW(P);
    end
    else
    begin
      Q := CharNextW(P);
      Inc(Len, Q - P);
      P := Q;
    end;
  end;

  SetLength(Param, Len);

  P := Start;
  S := Pointer(Param);
  i := 0;
  while P[0] > ' ' do
  begin
    if P[0] = '"' then
    begin
      P := CharNextW(P);
      while (P[0] <> #0) and (P[0] <> '"') do
      begin
        Q := CharNextW(P);
        while P < Q do
        begin
          S[i] := P^;
          Inc(P);
          Inc(i);
        end;
      end;
      if P[0] <> #0 then P := CharNextW(P);
    end
    else
    begin
      Q := CharNextW(P);
      while P < Q do
      begin
        S[i] := P^;
        Inc(P);
        Inc(i);
      end;
    end;
  end;

  Result := P;
end;

//=== Modified version from Delphi 7 RTL - Mod By FARISSS ======================

function ParamStrW(Index: Integer): WideString;
var
  P: PWideChar;
  Buffer: array[0..255] of WideChar;
begin
  Result := '';
  if Index = 0 then
    begin
    //SetString(Result, Buffer, GetModuleFileName(0, Buffer, SizeOf(Buffer)))
    GetModuleFileNameW(0, Buffer, SizeOf(Buffer));
    Result:= Buffer;
  end
  else
  begin
    P := GetCommandLineW;
    while True do
    begin
      P := GetParamStrW(P, Result);
      if (Index = 0) or (Result = '') then Break;
      Dec(Index);
    end;
  end;
end;

end.
