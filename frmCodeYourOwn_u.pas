unit frmCodeYourOwn_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PythonEngine, Vcl.StdCtrls,
  PythonGUIInputOutput, SynEditHighlighter, SynEditCodeFolding,
  SynHighlighterPython, SynEdit, WrapDelphi, SynEditPythonBehaviour, Vcl.Menus,threading;

type
  TfrmPython = class(TForm)
    PyEng1: TPythonEngine;
    PyDelphiVar1: TPythonDelphiVar;
    PyInputOutput1: TPythonInputOutput;
    grpControls: TGroupBox;
    GroupBox1: TGroupBox;
    btnLoad: TButton;
    btnSort: TButton;
    pyGuiInputOutput1: TPythonGUIInputOutput;
    mmoOutput: TMemo;
    syndt1: TSynEdit;
    SynPythonSyn1: TSynPythonSyn;
    SynEditPythonBehaviour1: TSynEditPythonBehaviour;
    PyDelWrap1: TPyDelphiWrapper;
    PyModule1: TPythonModule;
    btnSave: TButton;
    dlgOpenLoadPythonScript: TOpenDialog;
    dlgSavePythonScript: TSaveDialog;
    mmPythonHelp: TMainMenu;
    Help1: TMenuItem;
    LoadExampleSort1: TMenuItem;
    procedure btnSortClick(Sender: TObject);
    procedure PyInputOutput1ReceiveData(Sender: TObject; var Data: AnsiString);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vCompareDelay: Variant;
    vSwapDelay: Variant;
    vArrayLength: Variant;
    vRange: Variant;
  end;

var
  frmPython: TfrmPython;


implementation

uses unit2; //we need the array and such
{$R *.dfm}

procedure TfrmPython.btnSortClick(Sender: TObject);
begin
//Assign values from the other from to values in python
  vCompareDelay:=frmJabsSorts.iComparedelay;
  vSwapDelay:=frmJabsSorts.iSwapdelay;
  vArrayLength:=frmJabsSorts.iarraylength;
  vRange:=frmJabsSorts.irange;
  //End Values

  PyModule1.SetVarFromVariant('compare_delay',vCompareDelay);
  PyModule1.SetVarFromVariant('swap_delay',vSwapDelay);
  PyModule1.SetVarFromVariant('array_length',vArrayLength);
  PyModule1.SetVarFromVariant('value_range',vRange);
  PyModule1.SetVarFromVariant('array',frmJabsSorts.arrIntegers);

  PyEng1.ExecString(syndt1.Text);
end;

procedure TfrmPython.FormCreate(Sender: TObject);
var
pyform:PPyObject;
pyArray:PPyObject;
begin
  //for test
  pyform := PyDelWrap1.Wrap(frmJabsSorts);
  PyModule1.SetVar('Delphi_Form',pyform);
  PyEng1.Py_DECREF(pyform);
  //For a test



end;

procedure TfrmPython.PyInputOutput1ReceiveData(Sender: TObject;
  var Data: AnsiString);
begin
  ShowMessage(data);
end;

end.
