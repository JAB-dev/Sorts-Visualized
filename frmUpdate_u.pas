unit frmUpdate_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.OleCtrls,
  SHDocVw, Vcl.StdCtrls;

type
  TfrmUpdate = class(TForm)
    wbUpdate: TWebBrowser;
    btnDownloadLatest: TButton;
    btnDownload32: TButton;
    procedure btnDownloadLatestClick(Sender: TObject);
    procedure btnDownload32Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdate: TfrmUpdate;

implementation

{$R *.dfm}

procedure TfrmUpdate.btnDownload32Click(Sender: TObject);
begin
  wbUpdate.Navigate('https://github.com/JAB-dev/Sorts-Visualized/raw/Executable/Win32/Release/JABsVisualSorts.exe');
end;

procedure TfrmUpdate.btnDownloadLatestClick(Sender: TObject);
begin
  wbUpdate.Navigate('https://github.com/JAB-dev/Sorts-Visualized/raw/Executable/Win64/Release/JABsVisualSorts.exe');
end;

end.
