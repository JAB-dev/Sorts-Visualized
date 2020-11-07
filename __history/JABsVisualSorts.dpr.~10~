program JABsVisualSorts;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {frmJabsSorts},
  Vcl.Themes,
  Vcl.Styles,
  frmCodeYourOwn_u in 'frmCodeYourOwn_u.pas' {frmPython},
  clsSounds in 'clsSounds.pas',
  frmChangeInstrument_u in 'frmChangeInstrument_u.pas' {frmChangeInstrument},
  frmUpdate_u in 'frmUpdate_u.pas' {frmUpdate},
  frmStyle in 'frmStyle.pas' {frmStyleChanger};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.Title := 'JABs Sorts Visualizer';
  Application.CreateForm(TfrmJabsSorts, frmJabsSorts);
  Application.CreateForm(TfrmPython, frmPython);
  Application.CreateForm(TfrmChangeInstrument, frmChangeInstrument);
  Application.CreateForm(TfrmUpdate, frmUpdate);
  Application.CreateForm(TfrmStyleChanger, frmStyleChanger);
  Application.Run;
end.
