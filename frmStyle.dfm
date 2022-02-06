object frmStyleChanger: TfrmStyleChanger
  Left = 0
  Top = 0
  Caption = 'Style Changer'
  ClientHeight = 128
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblBarWidth: TLabel
    Left = 8
    Top = 30
    Width = 69
    Height = 13
    Caption = 'Bar Width (%)'
  end
  object cbbStyles: TComboBox
    Left = 0
    Top = 0
    Width = 297
    Height = 21
    Align = alClient
    TabOrder = 0
    Text = 'cbbStyles'
    Items.Strings = (
      'Glossy'
      'Windows'
      'Windows10 Dark'
      'Smokey Quartz Kamri')
  end
  object btnSwapThemes: TButton
    Left = 0
    Top = 80
    Width = 297
    Height = 48
    Align = alBottom
    Caption = 'Swap Themes'
    TabOrder = 1
    OnClick = btnSwapThemesClick
  end
  object seBarWidth: TSpinEdit
    Left = 83
    Top = 27
    Width = 53
    Height = 22
    MaxValue = 100
    MinValue = 10
    TabOrder = 2
    Value = 100
    OnChange = seBarWidthChange
  end
  object chkShowActivebars: TCheckBox
    Left = 168
    Top = 29
    Width = 97
    Height = 17
    Caption = 'Show Active Bars'
    TabOrder = 3
  end
end
