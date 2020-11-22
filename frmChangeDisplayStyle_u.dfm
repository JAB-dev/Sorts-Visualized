object frmChangeDisplayStyle: TfrmChangeDisplayStyle
  Left = 0
  Top = 0
  Caption = 'Change Display Style'
  ClientHeight = 41
  ClientWidth = 393
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
  object cbbStyles: TComboBox
    Left = 0
    Top = 0
    Width = 393
    Height = 41
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'cbbStyles'
    OnChange = cbbStylesChange
  end
end
