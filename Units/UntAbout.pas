unit UntAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.GIFImg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFrmAbout = class(TForm)
    ImgBg: TImage;
    ImgJPL: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbout: TFrmAbout;

implementation

{$R *.dfm}

procedure TFrmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  (self.ImgBg.Picture.Graphic as TGIFImage).Animate := False;
end;

procedure TFrmAbout.FormShow(Sender: TObject);
begin
  (self.ImgBg.Picture.Graphic as TGIFImage).Animate := True;
end;

end.
