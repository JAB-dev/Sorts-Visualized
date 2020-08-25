unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart,
  Vcl.Samples.Spin, System.threading, System.Math, dateutils, clssounds,
  Vcl.Buttons, consolecontrol;

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
    lblTimeTaken: TLabel;
    tmrUpdate: TTimer;
    tmrTimeTaken: TTimer;
    lblWarning: TLabel;
    seVolume: TSpinEdit;
    lblVolume: TLabel;
    cbbInputStyle: TComboBox;
    barseriesSort: TBarSeries;
    cbbPythonSorts: TComboBox;
    chkUsePython: TCheckBox;
    btnHelpWithPython: TBitBtn;
    procedure btnSortClick(Sender: TObject);
    procedure tmrUpdateTimer(Sender: TObject);
    procedure tmrTimeTakenTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure seVolumeChange(Sender: TObject);
    procedure btnResetSoundsClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure chkUsePythonClick(Sender: TObject);
    procedure btnHelpWithPythonClick(Sender: TObject);
  private
    { Private declarations }
    arrIntegers: array of Integer;
    arrWorkArray: array of integer;
    iCompareDelay: Integer;
    iSwapDelay: Integer;
    iArrayLength: Integer;
    iRange: Integer;
    iInterval: Integer;
    iTimeTaken: Integer;
    rElapsedSeconds: extended;
    dStart, dEnd: tdatetime;
    Sounds: TJABSounds;
    iVolume: integer;
    consoleControl: TJABConsole;
  public
    { Public declarations }
    procedure QuickSort(Lo, hi: integer);
    function Partition(lo, hi: integer): integer;
    procedure CombSort;
    procedure TopDownMergeSort(var a: array of integer; var b: array of integer; n: integer);
    procedure TopDownSplitMerge(var b: array of integer; iBegin, iEnd: integer; var a: array of integer);
    procedure TopDownMerge(var a: array of integer; iBegin, Imiddle, iEnd: integer; var b: array of integer);
    procedure CopyArray(var A: array of integer; iBegin, iEnd: integer; var b: array of integer);
    procedure VermenthruaxxSort(var a: array of integer);
    procedure CocktailShakerSort();
    procedure FillArray();
    procedure PlaySound(inote, iDuration: integer);
    procedure RainbowBar();
    procedure LoadPythonSorts();
    procedure PythonSort();
  end;

var
  frmJabsSorts: TfrmJabsSorts;

implementation

{$R *.dfm}

procedure TfrmJabsSorts.btn1Click(Sender: TObject);
begin
  RainbowBar;
end;

procedure TfrmJabsSorts.btnHelpWithPythonClick(Sender: TObject);
begin
  ShowMessage('How to use custom sorts: '+#10
  +'1. The sort must be coded in python in a .py'+#10
  +'2. The sort must be placed in the "Custom Sorts" directory'+#10
  +'3. The sort must get the input array from Sort.txt (its just a new number on each line) '+#10
  +'4. Anytime a change is made to the array (I think python uses call it a list?) The full array must be appened to Sorted.txt with a /n '+#10
  +'5. Thats it, shout out to ThatsOven for his sort to make this work!'+#10
  +'I will make a better readme at some point...'
  );
end;

procedure TfrmJabsSorts.btnResetSoundsClick(Sender: TObject);
begin
  ShowMessageUser('There is no way to reset broken audio yet,restart');
end;

procedure TfrmJabsSorts.btnSortClick(Sender: TObject);
var
  X: Integer;
begin

  //Decide what sort to use      cbbSorts.
  //arrIntegers:=array[1..iarraylength] of Integer;
    //validate
  if chkUsePython.Checked = true then
  begin
    PythonSort;
    exit;
  end;

  if cbbSorts.ItemIndex = -1 then
  begin
    ShowMessage('A sorting algorithm was not selected');
    cbbSorts.SetFocus;
    exit;
  end;

  if cbbInputStyle.ItemIndex = -1 then
  begin
    ShowMessage('Input style not selected!');
    cbbInputStyle.SetFocus;
    exit;
  end;


    //Depending on choice choose sort
  iVolume := seVolume.Value;
  iTimeTaken := 0;
  iArrayLength := seArrayLength.Value;
  SetLength(arrIntegers, iArrayLength);  //dynamic array length setting, way easier than I thought
  iCompareDelay := seDelayOnCompare.Value;
  iSwapDelay := seDelay.Value;
  iRange := seRange.Value;
  iInterval := seUpdateInterval.Value;
  tmrUpdate.Interval := iInterval;
  lblTimeTaken.Caption := '0ms-Unmeasureable with timer';

  //chtSort.BottomAxis.Maximum := iArrayLength;
    //Filling the array randomly or giving a reverse input
  FillArray;


    {Bubble Sort (Using For(Unoptimized))     0
    Bubble Sort (Faster)                      1
    Comb Sort                                 2
    Insertion Sort                            3
    Selection Sort (Unoptimized)              4
    Quick Sort (Lomuto partition scheme)      5
    Cycle (Circle) Sort                       6 SHould really make this one neater
    Top Down Merge Sort                       7
    Vermenthruaxx sort (Joke)                 8
    }
  if cbbSorts.ItemIndex = 0 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart := now;
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

              //Sounds BETTTER SYSTEM POG
              PlaySound(round(arrintegers[J] / irange * 127), iSwapDelay);
              playsound(round(arrintegers[J + 1] / irange * 127), iSwapDelay);
              //SoundS
              sleep(iSwapDelay);
            end;
            sleep(iCompareDelay);
          end;
        end;
         //TIME TAKEN
        dend := now;
        relapsedseconds := (dEnd - dStart) * MSecsPerDay;
        //TIME TAKEN
      end);
  end;

  if cbbSorts.ItemIndex = 1 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart := now;
    //captureTimeNOw
    TTask.Run(
      procedure
      var
        itemp, k, O: Integer;
        bSorted: Boolean;
      begin
        bSorted := False;
        O := 0;
        while bSorted = False do
        begin
          bSorted := True;
          for k := 0 to iArrayLength - (2 + O) do
          begin
            if arrIntegers[k + 1] > arrIntegers[k] then
            begin
              itemp := arrIntegers[k];
              arrintegers[k] := arrIntegers[k + 1];
              arrintegers[k + 1] := itemp;

              //Sounds BETTTER SYSTEM POG
              PlaySound(round(arrintegers[k] / irange * 127), iSwapDelay);
              playsound(round(arrintegers[k + 1] / irange * 127), iSwapDelay);
              //SoundS
              sleep(iSwapDelay);
              bSorted := False;
            end;
            Sleep(iCompareDelay);
          end;
          inc(O);
        end;
        //TIME TAKEN


        dend := now;
        relapsedseconds := (dEnd - dStart) * MSecsPerDay;
        //TIME TAKEN
      end);
  end;


  //COMB SORT
  if cbbSorts.ItemIndex = 2 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    tmrUpdate.Enabled := True;
   //CaptureTimeNow
    dStart := now;
    //captureTimeNOw
    TTask.Run(
      procedure
      begin
        CombSort;
      end);
  end;
  //INSERTION SORT
  if cbbSorts.ItemIndex = 3 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart := now;
    //captureTimeNOw
    TTask.Run(
      procedure
      var
        itemp, k, J: Integer;
      begin
        for k := 1 to iArrayLength - 1 do
        begin
          J := k;
          sleep(iCompareDelay);
          while (arrIntegers[J - 1] < arrIntegers[J]) and (J >= 1) do
          begin
            itemp := arrIntegers[J - 1];
            arrintegers[J - 1] := arrIntegers[J];
            arrintegers[J] := itemp;
            //Sounds BETTTER SYSTEM POG
            PlaySound(round(arrintegers[J] / irange * 127), iSwapDelay);
            playsound(round(arrintegers[J - 1] / irange * 127), iSwapDelay);
            //SoundS
            sleep(iSwapDelay);
            dec(J)
          end;
        end;
        //TIME TAKEN
        dend := now;
        relapsedseconds := (dEnd - dStart) * MSecsPerDay;
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
    dStart := now;
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

              //Sounds BETTTER SYSTEM POG
              PlaySound(round(arrintegers[k] / irange * 127), iSwapDelay);
              playsound(round(arrintegers[J] / irange * 127), iSwapDelay);
              //SoundS
              sleep(iSwapDelay);
            end;

            sleep(iCompareDelay);
          end;

        end;
         //TIME TAKEN
        dend := now;
        relapsedseconds := (dEnd - dStart) * MSecsPerDay;
        //TIME TAKEN
      end);
  end;

  //QUICKSORT
  if cbbSorts.ItemIndex = 5 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart := now;
    //captureTimeNOw
    TTask.Run(
      procedure
      begin
        quicksort(0, iArrayLength - 1);
        //TIME TAKEN
        dend := now;
        relapsedseconds := (dEnd - dStart) * MSecsPerDay;
        //TIME TAKEN
      end);

  end;
  //CYCLE SORT (CIRCLE), its only one of them but the wiki sited both
  if cbbSorts.ItemIndex = 6 then
  begin
    ;
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;

    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart := now;
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
          iItem := itemp;

          //Sounds BETTTER SYSTEM POG
          PlaySound(round(arrintegers[ipos] / irange * 127), iSwapDelay);
          playsound(round(iItem / irange * 127), iSwapDelay);
          //SoundS
          sleep(iSwapDelay);
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

            //Sounds BETTTER SYSTEM POG
            PlaySound(round(arrintegers[ipos] / irange * 127), iSwapDelay);
            playsound(round(iItem / irange * 127), iSwapDelay);
            //SoundS
            sleep(iSwapDelay);

            arrIntegers[ipos] := iItem;
            iItem := itemp;
          end;
        end;
        //TIME TAKEN
        dend := now;
        relapsedseconds := (dEnd - dStart) * MSecsPerDay;
        //TIME TAKEN

      end);

  end;
  //TOP DOWN MERGE SORT
  if cbbSorts.ItemIndex = 7 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrTimeTaken.Enabled := True;
    SetLength(arrWorkArray, iArrayLength);
    tmrUpdate.Enabled := True;
    //CaptureTimeNow
    dStart := now;
    //captureTimeNOw
    TTask.Run(
      procedure
      begin
        topdownmergesort(arrIntegers, arrWorkArray, iArrayLength);
          //TIME TAKEN
        dend := now;
        relapsedseconds := (dEnd - dStart) * MSecsPerDay;
        //TIME TAKEN
      end);

  end;
  //Joke sort
  if cbbSorts.ItemIndex = 8 then
  begin
    chtSort.Title.Caption := cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected';
    tmrUpdate.Enabled := true;
    VermenthruaxxSort(arrintegers);
  end;
  //Cocktail shaker sort
  if cbbSorts.ItemIndex = 9 then
  begin
    ShowMessage(cbbSorts.Items[cbbSorts.ItemIndex] + ' Has been selected');
    tmrUpdate.Enabled := True;
    TTask.Run(cocktailshakersort);
  end;
end;

procedure TfrmJabsSorts.chkUsePythonClick(Sender: TObject);
begin
  if chkUsePython.Checked = true then
  begin
    cbbSorts.Enabled := false;
    cbbPythonSorts.Enabled := true;
  end
  else
  begin
    cbbSorts.Enabled := true;
    cbbPythonSorts.Enabled := false;
  end;
end;

//end;

procedure TfrmJabsSorts.CocktailShakerSort;
var
  bSorted: boolean;
  k, itemp, iruns: integer;
begin
  dStart := now;
  iruns := 0;
  repeat
    bSorted := true;
    for k := 0 + iruns to iArrayLength - 2 - iruns do
    begin
      sleep(iCompareDelay);
      if arrIntegers[k + 1] > arrIntegers[k] then
      begin
        itemp := arrIntegers[k];
        arrintegers[k] := arrintegers[k + 1];
        arrIntegers[k + 1] := itemp;
        bSorted := false;

        //Sounds BETTTER SYSTEM POG
        PlaySound(round(arrintegers[k] / irange * 127), iSwapDelay);
        playsound(round(arrintegers[k + 1] / irange * 127), iSwapDelay);
        //SoundS
        sleep(iSwapDelay);

      end;
    end;

    for k := iArrayLength - 2 - iruns downto 0 + iruns do
    begin
      Sleep(iCompareDelay);
      if arrIntegers[k + 1] > arrIntegers[k] then
      begin
        bSorted := false;

        itemp := arrIntegers[k];
        arrintegers[k] := arrintegers[k + 1];
        arrIntegers[k + 1] := itemp;
         //Sounds BETTTER SYSTEM POG
        PlaySound(round(arrintegers[k] / irange * 127), iSwapDelay);
        playsound(round(arrintegers[k + 1] / irange * 127), iSwapDelay);
        //SoundS
        sleep(iSwapDelay);
      end;
    end;

    Inc(iruns);

  until (bSorted);
  dEnd := now;
  rElapsedSeconds := (dend - dStart) * MSecsPerDay;
end;

procedure TfrmJabsSorts.CombSort;
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
        //Sounds BETTTER SYSTEM POG
        PlaySound(round(arrintegers[k] / irange * 127), iSwapDelay);
        playsound(round(arrintegers[k + igap] / irange * 127), iSwapDelay);
        //SoundS
        sleep(iSwapDelay);
      end;
      sleep(iCompareDelay);
      inc(k);
    end;
  end;
         //TIME TAKEN
  dend := now;
  relapsedseconds := (dEnd - dStart) * MSecsPerDay;
        //TIME TAKEN
end;

procedure TfrmJabsSorts.CopyArray(var A: array of integer; iBegin, iEnd: integer; var b: array of integer);
var
  K: Integer;
begin
  for K := iBegin to iEnd do
  begin
    Sleep(iSwapDelay);
    b[K] := A[K];
  end;

end;

procedure TfrmJabsSorts.FillArray;
var
  X: integer;
begin
  case cbbInputStyle.ItemIndex of
    0:
      begin
        for X := 0 to iArrayLength - 1 do
        begin
          arrIntegers[X] := RandomRange(1, iRange + 1);
        end;
        exit;
      end;
    1:
      begin
        iRange := iArrayLength - 1;
        for X := 0 to iArrayLength - 1 do
        begin
          arrIntegers[X] := X;
        end;
        exit
      end;
    2:
      begin
        iRange := seRange.Value;
        for X := 0 to iArrayLength - 1 do
        begin
          arrIntegers[X] := round(iRange * sin(X * ((2 * pi) / (iarraylength - 1)))); //Delphi sin uses Radians?why
        end;
      end;
    3:
      begin
        irange := seRange.Value;
        for X := 0 to iArrayLength - 1 do
        begin
          arrIntegers[X] := round(irange * cos(X * ((2 * pi) / (iarraylength - 1))));
        end;
      end;
    4:
      begin
        irange := seRange.Value;
        for X := 0 to iArrayLength - 1 do
        begin
          arrIntegers[X] := round(-1 * irange * cos(X * ((2 * pi) / (iarraylength - 1))));
        end;
      end;
    5: //parabola
      begin
        for X := 0 to iArrayLength - 1 do
        begin
          irange := seRange.Value;
          arrIntegers[X] := sqr(X - ((iArrayLength - 1) div 2));
        end;
        irange := sqr((iArrayLength) div 2);
      end;
    6: //Parabola negative, shifted up so all values are >=0
      begin
        for X := 0 to iArrayLength - 1 do
        begin
          irange := seRange.Value;
          arrIntegers[X] := (-1 * sqr(X - ((iArrayLength - 1) div 2))) + sqr((iArrayLength) div 2);
        end;
        irange := sqr((iArrayLength) div 2);
      end;
  end;

end;

procedure TfrmJabsSorts.FormCreate(Sender: TObject);
begin
  sounds := TJABSounds.Create;
  sounds.SetInstrument(24);
  cbbSorts.ItemIndex := 0;
  //barseriesSort.Clear;
  //barseriesSort.AddArray(arrIntegers);
  chtSort.Title.Text.Clear;
  LoadPythonSorts;
end;

procedure TfrmJabsSorts.LoadPythonSorts;
var
  searchResult: TSearchRec;              //From delphi basics.uk How I learnt this awhile back
begin
  // Try to find any file with py at the end
  if DirectoryExists('Custom Sorts') = false then
  begin
    CreateDir('Custom Sorts');
  end;
  SetCurrentDir('Custom Sorts');
  if findfirst('*.py', faAnyFile, searchResult) = 0 then
  begin
    repeat
      cbbPythonSorts.Items.Add(searchResult.Name);
      //ShowMessage('File name = '+searchResult.Name);
    until FindNext(searchResult) <> 0;
    // Must free up resources used by these successful finds
    FindClose(searchResult);
  end;

  if cbbPythonSorts.Items.Count = 0 then
  begin
    ShowMessage('it seems no custom sorts where found!');
  end;
end;

function TfrmJabsSorts.Partition(lo, hi: integer): integer;
var
  iPivot, iTemp: integer;
  i, j: integer;
begin
  iPivot := arrintegers[hi];
  i := lo;
  for j := lo to hi do
  begin
    if arrintegers[j] > iPivot then
    begin
      iTemp := arrintegers[i];
      arrintegers[i] := arrintegers[j];
      arrintegers[j] := iTemp;
      inc(i);
      //Sounds BETTTER SYSTEM POG
      PlaySound(round(arrintegers[j] / irange * 127), iSwapDelay);
      playsound(round(arrintegers[i] / irange * 127), iSwapDelay);
      //SoundS
      sleep(iSwapDelay);
    end;
    sleep(iCompareDelay)
  end;
  iTemp := arrintegers[i];
  arrintegers[i] := arrintegers[hi];
  arrintegers[hi] := iTemp;
  Result := i;
end;

procedure TfrmJabsSorts.PlaySound(inote, iDuration: integer);//Play sound, not asnync since would cause stutters
begin
 
  Sounds.NoteOn(abs(inote), ivolume);
  Sleep(iDuration);
  Sounds.NoteOff(abs(inote), ivolume);

end;

procedure TfrmJabsSorts.PythonSort;
var
  sline,sline2, sSortName: string;
  k,x,ipos,ipos2,iarrayLengthComma: integer;
  tfile: textfile;
begin
  //Python go brrrr
  iVolume := seVolume.Value;
  iTimeTaken := 0;
  iArrayLength := seArrayLength.Value;
  SetLength(arrIntegers, iArrayLength);  //dynamic array length setting, way easier than I thought
  iCompareDelay := seDelayOnCompare.Value;
  iSwapDelay := seDelay.Value;
  iRange := seRange.Value;
  iInterval := seUpdateInterval.Value;
  tmrUpdate.Interval := iInterval;
  FillArray;

  if cbbPythonSorts.ItemIndex = -1 then
  begin
    ShowMessage('You did not select a custom sort!');
    exit;
  end;
  //Fill the textfile to be sorted
  AssignFile(tfile, 'Sort.txt');
  Rewrite(tfile);
  for k := 0 to iArrayLength - 1 do
  begin
    Writeln(tfile, IntToStr(arrintegers[k]));
  end;
  closefile(tfile);
  //Filled
  //Remove old sorts
  AssignFile(tfile,'Sorted.txt');
  Rewrite(tfile);
  CloseFile(tfile);
  //removed

  barseriesSort.Clear;
  barseriesSort.AddArray(arrIntegers);
  sSortName := cbbPythonSorts.Text;
  if consoleControl.GetDosOutput('python ' + sSortName, GetCurrentDir)='' then
  begin
    //If the output was blank it meant nothing went wrong
  end else
  begin
    //If its not blank something went wrong, assume they are using a different version where you have to type py instead of python
    if consoleControl.GetDosOutput('py ' + sSortName, GetCurrentDir)='' then
    begin
      //if the output was blank it meant nothing went wrong
    end else
    begin
      //something went wrong along the lines of
      ShowMessage('something went wrong along the lines of: '+consoleControl.GetDosOutput('py ' + sSortName, GetCurrentDir));
      exit;
    end;
  end;
  btnSort.Enabled:=false;

  //Actually read
  tmrUpdate.Enabled:=false;//falseLSE FOR NOW
  ttask.Run(
  procedure
  var
  k,x:integer;
  begin
    AssignFile(tfile,'Sorted.txt');
    Reset(tfile);
    while not(eof(tfile)) do
    begin
      Readln(tfile,sline);
      Delete(sline,1,1);
      k:=-1;
      delete(sline,length(sline),1);
      sline:=sline+',';
      iarrayLengthComma:=0;
      for x := 1 to Length(sline) do
      begin
        if pos(',',sline)>0 then
        begin
          Inc(iarrayLengthComma);
          inc(k);
          SetLength(arrIntegers,iarrayLengthComma);
          sline2:=copy(sline,1,pos(',',sline)-1); //sline gets everything in the comma
          //ShowMessage(sline2); Debugging
          Delete(sline,1,pos(',',sline));  //Clearing for the next read
          if pos('[]',sline2)>0 then    //This appears for some reason?,Play sounds with these?
          begin
            arrIntegers[k]:=0; //0 is blank in our case
          end
          else
          begin
            delete(sline2,pos(' ',sline2),1);//Delete trash, thanks python
            if (pos(']',sline2)>0) or( pos('[',sline2)>0) then
            begin
              delete(sline2,pos(']',sline2),1);//Delete trash, thanks python
              delete(sline2,pos('[',sline2),1);//Delete trash, thanks python
              playsound(Round((StrToInt(sline2))/irange*127),Round(iswapdelay));
            end;

            try
              arrintegers[k]:=StrToInt(sline2);
            except;
              ShowMessage('Sline 2 failed to load:'+sline2);
            end;

          end;
        end;
      end;

      ttask.Run(            //Not really a point in doing it async but oh well
      procedure
      begin
        barseriesSort.Clear;
        barseriesSort.AddArray(arrIntegers);
      end
      );
      Sleep(iswapdelay);
    end;
    //end read
    ShowMessage('Done!');
    closefile(tfile);
    btnSort.Enabled:=true;
  end
  );
end;

procedure TfrmJabsSorts.QuickSort(Lo, hi: integer);
var
  p: integer;
begin
  if Lo < hi then
  begin
    p := Partition(Lo, hi);
    QuickSort(Lo, p - 1);
    QuickSort(p + 1, hi);
  end;
end;

procedure TfrmJabsSorts.RainbowBar;
var
  X: integer;
begin

  FillArray;
  for X := 0 to iArrayLength - 1 do
  begin
    chtSort.Series[1].SeriesColor := clred + X;
    barseriesSort.ValueColor[X] := clred * X;
    sleep(1);
  end;
end;

procedure TfrmJabsSorts.seVolumeChange(Sender: TObject);
begin
  iVolume := seVolume.Value;
end;

procedure TfrmJabsSorts.tmrTimeTakenTimer(Sender: TObject);
begin
//  Inc(iTimeTaken);
  //lblTimeTaken.Caption := IntToStr(iTimeTaken) + 'ms';
end;

procedure TfrmJabsSorts.tmrUpdateTimer(Sender: TObject);
begin
  //Update the graph by reloading the array  (Hopefully there is a better way)
  barseriesSort.Clear;
  barseriesSort.AddArray(arrIntegers);
 //blTimeTaken.Caption := FloatToStr(rElapsedSeconds) + 'ms';
end;

procedure TfrmJabsSorts.TopDownMerge(var a: array of integer; iBegin, Imiddle, iEnd: integer; var b: array of integer);
var
  i, j, k: integer;
  bOr: boolean;
begin
  i := iBegin;
  j := Imiddle;

    // While there are elements in the left or right runs...
  for k := iBegin to iEnd do
  begin
    Sleep(iCompareDelay);
    if (j >= iEnd) or (a[i] >= a[j]) then
    begin
      bOr := true;
    end
    else
    begin
      bOr := false;
    end;
        // If left run head exists and is <= existing right run head.
    if (i < Imiddle) and (bOr) then
    begin
      //Sounds BETTTER SYSTEM POG
      PlaySound(round(b[k] / irange * 127), iSwapDelay);
      playsound(round(a[i] / irange * 127), iSwapDelay);
      //SoundS
      sleep(iSwapDelay);
      b[k] := a[i];
      i := i + 1;
    end
    else
    begin
      //Sounds BETTTER SYSTEM POG
      PlaySound(round(b[k] / irange * 127), iSwapDelay);
      playsound(round(a[j] / irange * 127), iSwapDelay);
      //SoundS
      sleep(iSwapDelay);
      b[k] := a[j];
      j := j + 1;
    end;
  end;
end;

procedure TfrmJabsSorts.TopDownMergeSort(var a: array of integer; var b: array of integer; n: integer);
begin
  CopyArray(a, 0, n, b);
  TopDownSplitMerge(b, 0, n, a);
end;

procedure TfrmJabsSorts.TopDownSplitMerge(var b: array of integer; iBegin, iEnd: integer; var a: array of integer);
var
  iMiddle: integer;
begin
  if (iEnd - iBegin <= 1) then
  begin
    exit;
  end;
  iMiddle := (iEnd + iBegin) div 2;              // iMiddle = mid point
  // recursively sort both runs from array A[] into B[]
  TopDownSplitMerge(a, iBegin, iMiddle, b);  // sort the left  run
  TopDownSplitMerge(a, iMiddle, iEnd, b);  // sort the right run
  // merge the resulting runs from array B[] into A[]
  TopDownMerge(b, iBegin, iMiddle, iEnd, a);
end;

procedure TfrmJabsSorts.VermenthruaxxSort(var a: array of integer);
var
  iRageInterations: integer;
  iRand1, iRand2: integer;
  bRageMode: boolean;
  rElapsedSeconds: extended;
  dBeforeRage, dAfterRage: tdatetime;
begin
  iRageInterations := round(0.5 * iarraylength);
  TTask.Run(
    procedure
    var
      itemp, k, J: Integer;
    begin
      for k := 1 to iArrayLength - 1 do
      begin
        if (k mod iRageInterations) = 0 then
        begin
          chtSort.Title.Caption := 'RAGE!!!';
          dBeforeRage := now;
          barseriesSort.ColorEachPoint := false;
          repeat
            repeat
              iRand1 := RandomRange(1, iArrayLength);
            until (iRand1 >= k);
            repeat
              iRand2 := randomrange(1, iArrayLength);
            until (iRand2 >= k);

            itemp := arrintegers[iRand1];
            arrintegers[iRand1] := arrintegers[iRand2];
            arrintegers[iRand2] := itemp;
            //Sounds BETTTER SYSTEM POG
            PlaySound(round((arrintegers[iRand1] / irange) * 127), iSwapDelay);
            playsound(round((arrintegers[iRand2] / irange) * 127), iSwapDelay);
            //SoundS
            sleep(iSwapDelay);

            dAfterRage := now;
            rElapsedSeconds := SecondsBetween(dBeforeRage, dAfterRage);
          until (rElapsedSeconds >= 5);

          chtSort.Title.caption := 'Contemplating life...';
          sleep(2000);     //Shortened to 2000
          randomize;
          if random() > 0.5 then
          begin
            chtSort.title.Caption := 'Yep its done, perfectly sorted';
            barseriesSort.ColorEachPoint := true;
            exit;
          end;
        end;
        chtSort.Title.Caption := 'Sorting...';
        barseriesSort.ColorEachPoint := true;
        J := k;
        while (arrIntegers[J - 1] < arrIntegers[J]) and (J >= 1) do
        begin
          itemp := arrIntegers[J - 1];
          arrintegers[J - 1] := arrIntegers[J];
          arrintegers[J] := itemp;
          //Sounds BETTTER SYSTEM POG
          PlaySound(round((arrintegers[J] / irange) * 127), iSwapDelay);
          playsound(round((arrintegers[J - 1] / irange) * 127), iSwapDelay);
          //SoundS
          sleep(iSwapDelay);
          dec(J)
        end;
      end;
      chtsort.title.Caption := 'Sorted';
        //TIME TAKEN
      dend := now;
      rElapsedSeconds := (dEnd - dStart) * MSecsPerDay;
        //TIME TAKEN
    end);
end;

end.

