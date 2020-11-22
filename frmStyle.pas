unit frmStyle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,vcl.themes, Vcl.StdCtrls,
  Vcl.Samples.Spin;

type
  TfrmStyleChanger = class(TForm)
    cbbStyles: TComboBox;
    btnSwapThemes: TButton;
    seBarWidth: TSpinEdit;
    lblBarWidth: TLabel;
    chkShowActivebars: TCheckBox;
    procedure btnSwapThemesClick(Sender: TObject);
    procedure seBarWidthChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStyleChanger: TfrmStyleChanger;


implementation
uses
  unit2;
{$R *.dfm}

procedure TfrmStyleChanger.btnSwapThemesClick(Sender: TObject);
begin
  try
    TStyleManager.SetStyle(cbbStyles.Items[cbbStyles.ItemIndex]);
  except
    ShowMessage('harumph, something went wrong');
  end;
end;

procedure TfrmStyleChanger.FormCreate(Sender: TObject);
begin
  cbbStyles.ItemIndex:=0;
end;

procedure TfrmStyleChanger.seBarWidthChange(Sender: TObject);
begin
  with frmJabsSorts do
  begin
    barseriesSort.BarWidthPercent:=seBarWidth.Value;
  end;

end;

end.
