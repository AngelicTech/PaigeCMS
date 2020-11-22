unit AT.PgAdm.Vcl.Forms.BaseChild;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.StdActns, Vcl.ImgList,
  EventBus,
  AT.PgAdm.Interfaces, AT.PgAdm.DEB.Events,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, cxBarEditItem, cxTextEdit,
  dxSkinsCore, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinBasic,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, dxRibbonBackstageView,
  dxRibbonCustomizationForm, dxStatusBar, dxRibbonStatusBar,
  AT.PgAdm.Attributes, AT.PgAdm.UI.Types, AT.PgAdm.Types;

type
  [TATFormType(TATFormTypeEnum.fteChild)]
  TfrmBaseChild = class(TForm, IDocumentSwitch, IFormUpdateIconSets)
    alstChild: TActionList;
    barmgrChild: TdxBarManager;
    barQAT: TdxBar;
    barTAT: TdxBar;
    ribChild: TdxRibbon;
    ribtabHome: TdxRibbonTab;
    barTAS: TdxBar;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  strict private
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
  strict protected
    procedure SetBarImages(ABar: TdxBar; AImages: TCustomImageList);
    procedure ActivateChildForm; virtual;
    procedure DeactivateChildForm; virtual;
    function GetKeyStateBar: TdxBar; virtual;
    function GetMainForm: TForm; virtual;
    function GetPageInfoBar: TdxBar; virtual;
    function GetZoomLevelBar: TdxBar; virtual;
    procedure MergeBar(AMainBar, AChildBar: TdxBar); virtual;
    procedure MergeBars; virtual;
    class function OpenDocument(const AFilename: String): Boolean;
        virtual;
    procedure UnmergeBar(AMainBar, AChildBar: TdxBar); virtual;
    procedure UnmergeBars; virtual;
    procedure UpdateIconSets; virtual;
    procedure UpdateMainFormUI; virtual;
    property KeyStateBar: TdxBar read GetKeyStateBar;
    property MainForm: TForm read GetMainForm;
    property PageInfoBar: TdxBar read GetPageInfoBar;
    property ZoomLevelBar: TdxBar read GetZoomLevelBar;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function CreateForm(AOwner: TComponent): TForm;
    [Subscribe(TThreadMode.Main)]
    procedure OnUISkinChanged(AEvent: TEvtUISkinChanged); virtual;
    [Subscribe(TThreadMode.Main)]
    procedure OnUpdateIconSets(AEvent: TEvtUpdateIconSets);
  end;

var
  frmBaseChild: TfrmBaseChild;

implementation

{$R *.dfm}

uses
  System.Rtti, System.IOUtils,
  AT.Rtti, AT.PgAdm.Vcl.DM.Main, AT.PgAdm.Vcl.DM.Images;

constructor TfrmBaseChild.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ribChild.Visible := False;

  GlobalEventBus.RegisterSubscriber(Self);
end;

destructor TfrmBaseChild.Destroy;
begin
  GlobalEventBus.Unregister(Self);

  inherited Destroy;
end;

procedure TfrmBaseChild.SetBarImages(ABar: TdxBar; AImages: TCustomImageList);
begin
  if (NOT Assigned(ABar)) then
    exit;

  ABar.Images := AImages;
end;

procedure TfrmBaseChild.ActivateChildForm;
begin
  MergeBars;
end;

class function TfrmBaseChild.CreateForm(AOwner: TComponent): TForm;
begin

  if (GetFormSingleInstanceAttrValue(ClassInfo)) then
    begin

      var Cnt := Screen.FormCount;

      for var Idx := 0 to (Cnt - 1) do
        begin

          var AForm := Screen.Forms[Idx];

          if (AForm.ClassNameIs(ClassName)) then
            exit(AForm);

        end;

    end;

  Result := Create(AOwner);

end;

procedure TfrmBaseChild.DeactivateChildForm;
begin
  UnmergeBars;
end;

procedure TfrmBaseChild.FormActivate(Sender: TObject);
begin
  UpdateMainFormUI;
  UpdateIconSets;
end;

procedure TfrmBaseChild.FormClose(Sender: TObject; var Action:
    TCloseAction);
begin
  Action := caFree;
end;

{ TForm2 }

function TfrmBaseChild.GetKeyStateBar: TdxBar;
begin
  Result := NIL;
end;

function TfrmBaseChild.GetMainForm: TForm;
begin
  Result := Application.MainForm;
end;

function TfrmBaseChild.GetPageInfoBar: TdxBar;
begin
  Result := NIL;
end;

function TfrmBaseChild.GetZoomLevelBar: TdxBar;
begin
  Result := NIL;
end;

procedure TfrmBaseChild.MergeBar(AMainBar, AChildBar: TdxBar);
begin
  if (NOT Assigned(AMainBar)) then
    Exit;

  if (NOT Assigned(AChildBar)) then
    Exit;

  AMainBar.Merge(AChildBar);
end;

procedure TfrmBaseChild.MergeBars;
var
  AIntf: IMainFormBars;
begin
  inherited;

  if (NOT Supports(MainForm, IMainFormBars, AIntf)) then
    Exit;

  MergeBar(AIntf.KeyStateBar, KeyStateBar);
  MergeBar(AIntf.PageInfoBar, PageInfoBar);
  MergeBar(AIntf.ZoomLevelBar, ZoomLevelBar);
end;

procedure TfrmBaseChild.OnUISkinChanged(AEvent: TEvtUISkinChanged);
begin
  AEvent.Free;
end;

procedure TfrmBaseChild.OnUpdateIconSets(AEvent: TEvtUpdateIconSets);
begin
  UpdateIconSets;

  AEvent.Free;
end;

class function TfrmBaseChild.OpenDocument(const AFilename: String):
    Boolean;
begin
  //Do nothing...
end;

procedure TfrmBaseChild.UnmergeBar(AMainBar, AChildBar: TdxBar);
begin
  if (NOT Assigned(AMainBar)) then
    Exit;

  if (NOT Assigned(AChildBar)) then
    Exit;

  AMainBar.Unmerge(AChildBar);
end;

procedure TfrmBaseChild.UnmergeBars;
var
  AIntf: IMainFormBars;
begin
  inherited;

  if (NOT Supports(MainForm, IMainFormBars, AIntf)) then
    Exit;

  UnmergeBar(AIntf.KeyStateBar, KeyStateBar);
  UnmergeBar(AIntf.PageInfoBar, PageInfoBar);
  UnmergeBar(AIntf.ZoomLevelBar, ZoomLevelBar);
end;

procedure TfrmBaseChild.UpdateIconSets;
begin
  barmgrChild.ImageOptions.LargeImages := dmImages.MainIconSetLg;
  barmgrChild.ImageOptions.Images := dmImages.MainIconSetSm;

  case ribChild.QuickAccessToolbar.Position of
    qtpAboveRibbon: barQAT.Images := dmImages.QATIconSetAbove;
    qtpBelowRibbon: barQAT.Images := dmImages.QATIconSetBelow;
  end;

  SetBarImages(KeyStateBar, dmImages.SBIconSet);
  SetBarImages(PageInfoBar, dmImages.SBIconSet);
  SetBarImages(ZoomLevelBar, dmImages.SBIconSet);

  SetBarImages(barTAS, dmImages.TASIconSet);

  SetBarImages(barTAT, dmImages.TATIconSet);
end;

procedure TfrmBaseChild.UpdateMainFormUI;
begin
  GlobalEventBus.Post(TEvtUpdateMainFormUI.Create());
end;

procedure TfrmBaseChild.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  bActivating: Boolean;
  bDeactivating: Boolean;
begin
  bActivating := (Self.Handle = msg.ActiveWnd);
  bDeactivating := (Self.Handle = msg.DeactiveWnd);

  if (bActivating) then
    begin
      ActivateChildForm;
    end
  else if (bDeactivating) then
    begin
      DeactivateChildForm;
    end;
end;

end.
