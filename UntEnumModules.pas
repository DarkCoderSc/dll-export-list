(*******************************************************************************
  Author:
    ->  Jean-Pierre LESUEUR (@DarkCoderSc)
        https://github.com/DarkCoderSc
        https://gist.github.com/DarkCoderSc
        https://www.phrozen.io/
  License:
    -> MIT
*******************************************************************************)

unit UntEnumModules;

interface

uses Classes, Windows, tlHelp32, SysUtils, Generics.Collections, psAPI;

function EnumModules(ATargetProcessID : Cardinal) : TList<TModuleEntry32>;

implementation

{-------------------------------------------------------------------------------
  One possible method to get process image path from process id.

  Doesn't support Windows XP and below, Windows XP is dead :-( - One technique
  would be to use GetModuleFileNameExW()
-------------------------------------------------------------------------------}
function GetProcessName(AProcessID : Cardinal) : String;
var hProc      : THandle;
    ALength    : DWORD;
    hDLL       : THandle;

    QueryFullProcessImageNameW : function(
                                            AProcess: THANDLE;
                                            AFlags: DWORD;
                                            AFileName: PWideChar;
                                            var ASize: DWORD): BOOL; stdcall;

const PROCESS_QUERY_LIMITED_INFORMATION = $00001000;
begin
  result := '';
  ///

  if (TOSVersion.Major < 6) then  
    Exit();
  ///
  
  QueryFullProcessImageNameW := nil;
  
  hDLL := LoadLibrary('kernel32.dll');
  if hDLL = 0 then
    Exit();  
  try
    @QueryFullProcessImageNameW := GetProcAddress(hDLL, 'QueryFullProcessImageNameW');
    ///
    
    if Assigned(QueryFullProcessImageNameW) then begin
      hProc := OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, false, AProcessID);
      if hProc = 0 then exit;
      try
        ALength := (MAX_PATH * 2);
        
        SetLength(result, ALength);
        
        if NOT QueryFullProcessImageNameW(hProc, 0, @result[1], ALength) then 
          Exit();

        SetLength(result, ALength); // Get rid of extra junk
      finally
        CloseHandle(hProc);
      end;
    end;
  finally
    FreeLibrary(hDLL);
  end;
end;

{
  Enumerate target process modules (Loaded DLL's)
}
function EnumModules(ATargetProcessID : Cardinal) : TList<TModuleEntry32>;
var ASnap        : THandle;
    AModuleEntry : TModuleEntry32;
    AOwnerPath   : String;

const TH32CS_SNAPMODULE32 = $00000010;

    procedure Append();
    begin
      if AOwnerPath.ToLower = String(AModuleEntry.szExePath).ToLower then
        Exit(); // Ignore
        
      result.Add(AModuleEntry);
    end;

begin
  result := TList<TModuleEntry32>.Create();
  ///

  AOwnerPath := GetProcessName(ATargetProcessId);
  
  ASnap := CreateToolHelp32Snapshot(TH32CS_SNAPMODULE or TH32CS_SNAPMODULE32, ATargetProcessId);
  if ASnap = INVALID_HANDLE_VALUE then begin
    Exit;
  end;
  try
    ZeroMemory(@AModuleEntry, SizeOf(TModuleEntry32));
    
    AModuleEntry.dwSize := SizeOf(TModuleEntry32);
    ///

    if NOT Module32First(ASnap, AModuleEntry) then begin
      Exit();
    end;

    Append();

    while True do begin
      ZeroMemory(@AModuleEntry, SizeOf(TModuleEntry32));
      
      AModuleEntry.dwSize := SizeOf(TModuleEntry32);
      ///

      if NOT Module32Next(ASnap, AModuleEntry) then begin
        Break;
      end;

      Append();
    end;
  finally
    CloseHandle(ASnap);
  end;
end;

end.
