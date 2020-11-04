unit frmStyle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,vcl.themes, Vcl.StdCtrls;

type
  TfrmStyleChanger = class(TForm)
    cbbStyles: TComboBox;
    btnSwapThemes: TButton;
    procedure btnSwapThemesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStyleChanger: TfrmStyleChanger;

implementation

{$R *.dfm}

procedure TfrmStyleChanger.btnSwapThemesClick(Sender: TObject);
begin
  try
    TStyleManager.SetStyle(cbbStyles.Items[cbbStyles.ItemIndex]);
  except
    ShowMessage('harumph, something went wrong');
  end;

end;

end.
