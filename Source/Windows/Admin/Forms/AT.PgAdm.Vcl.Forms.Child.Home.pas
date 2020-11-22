unit AT.PgAdm.Vcl.Forms.Child.Home;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  AT.PgAdm.Vcl.Forms.BaseNonClosingChild, AT.PgAdm.Attributes,
  AT.PgAdm.Types,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses,
  dxSkinsCore, dxSkinBasic, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue,
  dxRibbonSkins, dxRibbonCustomizationForm, dxBar, dxRibbon,
  dxLayoutContainer, dxCustomTileControl, dxTileControl,
  dxLayoutLookAndFeels, dxLayoutControl;

type
  [TATFormSingleInstanceAttribute(True)]
  [TATFormType(fteNonClosableChild)]
  TfrmChildHome = class(TfrmBaseNonClosingChild)
    laygrpHome_Root: TdxLayoutGroup;
    layHome: TdxLayoutControl;
    laylfChild: TdxLayoutLookAndFeelList;
    laylfsChild: TdxLayoutSkinLookAndFeel;
    laygrpHeader: TdxLayoutGroup;
    layimgitmIcon: TdxLayoutImageItem;
    lblitmHeader: TdxLayoutLabeledItem;
    laylfsHeader: TdxLayoutSkinLookAndFeel;
    laysepitmHeader: TdxLayoutSeparatorItem;
    tileHome: TdxTileControl;
    layitmHomeTiles: TdxLayoutItem;
    tilegrpHomeGroup1: TdxTileControlGroup;
    tileitmHomeItem3: TdxTileControlItem;
    tileitmHomeItem1: TdxTileControlItem;
    tileitmHomeItem2: TdxTileControlItem;
    tileHomeActionBarItem1: TdxTileControlActionBarItem;
    procedure tileitmHomeItem3Click(Sender: TdxTileControlItem);
  end;

var
  frmChildHome: TfrmChildHome;

implementation

{$R *.dfm}

procedure TfrmChildHome.tileitmHomeItem3Click(Sender: TdxTileControlItem);
begin
  ShowMessage('Tile Clicked');
end;

end.
