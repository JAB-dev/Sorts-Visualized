unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart,
  Vcl.Samples.Spin, System.threading, System.Math,dateutils;

type
  TfrmJabsSorts = class(TForm)
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
    chkReverseInput: TCheckBox;
    lblTimeTaken: TLabel;
    tmrUpdate: TTimer;
    tmrTimeTaken: TTimer;
    lblWarning: TLabel;
    procedure btnSortClick(Sender: TObject);
    procedure tmrUpdateTimer(Sender: TObject);
    procedure tmrTimeTakenTimer(Sender: TObject);
  private
    { Private declarations }
    arrIntegers: array of Integer;
    iCompareDelay: Integer;
    iSwapDelay: Integer;
    iArrayLength: Integer;
    iRange: Integer;
    iInterval: Integer;
    iTimeTaken: Integer;
     rElapsedSeconds:extended;
  public
    { Public declarations }
    procedure QuickSort(Lo, hi: integer);
    function Partition(lo, hi: integer): integer;
  end;

var
  frmJabsSorts: TfrmJabsSorts;

implementation

{$R *.dfm}

procedure TfrmJabsSorts.btnSortClick(Sender: TObject);
var
  dStart,dEnd:tdatetime;

  X: Integer;
begin

  //Decide what sort to use      cbbSorts.
  //arrIntegers:=array[1..iarraylength] of Integer;
    //verify
  if cbbSorts.ItemIndex = -1 then
  begin
    ShowMessage('A sorting algorithm was not selected');
    SetFocus;
  end;


    //Depending on choice choose sort

  iTimeTaken := 0;
  iArrayLength := seArrayLength.Value;
  SetLength(arrIntegers, iArrayLength);  //dynamic array length setting, way easier than I thought
  iCompareDelay := seDelayOnCompare.Value;
  iSwapDelay := seDelay.Value;
  iRange := seRange.Value;
  iInterval := seUpdateInterval.Value;
  tmrUpdate.Interval := iInterval;
  lblTimeTaken.Caption := '0ms-Unmeasureable with timer';

  chtSort.BottomAxis.Maximum := iArrayLength;
    //Filling the array randomly or giving a reverse input
  if (chkReverseInput.Checked = False) then
  begin
    for X := 0 to iArrayLength do
    begin
      arrIntegers[X] := RandomRange(1, iRange + 1);
    end;
  end
  else
  begin
    for X := 0 to iArrayLength do
    begin
      arrIntegers[X] := X;
    end;

  end;


    {Bubble Sort (Using For(Unoptimized))     0
      Bubble Sort (Faster)                    1
      Comb Sort                               2
      Insertion Sort                          3
      Selection Sort (Unoptimized)            4
      Odd-Even Sort                           5
    }
  if cbbSorts.ItemIndex = 0 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart:=now;
    //captureTimeNOw
    TTask.Run(
      procedure
      var
        itemp, k, J: Integer;
      begin
        for k := 0 to iArrayLength do
        begin
          for J := 0 to iArrayLength - 2 do
          begin
            if arrIntegers[J + 1] > arrIntegers[J] then
            begin
              itemp := arrIntegers[J];
              arrintegers[J] := arrIntegers[J + 1];
              arrintegers[J + 1] := itemp;
              sleep(iSwapDelay);
            end;
            sleep(iCompareDelay);
          end;
        end;
         //TIME TAKEN
        dend:=now;
        relapsedseconds:=(dEnd-dStart)*MSecsPerDay;
        //TIME TAKEN
      end);
  end;

  if cbbSorts.ItemIndex = 1 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart:=now;
    //captureTimeNOw
    TTask.Run(
      procedure
      var
        itemp, k,O: Integer;
        bSorted: Boolean;
      begin
        bSorted := False;
        o:=0;
        while bSorted = False do
        begin
          bSorted := True;
          for k := 0 to iArrayLength - (2+O) do
          begin
            if arrIntegers[k + 1] > arrIntegers[k] then
            begin
              itemp := arrIntegers[k];
              arrintegers[k] := arrIntegers[k + 1];
              arrintegers[k + 1] := itemp;
              sleep(iSwapDelay);
              bSorted := False;
            end;
            Sleep(iCompareDelay);
          end;
          inc(O);
        end;
        //TIME TAKEN
        dend:=now;
        relapsedseconds:=(dEnd-dStart)*MSecsPerDay;
        //TIME TAKEN
      end);
  end;

  if cbbSorts.ItemIndex = 2 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    tmrUpdate.Enabled := True;
   //CaptureTimeNow
    dStart:=now;
    //captureTimeNOw
    TTask.Run(
      procedure
      var
        itemp, k, igap: Integer;
        bSorted: Boolean;
      begin
        bSorted := False;
        igap := iArrayLength;
        while bSorted = False do
        begin
          igap := Floor(igap / 1.3);
          if igap <= 1 then
          begin
            igap := 1;
            bSorted := True;
          end;

          k := 0;
          while (igap + k) < iArrayLength do
          begin
            if arrIntegers[k + igap] > arrIntegers[k] then
            begin
              itemp := arrIntegers[k];
              arrintegers[k] := arrIntegers[k + igap];
              arrintegers[k + igap] := itemp;
              bSorted := False;
              sleep(iSwapDelay);

            end;
            sleep(iCompareDelay);
            inc(k);
          end;
        end;
         //TIME TAKEN
        dend:=now;
        relapsedseconds:=(dEnd-dStart)*MSecsPerDay;
        //TIME TAKEN
      end);
  end;

  if cbbSorts.ItemIndex = 3 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart:=now;
    //captureTimeNOw
    TTask.Run(
      procedure
      var
        itemp, k, J: Integer;
      begin
        for k := 1 to iArrayLength do
        begin
          J := k;
          while (arrIntegers[J - 1] < arrIntegers[J]) and (J >= 1) do
          begin
            itemp := arrIntegers[J - 1];
            arrintegers[J - 1] := arrIntegers[J];
            arrintegers[J] := itemp;
            sleep(iSwapDelay);
            dec(J)
          end;
        end;
        //TIME TAKEN
        dend:=now;
       relapsedseconds:=(dEnd-dStart)*MSecsPerDay;
        //TIME TAKEN
      end);
  end;
  //selection sort
  if cbbSorts.ItemIndex = 4 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    tmrUpdate.Enabled := True;
   //CaptureTimeNow
    dStart:=now;
    //captureTimeNOw
    TTask.Run(
      procedure
      var
        itemp, k, J: Integer;
      begin
        for k := 0 to iArraylength - 2 do
        begin
          for J := k + 1 to iArrayLength - 1 do
          begin
            if arrIntegers[J] > arrIntegers[k] then
            begin
              itemp := arrIntegers[J];
              arrintegers[J] := arrintegers[k];
              arrintegers[k] := itemp;
              sleep(iSwapDelay);
            end;

            sleep(iCompareDelay);
          end;

        end;
         //TIME TAKEN
        dend:=now;
       relapsedseconds:=(dEnd-dStart)*MSecsPerDay;
        //TIME TAKEN
      end);
  end;
  //QUICKSORT
  if cbbSorts.ItemIndex = 5 then
  begin

    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart:=now;
    //captureTimeNOw
    TTask.Run(
      procedure
      begin
        quicksort(0,iArrayLength-1);
        //TIME TAKEN
        dend:=now;
       relapsedseconds:=(dEnd-dStart)*MSecsPerDay;
        //TIME TAKEN
      end
    );

  end;
  //CYCLE SORT (CIRCLE) WHY SO MANY NAMES???
  if cbbSorts.ItemIndex = 6 then
  begin
    ;
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;

    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart:=now;
    //captureTimeNOw
    TTask.Run(
      procedure
      var
        I, k: Integer;
        itemp: integer;
        iItem: integer;
        ipos: integer;

      begin
        for k := 0 to iArrayLength - 1 do
        begin
          iItem := arrintegers[k];
          ipos := k;
          for I := k + 1 to iArrayLength do
          begin
            if arrIntegers[I] > iItem then
            begin
              Inc(ipos);
            end;
          end;
          if ipos = k then
          begin
            Continue;
          end;

          while iItem = arrIntegers[ipos] do
          begin
            Inc(ipos);
          end;
          itemp := arrIntegers[ipos];
          arrIntegers[ipos] := iItem;
          sleep(iSwapDelay);
          iItem := itemp;
          while ipos <> k do
          begin
            ipos := k;
            for I := k + 1 to iArrayLength do
            begin
              if arrIntegers[I] > iItem then
              begin
                Inc(ipos);
              end;
            end;
            while iItem = arrIntegers[ipos] do
            begin
              Inc(ipos);
            end;
            itemp := arrIntegers[ipos];
            sleep(iSwapDelay);
            arrIntegers[ipos] := iItem;
            iItem := itemp;
          end;
        end;
        //TIME TAKEN
        dend:=now;
        relapsedseconds:=(dEnd-dStart)*MSecsPerDay;
        //TIME TAKEN

      end);

  end;
end;

//end;

function TfrmJabsSorts.Partition(lo, hi: integer): integer;
var
  iPivot,iTemp: integer;
  i, j: integer;
begin
  iPivot := arrintegers[hi];
  i := lo;
  for j := Lo to Hi do
  begin
    if arrintegers[J]>ipivot then
    begin
      itemp:=arrintegers[i];
      arrintegers[i]:=arrintegers[j];
      arrintegers[j]:=itemp;
      inc(I);
      sleep(iSwapDelay);
    end;
    sleep(iCompareDelay)
  end;
  itemp:=arrintegers[i];
  arrintegers[i]:=arrintegers[hi];
  arrintegers[hi]:=itemp;
  Result:=i;
  end;

procedure TfrmJabsSorts.QuickSort(Lo, hi: integer);
var
  p: integer;
begin
  if lo < hi then
  begin
    p := Partition(lo, hi);
    QuickSort(lo, p - 1);
    QuickSort(p + 1, hi);
  end;
end;

procedure TfrmJabsSorts.tmrTimeTakenTimer(Sender: TObject);
begin
  Inc(iTimeTaken);

  lblTimeTaken.Caption := IntToStr(iTimeTaken) + 'ms';
end;

procedure TfrmJabsSorts.tmrUpdateTimer(Sender: TObject);
begin
  //Update the graph by reloading the array
  barseriesSort.Clear;
  barseriesSort.AddArray(arrIntegers);
  lblTimeTaken.Caption:=FloatToStr(rElapsedSeconds)+'ms';
end;

end.

