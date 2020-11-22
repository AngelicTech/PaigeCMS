object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'P@ige Security Manager'
  ClientHeight = 357
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbMain: TdxStatusBar
    Left = 0
    Top = 337
    Width = 507
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Fixed = False
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object barmgrMain: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 124
    Top = 47
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      46
      0)
    object barmgrMainBar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 756
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmdLogin'
        end
        item
          Visible = True
          ItemName = 'cmdLogout'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmdEditSecurity'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object cmdLogin: TdxBarLargeButton
      Action = actLogin
      Category = 0
    end
    object cmdLogout: TdxBarLargeButton
      Action = actLogout
      Category = 0
    end
    object cmdEditSecurity: TdxBarLargeButton
      Action = actEditSecurity
      Category = 0
    end
  end
  object alstMain: TActionList
    Left = 32
    Top = 47
    object actLogin: TAction
      Caption = 'Login'
      OnExecute = ExecuteLoginAction
      OnUpdate = UpdateLoginAction
    end
    object actLogout: TAction
      Caption = 'Logout'
      OnExecute = ExecuteLogoutAction
      OnUpdate = UpdateLogoutAction
    end
    object actEditSecurity: TAction
      Caption = 'Edit Security'
      OnExecute = ExecuteEditSecurityAction
      OnUpdate = UpdateEditSecurityAction
    end
  end
end
