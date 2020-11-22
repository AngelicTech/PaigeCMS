unit AT.PgAdm.Vcl.Forms.PagesChild;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxRibbonSkins, dxSkinsCore, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxRibbonCustomizationForm, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, dxRibbon, AT.PgAdm.Interfaces,
  dxBarExtItems, dxSkinBasic, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, AT.PgAdm.Vcl.Forms.BaseChild;

type
  TfrmPagesChild = class(TfrmBaseChild, IDocumentPgNumQuery)
    barPageInfo: TdxBar;
    actPgInfo: TAction;
    cmdPgInfoStatic: TdxBarStatic;
    barZoomLevel: TdxBar;
    procedure GetHintForPgInfoAction(var HintStr: string; var CanShow: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure UpdatePgInfoAction(Sender: TObject);
  strict protected
    function GetCurrentPageNum: Integer; virtual;
    function GetPageCount: Integer; virtual;
    function GetPageInfoBar: TdxBar; override;
    function GetZoomLevelBar: TdxBar; override;
    procedure UpdateMainUIPageNumStatus; virtual;
    property CurrentPageNum: Integer read GetCurrentPageNum;
    property PageCount: Integer read GetPageCount;
  end;

var
  frmPagesChild: TfrmPagesChild;

implementation

{$R *.dfm}

procedure TfrmPagesChild.GetHintForPgInfoAction(var HintStr: string; var
    CanShow: Boolean);
begin
  inherited;

  HintStr := EmptyStr;
  CanShow := False;
end;

procedure TfrmPagesChild.FormCreate(Sender: TObject);
begin
  inherited;

  barPageInfo.Visible := False;
end;

function TfrmPagesChild.GetCurrentPageNum: Integer;
begin
  Result := 0;
end;

function TfrmPagesChild.GetPageCount: Integer;
begin
  Result := 0;
end;

function TfrmPagesChild.GetPageInfoBar: TdxBar;
begin
  Result := barPageInfo;
end;

function TfrmPagesChild.GetZoomLevelBar: TdxBar;
begin
  Result := barZoomLevel;
end;

procedure TfrmPagesChild.UpdateMainUIPageNumStatus;
var
  AIntf: IMainFormPgNumUpdate;
begin
  if (NOT Supports(MainForm, IMainFormPgNumUpdate, AIntf)) then
    Exit;

  AIntf.UpdateCurrentPgNum(CurrentPageNum);
  AIntf.UpdatePageCount(PageCount);
end;

procedure TfrmPagesChild.UpdatePgInfoAction(Sender: TObject);
var
  APgCnt: Integer;
  APgIdx: Integer;
begin
  inherited;
  // TODO -cMM: TfrmPagesChild.UpdatePgInfoAction - use rtti...

  APgIdx := CurrentPageNum;
  APgCnt := PageCount;

  (Sender AS TAction).Caption := Format('Page %d of %d',
      [APgIdx, APgCnt]);

  (Sender AS TAction).Enabled := True;
end;

end.
