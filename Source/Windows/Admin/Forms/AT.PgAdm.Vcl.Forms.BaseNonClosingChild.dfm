inherited frmBaseNonClosingChild: TfrmBaseNonClosingChild
  BorderIcons = [biSystemMenu]
  Caption = 'frmBaseNonClosingChild'
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited ribChild: TdxRibbon
    inherited ribtabHome: TdxRibbonTab
      Index = 0
    end
  end
  inherited barmgrChild: TdxBarManager
    PixelsPerInch = 96
  end
end
