object frmUpdate: TfrmUpdate
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Update here'
  ClientHeight = 96
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object wbUpdate: TWebBrowser
    Left = 8
    Top = 0
    Width = 33
    Height = 33
    TabOrder = 0
    ControlData = {
      4C00000069030000690300000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126200000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object btnDownloadLatest: TButton
    Left = 0
    Top = 0
    Width = 484
    Height = 49
    Align = alTop
    Caption = 'Download Latest 64bit Version'
    TabOrder = 1
    OnClick = btnDownloadLatestClick
  end
  object btnDownload32: TButton
    Left = 0
    Top = 49
    Width = 484
    Height = 49
    Align = alTop
    Caption = 'Download Latest 32bit Version'
    TabOrder = 2
    OnClick = btnDownload32Click
  end
end
