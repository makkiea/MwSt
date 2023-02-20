object Steuerabzug: TSteuerabzug
  Left = 0
  Top = 0
  Width = 442
  Height = 251
  AutoScroll = True
  Caption = 'Steuerabzug (MwSt 19%)'
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 25
    Width = 75
    Height = 19
    Caption = 'Der Betrag'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 226
    Top = 25
    Width = 113
    Height = 19
    Caption = 'Der Nettobetrag'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 50
    Top = 178
    Width = 310
    Height = 18
    Caption = 'Das Verzeichnis ist standardm'#228#223'ig der Exe-Pfad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object txtOriginal: TEdit
    Left = 18
    Top = 49
    Width = 177
    Height = 31
    HelpType = htKeyword
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnKeyPress = txtOriginalKeyPress
  end
  object txtNeuerWert: TEdit
    Left = 226
    Top = 49
    Width = 177
    Height = 31
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object btnSteuerabzug: TButton
    Left = 18
    Top = 89
    Width = 385
    Height = 37
    Caption = 'Steuerabzug'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnSteuerabzugClick
  end
  object btnCSVDatei: TButton
    Left = 18
    Top = 135
    Width = 385
    Height = 37
    Caption = 'In CSV-Datei speichern'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCSVDateiClick
  end
end
