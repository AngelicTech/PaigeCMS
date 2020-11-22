unit AT.PgAdm.Vcl.Dialogs.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
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
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringtime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxLayoutControlAdapters, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, dxLayoutContainer, cxClasses,
  dxLayoutControl, dxForms, AT.PgAdm.Attributes, AT.PgAdm.Types;

type
  [TATFormType(fteDialog)]
  TdlgBase = class(TdxForm)
    laygrpDialog_Root: TdxLayoutGroup;
    layDialog: TdxLayoutControl;
    laygrpDlgContent: TdxLayoutGroup;
    laygrpDlgButtons: TdxLayoutGroup;
    layitmOKButton: TdxLayoutItem;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    layitmCancelButton: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgBase: TdlgBase;

implementation

{$R *.dfm}

uses AT.PgAdm.Vcl.DM.Images;

end.
