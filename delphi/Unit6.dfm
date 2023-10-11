object Vizualization: TVizualization
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Vizualization'
  ClientHeight = 620
  ClientWidth = 1250
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1250
    Height = 620
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1083#1085#1086#1089#1090#1100#1102' '#1072#1089#1089#1086#1094#1080#1072#1090#1080#1074#1085#1099#1081' '#1082#1101#1096
    end
    object TabSheet2: TTabSheet
      Caption = #1050#1101#1096' '#1087#1088#1103#1084#1086#1075#1086' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = #1044#1074#1091#1093#1082#1072#1085#1072#1083#1100#1085#1086' '#1085#1072#1073#1086#1088#1085#1086'-'#1072#1089#1089#1086#1094#1080#1072#1090#1080#1074#1085#1099#1081' '#1082#1101#1096
      ImageIndex = 2
    end
  end
  object MainMenu1: TMainMenu
    Left = 1160
    object N3: TMenuItem
      Caption = #1043#1083#1072#1074#1085#1086#1077' '#1052#1077#1085#1102
      OnClick = N3Click
    end
    object N2: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N1Click
    end
  end
end
