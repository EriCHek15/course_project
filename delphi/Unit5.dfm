object Teory: TTeory
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = #1050#1101#1096'-'#1087#1072#1084#1103#1090#1100
  ClientHeight = 620
  ClientWidth = 1262
  Color = clBtnFace
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
    Width = 1262
    Height = 620
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099' '#1087#1072#1084#1103#1090#1080' '#1074' '#1055#1050
      object WebBrowser1: TWebBrowser
        Left = 0
        Top = 0
        Width = 1242
        Height = 552
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1236
        ExplicitHeight = 543
        ControlData = {
          4C000000B1660000A42D00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1072#1073#1086#1090#1072' '#1082#1101#1096#1072
      ImageIndex = 1
      object WebBrowser2: TWebBrowser
        Left = 0
        Top = 0
        Width = 1242
        Height = 552
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 600
        ExplicitTop = 264
        ExplicitWidth = 300
        ExplicitHeight = 150
        ControlData = {
          4C000000B1660000A42D00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1055#1088#1080#1084#1077#1088#1099' '#1079#1072#1076#1072#1085#1080#1081
      ImageIndex = 2
      object WebBrowser3: TWebBrowser
        Left = 0
        Top = 0
        Width = 1254
        Height = 590
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C000000AF670000C83000000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 1160
    object N5: TMenuItem
      Caption = #1043#1083#1072#1074#1085#1086#1077' '#1052#1077#1085#1102
      OnClick = N5Click
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
