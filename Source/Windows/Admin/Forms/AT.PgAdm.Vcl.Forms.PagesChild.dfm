inherited frmPagesChild: TfrmPagesChild
  Caption = 'frmPagesChild'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ribChild: TdxRibbon
    inherited ribtabHome: TdxRibbonTab
      Index = 0
    end
  end
  inherited barmgrChild: TdxBarManager
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      24
      0)
    inherited barFile: TdxBar
      DockedDockControl = nil
      DockedDockingStyle = dsNone
      FloatClientWidth = 51
      FloatClientHeight = 54
    end
    object barPageInfo: TdxBar [4]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Page Info'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 674
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmdPgInfoStatic'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barZoomLevel: TdxBar [5]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Zoom Level'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 78
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 674
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object cmdPgInfoStatic: TdxBarStatic
      Action = actPgInfo
      Category = 0
      Height = 24
      LeftIndent = 6
      RightIndent = 6
    end
  end
  inherited alstChild: TActionList
    object actPgInfo: TAction
      Caption = 'Page of'
      OnHint = GetHintForPgInfoAction
      OnUpdate = UpdatePgInfoAction
    end
  end
end
