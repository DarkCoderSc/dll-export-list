(*******************************************************************************
  Author:
    ->  Jean-Pierre LESUEUR (@DarkCoderSc)
        https://github.com/DarkCoderSc
        https://gist.github.com/DarkCoderSc
        https://www.phrozen.io/
  License:
    -> MIT
*******************************************************************************)

unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Menus, commctrl, Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    lstview: TListView;
    Img16: TImageList;
    status: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    LoadFile1: TMenuItem;
    LoadProcess1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    About1: TMenuItem;
    OD: TOpenDialog;
    SD: TSaveDialog;
    Export1: TMenuItem;
    Clear1: TMenuItem;
    Export2: TMenuItem;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure lstviewCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure LoadFile1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Export2Click(Sender: TObject);
    procedure LoadProcess1Click(Sender: TObject);
  private
    procedure Reset();

  public
    procedure OpenDDL(ADLLFileName : String);
    procedure ExportListToFile();
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses UntEnumDLLExport, UntAbout, UntProcess;

procedure TFrmMain.Reset();
begin
  self.lstview.Clear;
  status.Panels.Items[0].Text := 'Exported Count : N/A';
  status.Panels.Items[1].Text := 'Status : N/A';
  caption := 'DLL Export Enum';
end;

procedure TFrmMain.Export2Click(Sender: TObject);
begin
  self.ExportListToFile();
end;

procedure TFrmMain.ExportListToFile();
var i, n    : integer;
    AItem   : TListItem;
    AList   : TStringList;
    ARecord : String;
begin
  if NOT SD.Execute() then
    Exit();

  AList := TStringList.Create();
  try
    for I := 0 to self.lstview.items.Count -1 do begin
      AItem := self.lstview.Items.Item[i];

      ARecord := 'Name : ' + AItem.Caption + #13#10;
      for n := 0 to AItem.SubItems.Count -1 do begin
        ARecord := ARecord + self.lstview.Columns.Items[n].Caption + ' : ' + AItem.SubItems[n] + #13#10;
      end;
      ARecord := ARecord + '-----------------------------------------' + #13#10;

      AList.Add(ARecord);
    end;

    AList.SaveToFile(SD.FileName);
  finally
    if Assigned(AList) then
      FreeAndNil(AList);
  end;
end;

procedure TFrmMain.OpenDDL(ADLLFileName : String);
var AEnumDLLExport : TEnumDLLExport;
    i              : integer;
    AEntry         : TExportEntry;
    AListItem      : TListItem;
    AForwarded     : Boolean;
    ARet           : Integer;
    AStatus        : String;
begin
  self.lstview.Clear;

  AEnumDLLExport := TEnumDLLExport.Create(ADLLFileName);

  self.Caption := 'DLL Export Enum [' + AEnumDLLExport.FileName + ']';

  ARet := AEnumDLLExport.Enum();

  for i := 0 to AEnumDLLExport.Items.Count -1 do begin
    AEntry := AEnumDLLExport.Items.Items[i];

    AListItem := self.lstview.Items.Add;

    AListItem.Caption := AEntry.Name;

    if AEntry.Forwarded then
      AListItem.SubItems.Add(AEntry.ForwardName)
    else
      AListItem.SubItems.Add(AEntry.FormatedAddress);

    AListItem.SubItems.Add(AEntry.FormatedRelativeAddress);
    AListItem.SubItems.Add(Format('%d (0x%s)', [AEntry.Ordinal, IntToHex(AEntry.Ordinal, 1)]));
    AListItem.ImageIndex := 0;
  end;

  status.Panels.Items[0].Text := Format('Exported Count : %d', [AEnumDLLExport.Items.Count]);

  case ARet of
    -99 : AStatus := 'Unknown';
    -1  : AStatus := 'Could not open file.';
    -2  : AStatus := 'Could not read image dos header.';
    -3  : AStatus := 'Invalid or corrupted PE File.';
    -4  : AStatus := 'Could not read nt header signature.';
    -5  : AStatus := 'Could not read image file header.';
    -6  : AStatus := 'Could not read optional header.';
    -7  : AStatus := 'Could not retrieve entry export address.';
    -8  : AStatus := 'Could not read export directory.';
    -9  : AStatus := 'No exported functions';
    else
      AStatus := 'Success';
  end;

  status.Panels.Items[1].Text := AStatus;
end;

procedure TFrmMain.About1Click(Sender: TObject);
begin
  FrmAbout.Show();
end;

procedure TFrmMain.Clear1Click(Sender: TObject);
begin
  Reset();
end;

procedure TFrmMain.Exit1Click(Sender: TObject);
begin
  FrmMain.Close();
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Reset();
end;

procedure TFrmMain.LoadFile1Click(Sender: TObject);
begin
  if NOT OD.Execute() then
    Exit();

  self.OpenDDL(OD.FileName);
end;

procedure TFrmMain.LoadProcess1Click(Sender: TObject);
begin
  FrmProcess.ShowModal();
end;

procedure TFrmMain.lstviewCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Odd(Item.Index) then
    Sender.Canvas.Brush.Color := RGB(245, 245, 245);
end;

end.
