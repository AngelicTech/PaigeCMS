inherited frmBaseClosableChild: TfrmBaseClosableChild
  Caption = 'frmBaseClosableChild'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ribChild: TdxRibbon
    inherited ribtabHome: TdxRibbonTab
      Groups = <
        item
          ToolbarName = 'barFile'
        end>
      Index = 0
    end
  end
  inherited barmgrChild: TdxBarManager
    PixelsPerInch = 96
    object barFile: TdxBar
      Caption = 'File'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 668
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'cmdFileClose'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object cmdFileClose: TdxBarLargeButton
      Action = actFileClose
      Category = 0
    end
  end
  inherited alstChild: TActionList
    object actFileClose: TAction
      Caption = 'Close'
      ImageIndex = 5
      ImageName = 'FileClose'
      OnExecute = ExecuteFileCloseAction
    end
  end
end
