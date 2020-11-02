object frmPython: TfrmPython
  Left = 0
  Top = 0
  Caption = 'Code Your Sort'
  ClientHeight = 532
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmPythonHelp
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpControls: TGroupBox
    Left = 0
    Top = 0
    Width = 762
    Height = 75
    Align = alTop
    Caption = 'Controls'
    TabOrder = 0
    object btnLoad: TButton
      Left = 77
      Top = 15
      Width = 75
      Height = 58
      Align = alLeft
      Caption = 'Load'
      TabOrder = 0
    end
    object btnSort: TButton
      Left = 2
      Top = 15
      Width = 75
      Height = 58
      Align = alLeft
      Caption = 'Sort'
      TabOrder = 1
      OnClick = btnSortClick
    end
    object btnSave: TButton
      Left = 152
      Top = 15
      Width = 75
      Height = 58
      Align = alLeft
      Caption = 'Save'
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 629
    Top = 75
    Width = 133
    Height = 457
    Align = alRight
    Caption = 'grpHelp'
    TabOrder = 1
    object mmoOutput: TMemo
      Left = 2
      Top = 15
      Width = 129
      Height = 89
      Align = alTop
      Lines.Strings = (
        'Output appears here:')
      TabOrder = 0
    end
  end
  object syndt1: TSynEdit
    Left = 0
    Top = 75
    Width = 629
    Height = 457
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
      'Delphi_Form.PrepareForSort() #Run this before sorting'
      
        'Delphi_Form.FillArray() #fill the array with the selected patter' +
        'n'
      'Delphi_Form.ResetScoreBoard()#Resets the scoreboard'
      ''
      ''
      ''
      ''
      
        'Delphi_Form.UpdateScoreboard()#To be run at the end of a sort to' +
        ' update the scoreboard')
    WantTabs = True
  end
  object PyEng1: TPythonEngine
    IO = pyGuiInputOutput1
    Left = 672
    Top = 24
  end
  object PyDelphiVar1: TPythonDelphiVar
    Engine = PyEng1
    Module = '_Sorts_'
    VarName = 'varname1'
    Left = 496
    Top = 16
  end
  object PyInputOutput1: TPythonInputOutput
    OnReceiveData = PyInputOutput1ReceiveData
    UnicodeIO = False
    RawOutput = False
    Left = 632
    Top = 16
  end
  object pyGuiInputOutput1: TPythonGUIInputOutput
    UnicodeIO = True
    RawOutput = False
    Output = mmoOutput
    Left = 568
    Top = 27
  end
  object SynPythonSyn1: TSynPythonSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 248
    Top = 16
  end
  object SynEditPythonBehaviour1: TSynEditPythonBehaviour
    Editor = syndt1
    Left = 280
    Top = 16
  end
  object PyDelWrap1: TPyDelphiWrapper
    Engine = PyEng1
    Left = 429
    Top = 19
  end
  object PyModule1: TPythonModule
    Engine = PyEng1
    ModuleName = 'Sorting_Module'
    Errors = <>
    Left = 712
    Top = 24
  end
  object dlgOpenLoadPythonScript: TOpenDialog
    Filter = 'Python Stuff|.py'
    Left = 352
    Top = 16
  end
  object dlgSavePythonScript: TSaveDialog
    Left = 384
    Top = 16
  end
  object mmPythonHelp: TMainMenu
    Left = 392
    object Help1: TMenuItem
      Caption = 'Help'
      object LoadExampleSort1: TMenuItem
        Caption = 'Load Example Sort'
      end
    end
  end
end
