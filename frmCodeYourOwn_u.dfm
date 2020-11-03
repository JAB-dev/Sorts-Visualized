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
    object chkDebugMode: TCheckBox
      Left = 240
      Top = 15
      Width = 185
      Height = 17
      Caption = 'Debug Mode (Wont sort correctly)'
      TabOrder = 3
      OnClick = chkDebugModeClick
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
      Height = 162
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
      'from time import *'
      'Delphi_Form.ResetScoreBoard()#Resets the scoreboard'
      '# Python program for implementation of Bubble Sort '
      ''
      
        '#('#39'compare_delay'#39')Refers to the time that should be slept when a' +
        ' comparison occurs'
      
        '#('#39'swap_delay'#39')Refers to the time that should be slept when a sw' +
        'ap occurs'
      '#('#39'array_length'#39') Refers to the lenght of the array(list)'
      
        '#('#39'value_range'#39') Refers to the maximum value posisble in an inde' +
        'x'
      '# ('#39'array'#39') Refers to the array that needs to be sorted'
      '  '
      'def bubbleSort(arr): '
      '    n = len(arr) '
      '  '
      '    # Traverse through all array elements '
      '    for i in range(n-1): '
      
        '    # range(n) also work but outer loop will repeat one time mor' +
        'e than needed. '
      '  '
      '        # Last i elements are already in place '
      '        for j in range(0, n-i-1): '
      '  '
      '            # traverse the array from 0 to n-i-1 '
      '            # Swap if the element found is greater '
      '            # than the next element '
      '            if arr[j] > arr[j+1] :'
      '                arr[j], arr[j+1] = arr[j+1], arr[j] '
      ''
      ''
      'bubbleSort(array)'
      
        'Delphi_Form.UpdateScoreboard()#To be run at the end of a sort to' +
        ' update the scoreboard')
    WantTabs = True
  end
  object PyEng1: TPythonEngine
    IO = pyGuiInputOutput1
    Left = 752
    Top = 88
  end
  object PyDelphiVar1: TPythonDelphiVar
    Engine = PyEng1
    Module = '_Sorts_'
    VarName = 'varname1'
    Left = 744
    Top = 184
  end
  object PyInputOutput1: TPythonInputOutput
    OnReceiveData = PyInputOutput1ReceiveData
    UnicodeIO = False
    RawOutput = False
    Left = 744
    Top = 40
  end
  object pyGuiInputOutput1: TPythonGUIInputOutput
    UnicodeIO = True
    RawOutput = False
    Output = mmoOutput
    Left = 752
    Top = 65531
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
  object PyDelWrap1: TPyDelphiWrapper
    Engine = PyEng1
    Module = PyModule1
    Left = 741
    Top = 235
  end
  object PyModule1: TPythonModule
    Engine = PyEng1
    ModuleName = 'Sorting_Module'
    Errors = <>
    Left = 752
    Top = 136
  end
  object dlgOpenLoadPythonScript: TOpenDialog
    Filter = 'Python Stuff|.py'
    Left = 696
    Top = 16
  end
  object dlgSavePythonScript: TSaveDialog
    Left = 728
    Top = 16
  end
  object mmPythonHelp: TMainMenu
    Left = 552
    Top = 16
    object Help1: TMenuItem
      Caption = 'Help'
      object LoadExampleSort1: TMenuItem
        Caption = 'Load Example Sort'
      end
    end
  end
end
