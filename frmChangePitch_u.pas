unit frmChangePitch_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TfrmChangePitch = class(TForm)
    trckbrPitch: TTrackBar;
    procedure FormActivate(Sender: TObject);
    procedure trckbrPitchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangePitch: TfrmChangePitch;

implementation
uses
unit2;

{$R *.dfm}

procedure TfrmChangePitch.FormActivate(Sender: TObject);
begin
  trckbrPitch.Min:=-1*(frmJabsSorts.iRange-1);
end;

procedure TfrmChangePitch.trckbrPitchChange(Sender: TObject);
begin
  AtomicExchange(frmJabsSorts.iPitchadjust,trckbrPitch.Position)
end;

end.
