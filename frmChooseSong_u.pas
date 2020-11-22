unit frmChooseSong_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmChooseSong = class(TForm)
    dlgOpenSong: TOpenDialog;
    cbbSongs: TComboBox;
    btnLoad: TButton;
    chkUseSong: TCheckBox;
    procedure btnLoadClick(Sender: TObject);
    procedure chkUseSongClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChooseSong: TfrmChooseSong;

implementation
uses unit2;

{$R *.dfm}

procedure TfrmChooseSong.btnLoadClick(Sender: TObject);
begin
   dlgOpenSong.InitialDir:=GetCurrentDir;
  if dlgOpenSong.Execute then
  begin
    frmJabsSorts.sSongPath:=(dlgOpenSong.FileName);
    frmJabsSorts.WMp1.URL:=frmJabsSorts.sSongPath;
  end;
end;

procedure TfrmChooseSong.chkUseSongClick(Sender: TObject);
begin
  if chkUseSong.Enabled then
  begin
    if frmJabsSorts.sSongPath<>'' then
    begin
      frmJabsSorts.bSongMode:=true;
    end else
    begin
      ShowMessage('It seems no song is selected!');
    end;
  end else
  begin
    frmJabsSorts.bSongMode:=false;
    frmJabsSorts.WMp1.controls.pause;
    frmJabsSorts.sSongPath:='';
  end;


end;

end.
