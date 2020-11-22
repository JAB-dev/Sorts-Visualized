unit frmChangeDisplayStyle_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmChangeDisplayStyle = class(TForm)
    cbbStyles: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbbStylesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iLastActive:integer;
  end;

var
  frmChangeDisplayStyle: TfrmChangeDisplayStyle;

implementation
uses unit2;

{$R *.dfm}

procedure TfrmChangeDisplayStyle.cbbStylesChange(Sender: TObject);
begin
  with frmJabsSorts do
  begin
    chtSort.Series[iLastActive].Visible:=false;
    chtSort.Series[cbbStyles.ItemIndex].Visible:=true;
    AtomicExchange(iLastActive,cbbStyles.ItemIndex);
    AtomicExchange(iActiveDisplayStyle,iLastActive);
  end;
end;

procedure TfrmChangeDisplayStyle.FormCreate(Sender: TObject);
var
k:integer;
begin
  with frmJabsSorts do
  begin
    for k := 0 to chtSort.SeriesCount-1 do
    begin
      cbbStyles.Items.Add(chtSort.Series[k].title);
    end;
    cbbStyles.ItemIndex:=0;
    iLastActive:=0;
  end;

end;

end.
