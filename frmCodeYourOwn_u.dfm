object frmPython: TfrmPython
  Left = 0
  Top = 0
  Caption = 'Code Your Sort'
  ClientHeight = 532
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmPythonHelp
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpControls: TGroupBox
    Left = 0
    Top = 0
    Width = 808
    Height = 41
    Align = alTop
    Caption = 'Controls'
    TabOrder = 0
    object btnLoad: TButton
      Left = 77
      Top = 15
      Width = 75
      Height = 24
      Align = alLeft
      Caption = 'Open'
      TabOrder = 0
      OnClick = btnLoadClick
    end
    object btnSort: TButton
      Left = 2
      Top = 15
      Width = 75
      Height = 24
      Align = alLeft
      Caption = 'Sort'
      TabOrder = 1
      OnClick = btnSortClick
    end
    object btnSave: TButton
      Left = 152
      Top = 15
      Width = 75
      Height = 24
      Align = alLeft
      Caption = 'Save'
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object chkDebugMode: TCheckBox
      Left = 240
      Top = 18
      Width = 273
      Height = 17
      Caption = 'Debug Mode (wont vis, enables output)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = chkDebugModeClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 640
    Top = 41
    Width = 168
    Height = 491
    Align = alRight
    Caption = 'Debug Options'
    TabOrder = 1
    object mmoOutput: TMemo
      Left = 2
      Top = 15
      Width = 164
      Height = 162
      Align = alTop
      Lines.Strings = (
        'Output appears here:')
      TabOrder = 0
      ExplicitWidth = 129
    end
  end
  object syndt1: TSynEdit
    Left = 0
    Top = 41
    Width = 640
    Height = 491
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    TabOrder = 2
    UseCodeFolding = False
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Consolas'
    Gutter.Font.Style = []
    Highlighter = SynPythonSyn1
    Lines.Strings = (
      'from Sorting_Module import * #Grab stuff we need'
      ''
      '# ('#39'array'#39') Refers to the array that needs to be sorted'
      
        '        #The 2 following procedures are for tracking in the scor' +
        'eboard'
      
        '#Delphi_Form.sHappened (iSwap1,iSwap2) Use this when 2 values ar' +
        'e swapped'
      
        '#Delphi_Form.cHappened (iCompare1,iComapare2) use this when 2 va' +
        'lues are compared'
      '  '
      'def bubbleSort(arr): '
      '    n = len(arr)'
      '    for i in range(n): '
      '  '
      '        for j in range(0, n-i-1): '
      ''
      '            Delphi_Form.cHappened(arr[j],arr[j+1])'
      '            if arr[j] > arr[j+1]:'
      '                Delphi_Form.sHappened(arr[j],arr[j+1])'
      '                arr[j], arr[j+1] = arr[j+1], arr[j] '
      ''
      ''
      'bubbleSort(array)'
      '')
    WantTabs = True
    ExplicitWidth = 641
  end
  object PyEng1: TPythonEngine
    FatalAbort = False
    FatalMsgDlg = False
    IO = pyGuiInputOutput1
    Left = 752
    Top = 240
  end
  object PyInputOutput1: TPythonInputOutput
    OnReceiveData = PyInputOutput1ReceiveData
    UnicodeIO = False
    RawOutput = False
    Left = 688
    Top = 376
  end
  object pyGuiInputOutput1: TPythonGUIInputOutput
    UnicodeIO = True
    RawOutput = False
    Output = mmoOutput
    Left = 704
    Top = 291
  end
  object SynPythonSyn1: TSynPythonSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 592
    Top = 16
  end
  object SynEditPythonBehaviour1: TSynEditPythonBehaviour
    Editor = syndt1
    Left = 624
    Top = 16
  end
  object PyModule1: TPythonModule
    Engine = PyEng1
    ModuleName = 'Sorting_Module'
    Errors = <>
    Left = 752
    Top = 336
  end
  object dlgOpenLoadPythonScript: TOpenDialog
    Title = 'Open a saved script'
    Left = 664
    Top = 8
  end
  object dlgSavePythonScript: TSaveDialog
    DefaultExt = '.txt'
    Title = 'Save Script'
    Left = 704
    Top = 8
  end
  object mmPythonHelp: TMainMenu
    Left = 552
    Top = 16
    object Help1: TMenuItem
      Caption = 'Help'
      object LoadExampleSort1: TMenuItem
        Caption = 'Load Example Sort'
        OnClick = LoadExampleSort1Click
      end
    end
  end
  object PyDelWrap1: TPyDelphiWrapper
    Engine = PyEng1
    Module = PyModule1
    Left = 757
    Top = 427
  end
end
