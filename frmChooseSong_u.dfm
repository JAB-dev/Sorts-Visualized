object frmChooseSong: TfrmChooseSong
  Left = 0
  Top = 0
  Caption = 'Load Song'
  ClientHeight = 132
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cbbSongs: TComboBox
    Left = 0
    Top = 0
    Width = 271
    Height = 21
    Align = alTop
    Enabled = False
    TabOrder = 0
    Text = 'cbbSongs'
  end
  object btnLoad: TButton
    Left = 0
    Top = 71
    Width = 271
    Height = 61
    Align = alClient
    Caption = 'Load Song'
    TabOrder = 1
    OnClick = btnLoadClick
    ExplicitTop = 48
    ExplicitWidth = 298
    ExplicitHeight = 39
  end
  object chkUseSong: TCheckBox
    AlignWithMargins = True
    Left = 3
    Top = 24
    Width = 265
    Height = 44
    Align = alTop
    Caption = 'Use Song'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = chkUseSongClick
    ExplicitLeft = 0
    ExplicitTop = 21
    ExplicitWidth = 271
  end
  object dlgOpenSong: TOpenDialog
    Left = 344
    Top = 144
  end
end
