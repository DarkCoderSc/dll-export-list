(*******************************************************************************
  Author:
    ->  Jean-Pierre LESUEUR (@DarkCoderSc)
        https://github.com/DarkCoderSc
        https://gist.github.com/DarkCoderSc
        https://www.phrozen.io/
  License:
    -> MIT
*******************************************************************************)

unit UntProcess;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus;

type
  TFrmProcess = class(TForm)
    lstprocess: TListView;
    lstmodules: TListView;
    Splitter1: TSplitter;
    popmodules: TPopupMenu;
    ShowDLLExports1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure lstprocessClick(Sender: TObject);
    procedure lstprocessCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lstmodulesCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lstmodulesDblClick(Sender: TObject);
    procedure ShowDLLExports1Click(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshProcessList();
    procedure RefreshProcessModules(AProcessId : Cardinal);
    procedure LoadSelectedModule();
  public
    { Public declarations }
  end;

var
  FrmProcess: TFrmProcess;

implementation

{$R *.dfm}

uses tlHelp32, Generics.Collections, UntEnumModules, UntMain;

{
  https://www.phrozen.io/snippets/2020/03/enum-process-method-1-delphi/
}
function EnumProcess() : TDictionary<Integer {Process Id}, String {Process Name}>;
var ASnap         : THandle;
    AProcessEntry : TProcessEntry32;
    AProcessName  : String;

    procedure AppendEntry();
    begin
      result.Add(AProcessEntry.th32ProcessID, AProcessEntry.szExeFile);
    end;

begin
  result := TDictionary<Integer, String>.Create();
  ///

  ASnap := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if ASnap = INVALID_HANDLE_VALUE then
    Exit();
  try
    ZeroMemory(@AProcessEntry, SizeOf(TProcessEntry32));
    ///

    AProcessEntry.dwSize := SizeOf(TProcessEntry32);

    if NOT Process32First(ASnap, AProcessEntry) then
      Exit();

    AppendEntry();

    while True do begin
      ZeroMemory(@AProcessEntry, SizeOf(TProcessEntry32));
      ///

      AProcessEntry.dwSize := SizeOf(TProcessEntry32);

      if NOT Process32Next(ASnap, AProcessEntry) then
        break;

      AppendEntry();
    end;
  finally
    CloseHandle(ASnap);
  end;
end;

procedure TFrmProcess.FormShow(Sender: TObject);
begin
  RefreshProcessList();
end;

procedure TFrmProcess.lstmodulesCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Odd(Item.Index) then
    Sender.Canvas.Brush.Color := RGB(245, 245, 245);
end;

procedure TFrmProcess.LoadSelectedModule();
begin
  if self.lstmodules.selected <> nil then begin
    FrmMain.OpenDDL(self.lstmodules.Selected.Caption);

    Close();
  end;
end;

procedure TFrmProcess.lstmodulesDblClick(Sender: TObject);
begin
  LoadSelectedModule();
end;

procedure TFrmProcess.lstprocessClick(Sender: TObject);
var AProcessId : Integer;
begin
  if self.lstprocess.Selected <> nil then begin
    if TryStrToInt(self.lstprocess.Selected.SubItems[0], AProcessId) then
      RefreshProcessModules(AProcessId);
  end;
end;

procedure TFrmProcess.lstprocessCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Odd(Item.Index) then
    Sender.Canvas.Brush.Color := RGB(245, 245, 245);
end;

procedure TFrmProcess.RefreshProcessList();
var AList        : TDictionary<Integer, String>;
    AItem        : TListItem;
    AProcessId   : Cardinal;
    AProcessName : String;
begin
  self.lstprocess.Clear();
  ///

  AList := EnumProcess();
  try
    for AProcessId in AList.Keys do begin
      if NOT AList.TryGetValue(AProcessId, AProcessName) then
        continue;
      ///

      AItem := self.lstprocess.Items.Add;

      AItem.Caption := AProcessName;
      AItem.SubItems.Add(IntToStr(AProcessId));
    end;
  finally
    if Assigned(AList) then
      FreeAndNil(AList);
  end;
end;

procedure TFrmProcess.RefreshProcessModules(AProcessId : Cardinal);
var AList        : TList<TModuleEntry32>;
    AModuleEntry : TModuleEntry32;
    i            : Integer;
    AListItem    : TListItem;
begin
  AList := EnumModules(AProcessId);

  self.lstmodules.Clear;

  for i := 0 to AList.Count -1 do begin
    AModuleEntry := AList.Items[i];

    AListItem := self.lstmodules.Items.Add;

    AListItem.Caption := AModuleEntry.szExePath;
  end;
end;

procedure TFrmProcess.ShowDLLExports1Click(Sender: TObject);
begin
  LoadSelectedModule();
end;

end.
