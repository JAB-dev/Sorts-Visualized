object frmChangePitch: TfrmChangePitch
  Left = 0
  Top = 0
  Caption = 'Pitch Adjustment'
  ClientHeight = 44
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object trckbrPitch: TTrackBar
    Left = 0
    Top = 0
    Width = 236
    Height = 44
    Align = alClient
    Max = 0
    Min = -50
    TabOrder = 0
    TickMarks = tmBoth
    OnChange = trckbrPitchChange
  end
end
