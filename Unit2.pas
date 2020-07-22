unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, Vcl.StdCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.Samples.Spin,System.threading,System.Math;

type
  TfrmJabsSorts = class(TForm)
    tmrUpdate: TTimer;
    grpSettings: TGroupBox;
    cbbSorts: TComboBox;
    seDelay: TSpinEdit;
    lblSorts: TLabel;
    lblDelay: TLabel;
    lblDelayOnCompare: TLabel;
    seDelayOnCompare: TSpinEdit;
    btnSort: TButton;
    seUpdateInterval: TSpinEdit;
    lblUpdateINterval: TLabel;
    chtSort: TChart;
    seArrayLength: TSpinEdit;
    lblArrayLength: TLabel;
    seRange: TSpinEdit;
    lblRange: TLabel;
    barseriesSort: TBarSeries;
    procedure btnSortClick(Sender: TObject);
    procedure tmrUpdateTimer(Sender: TObject);
  private
    { Private declarations }
    arrIntegers:array of Integer;
    iCompareDelay:Integer;
    iSwapDelay:Integer;
    iArrayLength:Integer;
    iRange:Integer;
    iInterval:Integer;

  public
    { Public declarations }
  end;

var
  frmJabsSorts: TfrmJabsSorts;

implementation

{$R *.dfm}

procedure TfrmJabsSorts.btnSortClick(Sender: TObject);
var
X:Integer;
begin
//Decide what sort to use
  //arrIntegers:=array[1..iarraylength] of Integer;
  with cbbSorts do
  begin
    //verify
    if ItemIndex=-1 then
    begin
      ShowMessage('A sorting algorithm was not selected');
      SetFocus;
    end;

    //Depending on choice choose sort


    iArrayLength:=seArrayLength.Value;
    SetLength(arrIntegers,iArrayLength);  //dynamic array length setting, way easier than I thought
    iCompareDelay:=seDelayOnCompare.Value;
    iSwapDelay:=seDelay.Value;
    iRange:=seRange.Value;
    iInterval:=seUpdateInterval.Value;
    tmrUpdate.Interval:=iInterval;

    chtSort.BottomAxis.Maximum:=iArrayLength;
    //Filling the array randomly
    for X := 0 to iArrayLength do
    begin
      arrIntegers[X]:=RandomRange(1,iRange+1);
    end;



    {Bubble Sort (Using For(Unoptimized))     0
      Bubble Sort (Faster)                    1
      Comb Sort                               2
      Insertion Sort                          3
      Selection Sort (Unoptimized)            4
    }
    if ItemIndex=0 then
    begin
      ShowMessageUser(Items[ItemIndex]+' Has been selected');
      tmrUpdate.Enabled:=True;
      TTask.Run(
        procedure
        var
        itemp,k,J:Integer;
        begin
          for K := 0 to iArrayLength do
          begin
            for J := 0 to iArrayLength-2 do
            begin
              if arrIntegers[j+1]>arrIntegers[J] then
              begin
                itemp:=arrIntegers[j];
                arrintegers[j]:=arrIntegers[j+1];
                arrintegers[j+1]:=itemp;
                sleep(iSwapDelay);
              end;
              sleep(iCompareDelay);
            end;
          end;
        end
      );
    end;

    if ItemIndex=1 then
    begin
      ShowMessageUser(Items[ItemIndex]+' Has been selected');
      tmrUpdate.Enabled:=True;
      TTask.Run
      (
        procedure
        var
        itemp,k:Integer;
        bSorted:Boolean;
        begin
          bsorted:=False;
          while bsorted=False do
          begin
            bsorted:=True;
            for K := 0 to iArrayLength-2 do
            begin
              if arrIntegers[k+1]>arrIntegers[k] then
              begin
                itemp:=arrIntegers[k];
                arrintegers[k]:=arrIntegers[k+1];
                arrintegers[k+1]:=itemp;
                sleep(iSwapDelay);
                bsorted:=False;
              end;
              Sleep(iCompareDelay);
            end;
          end;
        end
      );
    end;

    if ItemIndex=2 then
    begin
      ShowMessageUser(Items[ItemIndex]+' Has been selected');
      tmrUpdate.Enabled:=True;
      TTask.Run
      (
        procedure
        var
        itemp,k,igap:Integer;
        bSorted:Boolean;
        begin
          bsorted:=False;
          igap:=iArrayLength;
          while bsorted=False do
          begin
            igap:=Floor(igap/1.3);
            if igap<=1 then
            begin
              igap:=1;
              bsorted:=True;
            end;


            k:=0;
            while (igap+K)<iArrayLength do
            begin
                if arrIntegers[K+igap]>arrIntegers[k] then
                begin
                  itemp:=arrIntegers[k];
                  arrintegers[k]:=arrIntegers[k+igap];
                  arrintegers[k+igap]:=itemp;
                  bsorted:=False;
                  sleep(iSwapDelay);

                end;
              sleep(iCompareDelay);
              inc(k);
            end;
          end;
        end
      );
    end;

    if ItemIndex=3 then
    begin
      ShowMessageUser(Items[ItemIndex]+' Has been selected');
      tmrUpdate.Enabled:=True;
      TTask.Run(
        procedure
        var
        itemp,k,J:Integer;
        begin
          for K := 1 to iArrayLength do
          begin
            j:=k;
            while (arrIntegers[j-1]<arrIntegers[j]) and (j>=1) do
            begin
              itemp:=arrIntegers[j-1];
              arrintegers[j-1]:=arrIntegers[j];
              arrintegers[j]:=itemp;
              sleep(iSwapDelay);
              dec(j)
            end;
          end;
        end
      );
    end;

     if ItemIndex=4 then
    begin
      ShowMessageUser(Items[ItemIndex]+' Has been selected');
      tmrUpdate.Enabled:=True;
      TTask.Run(
        procedure
        var
        itemp,k,J:Integer;
        begin
          for K := 0 to iArraylength-2 do
          begin
            for J := K+1 to iArrayLength-1 do
            begin
              if arrIntegers[j]>arrIntegers[k] then
              begin
                itemp:=arrIntegers[j];
                arrintegers[j]:=arrintegers[k];
                arrintegers[k]:=itemp;
                sleep(iSwapDelay);
              end;

              sleep(iCompareDelay);
            end;
              
          end;
        end
      );
    end;


  end;

end;

procedure TfrmJabsSorts.tmrUpdateTimer(Sender: TObject);
begin
  //Update the graph by reloading the array
  barseriesSort.Clear;
  barseriesSort.AddArray(arrIntegers);
end;

end.

