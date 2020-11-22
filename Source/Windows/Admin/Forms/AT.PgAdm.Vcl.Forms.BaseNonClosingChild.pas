unit AT.PgAdm.Vcl.Forms.BaseNonClosingChild;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  EventBus,
  AT.PgAdm.Vcl.Forms.BaseChild, AT.PgAdm.Attributes, AT.PgAdm.Types,
  AT.PgAdm.DEB.Events,
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
  dxRibbonSkins, dxRibbonCustomizationForm, dxBar, dxRibbon;

type
  [TATFormType(fteNonClosableChild)]
  TfrmBaseNonClosingChild = class(TfrmBaseChild)
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  strict private
    FAppClosing: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    [Subscribe(TThreadMode.Main)]
    procedure AppClosing(AEvent: TEvtAppClosing); virtual;
  end;

var
  frmBaseNonClosingChild: TfrmBaseNonClosingChild;

implementation

{$R *.dfm}

{ TfrmBaseChild1 }

procedure TfrmBaseNonClosingChild.AppClosing(AEvent: TEvtAppClosing);
begin

  AEvent.Free;

  FAppClosing := True;

  Close;

end;

constructor TfrmBaseNonClosingChild.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FAppClosing := False;

//  GlobalEventBus.RegisterSubscriber(Self);

end;

procedure TfrmBaseNonClosingChild.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  CanClose := FAppClosing;

end;

end.
