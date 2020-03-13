program DLLExportEnum;

uses
  Vcl.Forms,
  UntMain in 'Units\UntMain.pas' {FrmMain},
  UntEnumDLLExport in 'UntEnumDLLExport.pas',
  UntAbout in 'Units\UntAbout.pas' {FrmAbout},
  UntProcess in 'Units\UntProcess.pas' {FrmProcess},
  UntEnumModules in 'UntEnumModules.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmAbout, FrmAbout);
  Application.CreateForm(TFrmProcess, FrmProcess);
  Application.Run;
end.
