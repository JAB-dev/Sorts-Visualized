program JABsVisualSorts;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {frmJabsSorts},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.Title := 'JABs Sorts Visualizer';
  Application.CreateForm(TfrmJabsSorts, frmJabsSorts);
  Application.Run;
end.
