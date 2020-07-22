object frmJabsSorts: TfrmJabsSorts
  Left = 0
  Top = 0
  Caption = 'frmJabsSorts'
  ClientHeight = 719
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTimeTaken: TLabel
    Left = 776
    Top = 90
    Width = 154
    Height = 19
    Caption = 'CurrentSortTimeInMS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object grpSettings: TGroupBox
    Left = 24
    Top = 14
    Width = 689
    Height = 201
    Margins.Left = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'grpSettings'
    TabOrder = 0
    object lblSorts: TLabel
      Left = 16
      Top = 125
      Width = 62
      Height = 13
      Caption = 'Sorting Algo:'
    end
    object lblDelay: TLabel
      Left = 179
      Top = 71
      Width = 141
      Height = 19
      Caption = 'Delay on swap (ms)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDelayOnCompare: TLabel
      Left = 413
      Top = 21
      Width = 166
      Height = 19
      Caption = 'Delay on comapre (ms)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblUpdateINterval: TLabel
      Left = 16
      Top = 21
      Width = 147
      Height = 19
      Caption = 'Update Interval (ms)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblArrayLength: TLabel
      Left = 16
      Top = 71
      Width = 92
      Height = 19
      Caption = 'Array Length'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRange: TLabel
      Left = 179
      Top = 21
      Width = 228
      Height = 19
      Caption = 'Number Range Max (From zero)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbbSorts: TComboBox
      Left = 16
      Top = 144
      Width = 520
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Select Sorting Algo'
      Items.Strings = (
        'Bubble Sort (Using For(Unoptimized))'
        'Bubble Sort (Faster)'
        'Comb Sort'
        'Insertion Sort'
        'Selection Sort (Unoptimized)'
        'Odd Even Sort (Doesnt work 100%)'
        'Cycle (Circle) Sort')
    end
    object seDelay: TSpinEdit
      Left = 179
      Top = 90
      Width = 121
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 1
      Value = 0
    end
    object seDelayOnCompare: TSpinEdit
      Left = 413
      Top = 40
      Width = 121
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 2
      Value = 0
    end
    object btnSort: TButton
      Left = 544
      Top = 135
      Width = 121
      Height = 52
      Margins.Left = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Sort'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -35
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnSortClick
    end
    object seUpdateInterval: TSpinEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 29
      Hint = 
        'How quickly the timer tries to update the screen (if time mode i' +
        's on 1ms is forced)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 1000
      MinValue = 1
      ParentFont = False
      TabOrder = 4
      Value = 1
    end
    object seArrayLength: TSpinEdit
      Left = 16
      Top = 90
      Width = 121
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 100000
      MinValue = 10
      ParentFont = False
      TabOrder = 5
      Value = 100
    end
    object seRange: TSpinEdit
      Left = 179
      Top = 40
      Width = 121
      Height = 29
      Hint = 
        'The number to which the integers in the  array can rise,useless ' +
        'if reverse input was selected'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 100000
      MinValue = 10
      ParentFont = False
      TabOrder = 6
      Value = 10
    end
    object chkReverseInput: TCheckBox
      Left = 376
      Top = 92
      Width = 203
      Height = 24
      Caption = 'Reverse Input (ascending)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object chtSort: TChart
    Left = 22
    Top = 225
    Width = 977
    Height = 470
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Gradient.EndColor = 753908
    Gradient.MidColor = 16059031
    Gradient.StartColor = 14540754
    Gradient.SubGradient.Transparency = 100
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    AxisVisible = False
    BottomAxis.Increment = 1.000000000000000000
    LeftAxis.Axis.JoinStyle = jsBevel
    LeftAxis.Visible = False
    View3D = False
    View3DOptions.HorizOffset = 5
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 16
    Zoom.Allow = False
    Zoom.Brush.Gradient.EndColor = clGray
    Zoom.Brush.Gradient.MidColor = clWhite
    Zoom.Brush.Gradient.StartColor = clSilver
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 8
    object barseriesSort: TBarSeries
      Legend.Visible = False
      ColorEachPoint = True
      Marks.Visible = False
      ShowInLegend = False
      XValues.Name = 'X'
      XValues.Order = loNone
      YValues.Name = 'Bar'
      YValues.Order = loAscending
      Data = {
        000600000000000000004C884000000000005089400000000000188A40000000
        0000A48A400000000000F48A400000000000A88B40}
      Detail = {0000000000}
    end
  end
  object tmrUpdate: TTimer
    Enabled = False
    OnTimer = tmrUpdateTimer
    Left = 848
    Top = 32
  end
  object tmrTimeTaken: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmrTimeTakenTimer
    Left = 784
    Top = 32
  end
end
