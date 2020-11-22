unit AT.PgAdm.Vcl.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.Menus, Vcl.StdCtrls,
  EventBus,
  AT.PgAdm.Interfaces, AT.PgAdm.DEB.Events, AT.Vcl.Actions.Data,
  AT.Vcl.Dialogs.SplashDX, AT.Vcl.DX.NativeFileSelector,
  AT.PgAdm.UI.Types,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, cxBarEditItem, cxTextEdit, cxContainer, cxEdit, cxLabel,
  cxPC, cxSplitter, cxButtons, cxDropDownEdit, cxFontNameComboBox,
  cxCheckBox,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsForm,
  dxSkinBasic, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White,
  dxSkinChooserGallery,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, dxRibbonBackstageView,
  dxRibbonCustomizationForm, dxStatusBar, dxRibbonStatusBar,
  dxGallery, dxGalleryControl, dxRibbonBackstageViewGalleryControl,
  dxBarBuiltInMenu, dxTabbedMDI, dxRibbonGallery, dxOfficeSearchBox,
  dxLayoutcxEditAdapters, dxLayoutContainer, dxLayoutControl,
  dxLayoutControlAdapters,
  Spring, Spring.Collections, PJWdwState, AT.PgAdm.Attributes,
  AT.PgAdm.Types;

type
  [TATFormType(fteMainForm)]
  TfrmMain = class(TdxRibbonForm,
      IMainFormBarMgr, IMainFormBars)
    actInfoBarVisible: TATMultiDataAction;
    actPgInfo: TAction;
    actQATAbove: TAction;
    actQATBelow: TAction;
    actQATVisible: TATMultiDataAction;
    actSBVisible: TATMultiDataAction;
    actSearchBarVisible: TATMultiDataAction;
    actSkinPalette: TAction;
    actTouchMode: TAction;
    alstMain: TActionList;
    barApp: TdxBar;
    barFile: TdxBar;
    barHelpContents: TdxBar;
    barInet: TdxBar;
    barInfo: TdxBar;
    barKeyState: TdxBar;
    barmgrMain: TdxBarManager;
    barPageInfo: TdxBar;
    barQAT: TdxBar;
    barTAS: TdxBar;
    barTAT: TdxBar;
    barUIQATOptions: TdxBar;
    barUITheme: TdxBar;
    barUITouch: TdxBar;
    barUIVisibility: TdxBar;
    barWindow: TdxBar;
    barZoomLevel: TdxBar;
    bsvMain: TdxRibbonBackstageView;
    bsvtabAbout: TdxRibbonBackstageViewTabSheet;
    bsvtabAppExit: TdxRibbonBackstageViewTabSheet;
    bsvtabAppSettings: TdxRibbonBackstageViewTabSheet;
    cmdAppAbout: TdxBarLargeButton;
    cmdAppExit: TdxBarLargeButton;
    cmdAppSettings: TdxBarLargeButton;
    cmdATWebsite: TdxBarLargeButton;
    cmdCapsLock: TdxBarButton;
    cmdCommandSearch: TcxBarEditItem;
    cmdFileOpen: TdxBarLargeButton;
    cmdHelpContents: TdxBarLargeButton;
    cmdInfoBarVisible: TdxBarLargeButton;
    cmdNumLock: TdxBarButton;
    cmdPeerForum: TdxBarLargeButton;
    cmdQATAbove: TdxBarLargeButton;
    cmdQATBelow: TdxBarLargeButton;
    cmdQATVisible: TdxBarLargeButton;
    cmdSBVisible: TdxBarLargeButton;
    cmdScrollLock: TdxBarButton;
    cmdSearchBarVisible: TdxBarLargeButton;
    cmdSkinPalette: TdxBarListItem;
    cmdTechSupport: TdxBarLargeButton;
    cmdTouchMode: TdxBarLargeButton;
    cmdWindowList: TdxBarSubItem;
    lblBSVSettingsHeader: TcxLabel;
    mdimgrMain: TdxTabbedMDIManager;
    ribMain: TdxRibbon;
    ribtabHelp: TdxRibbonTab;
    ribtabHome: TdxRibbonTab;
    ribtabUI: TdxRibbonTab;
    ribtabView: TdxRibbonTab;
    sbMain: TdxRibbonStatusBar;
    sknctlMain: TdxSkinController;
    skngalUISkin: TdxSkinChooserGalleryItem;
    wdwMain: TPJUserWdwState;
    cmd1: TdxBarLargeButton;
    procedure AfterMergeHandler(Sender, ChildBarManager: TdxBarManager; AddItems:
        Boolean);
    procedure BSVPopup(Sender: TObject);
    procedure BSVTabChanged(Sender: TObject);
    procedure BSVTabChanging(Sender: TObject; ANewTab:
        TdxRibbonBackstageViewTabSheet; var AAllowChange: Boolean);
    procedure cmdWindowListPopup(Sender: TObject);
    procedure ExecuteInfoBarVisibleAction(Sender: TObject);
    procedure ExecuteQATAboveAction(Sender: TObject);
    procedure ExecuteQATBelowAction(Sender: TObject);
    procedure ExecuteQATVisibleAction(Sender: TObject);
    procedure ExecuteSBVisibleAction(Sender: TObject);
    procedure ExecuteSearchBarVisibleAction(Sender: TObject);
    procedure ExecuteSkinPaletteAction(Sender: TObject);
    procedure ExecuteTouchModeAction(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MDIMgrGetTabHint(Sender: TdxTabbedMDIManager; APage:
        TdxTabbedMDIPage; var AHint: string; var ACanShow: Boolean);
    procedure SkinChangedHandler(Sender: TObject; const ASkinName: string);
    procedure UpdateInfoBarVisibleAction(Sender: TObject);
    procedure UpdateQATAboveAction(Sender: TObject);
    procedure UpdateQATBelowAction(Sender: TObject);
    procedure UpdateQATVisibleAction(Sender: TObject);
    procedure UpdateSBVisibleAction(Sender: TObject);
    procedure UpdateSearchBarVisibleAction(Sender: TObject);
    procedure UpdateSkinPaletteAction(Sender: TObject);
    procedure UpdateTouchModeAction(Sender: TObject);
    procedure WindowStateReadDataHandler(Sender: TObject; var Data: TPJWdwStateData);
    procedure WindowStateSaveDataHandler(Sender: TObject; const Data:
        TPJWdwStateData);
    procedure cmd1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  strict private
    FAboutDialog: TdlgSplashDX;
    FInitializing: Boolean;
    FLastBSVTab: TdxRibbonBackstageViewTabSheet;
    FWinListMap: Spring.Collections.IDictionary<TdxBarButton, TdxTabbedMDIPage>;
    procedure _AfterBarUIVisibilityMerge;
    procedure _AfterBarViewWindowMerge;
    procedure _ExecuteBSVAction(Action: TCustomAction);
    procedure _LoadUIThemeData;
  strict protected
    function GetBarManager: TdxBarManager;
    function GetInfoBarVisible: Boolean;
    function GetKeyStateBar: TdxBar;
    function GetPageInfoBar: TdxBar;
    function GetQATPosition: TATQATPosition;
    function GetQATVisible: Boolean;
    function GetSearchBarVisible: Boolean;
    function GetStatusBarVisible: Boolean;
    function GetStatusText: string;
    function GetZoomLevelBar: TdxBar;
    procedure InitBSVAboutTab;
    procedure InitializeBackStageView;
    procedure PostUISkinChangedEvent;
    procedure PostUITouchModeChangedEvent;
    procedure SetInfoBarVisible(const Value: Boolean);
    procedure SetQATPosition(const Value: TATQATPosition);
    procedure SetQATVisible(const Value: Boolean);
    procedure SetSearchBarVisible(const Value: Boolean);
    procedure SetStatusBarVisible(const Value: Boolean);
    procedure SetStatusText(const Value: string);
    procedure SetUIPalette(const APalette: string);
    procedure SetUISkin(const ASkinName: string);
    procedure SetUITouchMode(ATouchMode: Boolean);
    procedure UpdateUI;
    procedure WindowListDocumentClickHandler(Sender: TObject);
    property BarManager: TdxBarManager read GetBarManager;
    property KeyStateBar: TdxBar read GetKeyStateBar;
    property PageInfoBar: TdxBar read GetPageInfoBar;
    property ZoomLevelBar: TdxBar read GetZoomLevelBar;
  public
    function CloseQuery: Boolean; override;
    constructor Create(AOwner: TComponent); override;
    [Subscribe(TThreadMode.Main)]
    procedure OnSetStatusText(AEvent: TEvtSetStatusText);
    [Subscribe(TThreadMode.Main)]
    procedure OnSkinMapRibbonSkin(AEvent: TEvtSkinMapRibbonSkin);
    [Subscribe(TThreadMode.Main)]
    procedure OnUpdateIconSets(AEvent: TEvtUpdateIconSets);
    [Subscribe(TThreadMode.Main)]
    procedure OnUpdateMainFormUI(AEvent: TEvtUpdateMainFormUI);
  published
    property InfoBarVisible: Boolean read GetInfoBarVisible write SetInfoBarVisible;
    property QATPosition: TATQATPosition read GetQATPosition write SetQATPosition;
    property QATVisible: Boolean read GetQATVisible write SetQATVisible;
    property SearchBarVisible: Boolean read GetSearchBarVisible write
        SetSearchBarVisible;
    property StatusBarVisible: Boolean read GetStatusBarVisible write
        SetStatusBarVisible;
    property StatusText: string read GetStatusText write SetStatusText;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  System.Rtti, System.Generics.Collections,
  AT.PgAdm.Vcl.DM.Main, AT.Rtti, AT.PgAdm.Props.Consts, AT.PgAdm.Vcl.DM.Images,
  AT.PgAdm.ResourceStrings, AT.PgAdm.Consts, AT.PgAdm.Config.Consts,
  AT.PgAdm.Config, AT.Automate, AT.PgAdm.Vcl.Forms.BaseNonClosingChild, AT.PgAdm.Vcl.Forms.BaseClosableChild;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  TdlgSplashDX.ChangeStartMessage( rstrInitMainWindow, 100 );

  FInitializing := True;

  StatusText := EmptyStr;

  var iScrnHgt := Screen.Height;
  var iScrnWid := Screen.Width;

  var iWidth := 800;
  var iHeight := 600;

  var iLeft := ( (iScrnWid - iWidth) DIV 2);
  var iTop := ( (iScrnHgt - iHeight) DIV 2);

  SetBounds(iLeft, iTop, iWidth, iHeight);

  dxRibbonBackstageViewMinMenuWidth := 180;

  GlobalEventBus.RegisterSubscriber(Self);
end;

procedure TfrmMain.AfterMergeHandler(Sender, ChildBarManager: TdxBarManager;
    AddItems: Boolean);
begin
  if (NOT AddItems) then
    exit;

  _AfterBarUIVisibilityMerge;
  _AfterBarViewWindowMerge;

end;

procedure TfrmMain.BSVPopup(Sender: TObject);
begin
  bsvMain.ActiveTab := FLastBSVTab;
end;

procedure TfrmMain.BSVTabChanged(Sender: TObject);
begin
//  if (bsvMain.ActiveTab = bsvtabOpen) then
//    _ExecuteBSVAction(dmMain.actFileOpen);
end;

procedure TfrmMain.BSVTabChanging(Sender: TObject; ANewTab:
    TdxRibbonBackstageViewTabSheet; var AAllowChange: Boolean);
begin
  FLastBSVTab := bsvMain.ActiveTab;
end;

function TfrmMain.CloseQuery: Boolean;
begin

  if FormStyle = fsMDIForm then
    begin

      for var I := MDIChildCount - 1 downto 0 do
        begin

          var AChild := MDIChildren[I];

          var AChildFT := GetFormTypeAttrValue(AChild);

          if (AChildFT = fteNonClosableChild) then
            Continue;

          if (NOT AChild.CloseQuery) then
            exit;

        end;

    end;

  Result := True;

  if Assigned(OnCloseQuery) then
      OnCloseQuery(Self, Result);

end;

procedure TfrmMain.cmd1Click(Sender: TObject);
begin

  var AFrm2 := TfrmBaseClosableChild.CreateForm(Self);

  var AFrm1 := TfrmBaseNonClosingChild.CreateForm(Self);

  AFrm1.BringToFront;


  exit;

  var AFormType := GetFormTypeAttrValue(Self);

  var AMsg := 'Error';

  case AFormType of
    fteUnspecified: AMsg := 'fteUnspecified';
    fteChild: AMsg := 'fteChild' ;
    fteClosableChild: AMsg := 'fteClosableChild' ;
    fteDialog: AMsg := 'fteDialog' ;
    fteMainForm: AMsg := 'fteMainForm' ;
    fteNonClosableChild: AMsg := 'fteNonClosableChild' ;
  end;

  ShowMessage(Format('Form Type: %s', [AMsg]));

end;

procedure TfrmMain.cmdWindowListPopup(Sender: TObject);
begin
  if (NOT (Sender IS TdxBarSubItem)) then
    exit;

  var ASubItm := (Sender AS TdxBarSubItem);

  var ABarMgrBU := TATAutoCleanupP.Create(procedure
    begin
      ASubItm.BarManager.EndUpdate(True);
    end);

  ASubItm.BarManager.BeginUpdate;

  ASubItm.ItemLinks.Clear;

  if (Assigned(FWinListMap)) then
    FWinListMap.Clear
  else
    FWinListMap := TCollections.CreateDictionary<TdxBarButton,
        TdxTabbedMDIPage>([]);

  var ATabProps := mdimgrMain.TabProperties;
  var Cnt := ATabProps.PageCount;

  for var Idx := 0 to (Cnt - 1) do
    begin
      var APage := ATabProps.Pages[Idx];

      var ABtn := (ASubItm.ItemLinks.AddButton.Item AS TdxBarButton);

      ABtn.Caption := APage.MDIChild.Caption;
      ABtn.ButtonStyle := bsChecked;
      ABtn.GroupIndex := ASubItm.Tag;
      ABtn.Down := (APage = ATabProps.ActivePage);

      ABtn.Glyph.Assign(APage.MDIChild.Icon);
      ABtn.Glyph.SourceHeight := 16;
      ABtn.Glyph.SourceWidth := 16;

      ABtn.OnClick := WindowListDocumentClickHandler;

      FWinListMap.Add(ABtn, APage);
    end;

end;

procedure TfrmMain.ExecuteInfoBarVisibleAction(Sender: TObject);
begin
  InfoBarVisible := (NOT InfoBarVisible);
end;

procedure TfrmMain.ExecuteQATAboveAction(Sender: TObject);
begin
  QATPosition := qatAboveRibbon;
end;

procedure TfrmMain.ExecuteQATBelowAction(Sender: TObject);
begin
  QATPosition := qatBelowRibbon;
end;

procedure TfrmMain.ExecuteQATVisibleAction(Sender: TObject);
begin
  QATVisible := (NOT QATVisible);
end;

procedure TfrmMain.ExecuteSBVisibleAction(Sender: TObject);
begin
  StatusBarVisible := (NOT StatusBarVisible);
end;

procedure TfrmMain.ExecuteSearchBarVisibleAction(Sender: TObject);
begin
  SearchBarVisible := (NOT SearchBarVisible);
end;

procedure TfrmMain.ExecuteSkinPaletteAction(Sender: TObject);
begin
  var Idx := cmdSkinPalette.ItemIndex;
  var APalette := 'Default';

  if (Idx >= 0) then
    APalette := cmdSkinPalette.Items[Idx];

  SetUIPalette(APalette);
end;

procedure TfrmMain.ExecuteTouchModeAction(Sender: TObject);
begin
  sknctlMain.TouchMode := (NOT sknctlMain.TouchMode);

  PostUITouchModeChangedEvent;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  GlobalEventBus.Post(TEvtAppClosing.Create);

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //todo:DisableAero := True;

  _LoadUIThemeData;

  InitializeBackStageView;

//  bsvMain.ActiveTab := bsvtabRecent;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Self.OnShow := NIL;

  TdlgSplashDX.HideSplash( 500 );
  TdlgSplashDX.FreeAndNilSplash;

  FInitializing := False;
end;

function TfrmMain.GetBarManager: TdxBarManager;
begin
  Result := barmgrMain;
end;

function TfrmMain.GetInfoBarVisible: Boolean;
begin
  Result := barTAT.Visible;
end;

function TfrmMain.GetKeyStateBar: TdxBar;
begin
  Result := barKeyState;
end;

function TfrmMain.GetPageInfoBar: TdxBar;
begin
  Result := barPageInfo;
end;

function TfrmMain.GetQATPosition: TATQATPosition;
begin
  var aDxPos := ribMain.QuickAccessToolbar.Position;
  var aPos := TATQATPosition( aDxPos );

  Result := aPos;
end;

function TfrmMain.GetQATVisible: Boolean;
begin
  Result := barQAT.Visible;
end;

function TfrmMain.GetSearchBarVisible: Boolean;
begin
  Result := barTAS.Visible;
end;

function TfrmMain.GetStatusBarVisible: Boolean;
begin
  Result := sbMain.Visible;
end;

function TfrmMain.GetStatusText: string;
begin
  Result := sbMain.Panels[1].Text;
end;

function TfrmMain.GetZoomLevelBar: TdxBar;
begin
  Result := barZoomLevel;
end;

procedure TfrmMain.InitBSVAboutTab;
begin
  FAboutDialog := TdlgSplashDX.Create(Self);

  FAboutDialog.SplashMode := TSplashMode.smDialog;
  FAboutDialog.LoadVersionInfo;

  FAboutDialog.SplashBackgroundColor :=
      TSplashBackgroundColor.sbcWhite;

  FAboutDialog.SocialIcons := [];

  FAboutDialog.UpdateSocialActions;

  FAboutDialog.Credits := 'License information goes here.';
  FAboutDialog.Visible := False;

  FAboutDialog.pnlSplash.Parent := bsvtabAbout;
  FAboutDialog.pnlSplash.Align := alClient;
//  FAboutDialog.pnlSplash.Height := 400;

end;

procedure TfrmMain.InitializeBackStageView;
begin
  InitBSVAboutTab;
end;

procedure TfrmMain.MDIMgrGetTabHint(Sender: TdxTabbedMDIManager;
    APage: TdxTabbedMDIPage; var AHint: string; var ACanShow:
    Boolean);
var
  AIntf: IDocumentHint;
begin
  if ( (MDIChildCount > 0) AND
       (Assigned(APage)) AND
       (Supports(APage.MDIChild, IDocumentHint, AIntf))
     ) then
    begin
      AHint := AIntf.GetDocumentHint;
      ACanShow := (NOT AHint.IsEmpty);
      Exit;
    end;

  AHint := EmptyStr;
  ACanShow := False;
end;

procedure TfrmMain.OnSetStatusText(AEvent: TEvtSetStatusText);
begin
  StatusText := AEvent.StatusText;

  AEvent.Free;
end;

procedure TfrmMain.OnSkinMapRibbonSkin(AEvent: TEvtSkinMapRibbonSkin);
begin
  ribMain.ColorSchemeName := AEvent.RibbonSkin;

  AEvent.Free;
end;

procedure TfrmMain.OnUpdateIconSets(AEvent: TEvtUpdateIconSets);
begin
  barmgrMain.ImageOptions.LargeImages := dmImages.MainIconSetLg;
  barmgrMain.ImageOptions.Images := dmImages.MainIconSetSm;

  case ribMain.QuickAccessToolbar.Position of
    qtpAboveRibbon: barQAT.Images := dmImages.QATIconSetAbove;
    qtpBelowRibbon: barQAT.Images := dmImages.QATIconSetBelow;
  end;

  barKeyState.Images := dmImages.SBIconSet;
  barPageInfo.Images := dmImages.SBIconSet;
  barZoomLevel.Images := dmImages.SBIconSet;

  barTAS.Images := dmImages.TASIconSet;

  barTAT.Images := dmImages.TATIconSet;

  AEvent.Free;
end;

procedure TfrmMain.OnUpdateMainFormUI(AEvent: TEvtUpdateMainFormUI);
begin
  UpdateUI;

  AEvent.Free;
end;

procedure TfrmMain.PostUISkinChangedEvent;
begin
  var AName := sknctlMain.SkinName;
  var APalette := sknctlMain.SkinPaletteName;

  GlobalEventBus.Post(TEvtUISkinChanged.Create(AName, APalette));
end;

procedure TfrmMain.PostUITouchModeChangedEvent;
begin
  var ATouchMode := sknctlMain.TouchMode;

  GlobalEventBus.Post(TEvtUITouchModeChanged.Create(ATouchMode));
end;

procedure TfrmMain.SetInfoBarVisible(const Value: Boolean);
begin
  barTAT.Visible := Value;
end;

procedure TfrmMain.SetQATPosition(const Value: TATQATPosition);
begin
  var aDxPos := TdxQuickAccessToolbarPosition( Value );

  ribMain.QuickAccessToolbar.Position := aDxPos;
end;

procedure TfrmMain.SetQATVisible(const Value: Boolean);
begin
  barQAT.Visible := Value;
end;

procedure TfrmMain.SetSearchBarVisible(const Value: Boolean);
begin
  barTAS.Visible := Value;
end;

procedure TfrmMain.SetStatusBarVisible(const Value: Boolean);
begin
  sbMain.Visible := Value;
end;

procedure TfrmMain.SetStatusText(const Value: string);
begin
  sbMain.Panels[1].Text := Value;
end;

procedure TfrmMain.SetUIPalette(const APalette: string);
begin
  sknctlMain.SkinPaletteName := APalette;

  PostUISkinChangedEvent;
end;

procedure TfrmMain.SetUISkin(const ASkinName: string);
begin
  var APalette := 'Default';

  if (NOT SameText(ASkinName, sknctlMain.SkinName)) then
    begin
      sknctlMain.SkinName := ASkinName;

      sknctlMain.PopulateSkinColorPalettes(cmdSkinPalette.Items);

      sknctlMain.SkinPaletteName := APalette;
    end
  else
    begin
      APalette := sknctlMain.SkinPaletteName;
    end;

  var Idx := cmdSkinPalette.Items.IndexOf(APalette);

  cmdSkinPalette.ItemIndex := Idx;

  PostUISkinChangedEvent;
end;

procedure TfrmMain.SetUITouchMode(ATouchMode: Boolean);
begin
  sknctlMain.TouchMode := ATouchMode;

  PostUITouchModeChangedEvent;
end;

procedure TfrmMain.SkinChangedHandler(Sender: TObject; const ASkinName: string);
begin
  if (FInitializing) then
    exit;

  SetUISkin(ASkinName);
end;

procedure TfrmMain.UpdateInfoBarVisibleAction(Sender: TObject);
begin
  var bChecked := InfoBarVisible;

  SetPropertyValue(Sender, cPropChecked, bChecked);

  TdmMain.UpdateVisibilityAction(Sender);
end;

procedure TfrmMain.UpdateQATAboveAction(Sender: TObject);
begin
  var bChk := (QATPosition = qatAboveRibbon);
  var bEnable := QATVisible;

  SetPropertyValue(Sender, cPropChecked, bChk);
  SetPropertyValue(Sender, cPropEnabled, bEnable);
end;

procedure TfrmMain.UpdateQATBelowAction(Sender: TObject);
begin
  var bChk := (QATPosition = qatBelowRibbon);
  var bEnable := QATVisible;

  SetPropertyValue(Sender, cPropChecked, bChk);
  SetPropertyValue(Sender, cPropEnabled, bEnable);
end;

procedure TfrmMain.UpdateQATVisibleAction(Sender: TObject);
begin
  var bChecked := QATVisible;

  SetPropertyValue(Sender, cPropChecked, bChecked);

  TdmMain.UpdateVisibilityAction(Sender);
end;

procedure TfrmMain.UpdateSBVisibleAction(Sender: TObject);
begin
  var bChecked := StatusBarVisible;

  SetPropertyValue(Sender, cPropChecked, bChecked);

  TdmMain.UpdateVisibilityAction(Sender);
end;

procedure TfrmMain.UpdateSearchBarVisibleAction(Sender: TObject);
begin
  var bChecked := SearchBarVisible;

  SetPropertyValue(Sender, cPropChecked, bChecked);

  TdmMain.UpdateVisibilityAction(Sender);
end;

procedure TfrmMain.UpdateSkinPaletteAction(Sender: TObject);
begin
  var bVisible := (cmdSkinPalette.Items.Count > 1);

  AT.Rtti.SetPropertyValue(Sender, cPropEnabled, True);
  AT.Rtti.SetPropertyValue(Sender, cPropVisible, bVisible);
end;

procedure TfrmMain.UpdateTouchModeAction(Sender: TObject);
begin
  var bChecked := sknctlMain.TouchMode;
  SetPropertyValue(Sender, cPropChecked, bChecked);
end;

procedure TfrmMain.UpdateUI;
begin
  //Do nothing right now...
end;

procedure TfrmMain.WindowListDocumentClickHandler(Sender: TObject);
begin
  if (NOT Assigned(FWinListMap)) then
    exit;

  if (NOT (Sender IS TdxBarButton)) then
    exit;

  var ABtn := (Sender AS TdxBarButton);

  var APage: TdxTabbedMDIPage;

  if (NOT FWinListMap.TryGetValue(ABtn, APage)) then
    exit;

  mdimgrMain.TabProperties.PageIndex := APage.Index;
end;

procedure TfrmMain.WindowStateReadDataHandler(Sender: TObject; var Data: TPJWdwStateData);
begin
  var bWinDef := Config(False).ReadBoolean(cCfgSecMainWin,
      cCfgKeyWinUseDefault, cCfgDefWinUseDefault);

  if (bWinDef) then
    exit;

  Data.Left := Config(False).ReadInteger(cCfgSecMainWin,
      cCfgKeyLeft, Left);
  Data.Top := Config(False).ReadInteger(cCfgSecMainWin,
      cCfgKeyTop, Top);
  Data.Width := Config(False).ReadInteger(cCfgSecMainWin,
      cCfgKeyWidth, Width);
  Data.Height := Config(False).ReadInteger(cCfgSecMainWin,
      cCfgKeyHeight, Height);
  Data.State := Config(False).ReadInteger(cCfgSecMainWin,
      cCfgKeyState, Data.State);

  var iPos := Config(False).ReadInteger(cCfgSecMainWin,
      cCfgKeyQATPosition, Ord(QATPosition));
  QATPosition := TATQATPosition(iPos);

  InfoBarVisible := Config(False).ReadBoolean(cCfgSecMainWin,
      cCfgKeyInfoBarVisible, InfoBarVisible);

  SearchBarVisible := Config(False).ReadBoolean(cCfgSecMainWin,
      cCfgKeySearchBarVisible, SearchBarVisible);

  StatusBarVisible := Config(False).ReadBoolean(cCfgSecMainWin,
      cCfgKeyStatusBarVisible, StatusBarVisible);
end;

procedure TfrmMain.WindowStateSaveDataHandler(Sender: TObject; const Data:
    TPJWdwStateData);
begin
  Config(False).WriteBoolean(cCfgSecMainWin, cCfgKeyWinUseDefault,
      False);

  Config(False).WriteInteger(cCfgSecMainWin, cCfgKeyLeft, Data.Left );

  Config(False).WriteInteger(cCfgSecMainWin, cCfgKeyTop, Data.Top);

  Config(False).WriteInteger(cCfgSecMainWin, cCfgKeyWidth,
      Data.Width);

  Config(False).WriteInteger(cCfgSecMainWin, cCfgKeyHeight,
      Data.Height);

  Config(False).WriteInteger(cCfgSecMainWin, cCfgKeyState,
      Data.State);

  Config(False).WriteInteger(cCfgSecMainWin, cCfgKeyQATPosition,
      Ord(QATPosition));

  Config(False).WriteBoolean(cCfgSecMainWin, cCfgKeyQATVisible,
      QATVisible );

  Config(False).WriteBoolean(cCfgSecMainWin, cCfgKeyInfoBarVisible,
      InfoBarVisible );

  Config(False).WriteBoolean(cCfgSecMainWin, cCfgKeySearchBarVisible,
      SearchBarVisible );

  Config(False).WriteBoolean(cCfgSecMainWin, cCfgKeyStatusBarVisible,
      StatusBarVisible );
end;

procedure TfrmMain._AfterBarUIVisibilityMerge;
begin
  var Idx := barUIVisibility.Tag;
  var Cnt := barUIVisibility.ItemLinks.Count;

  if (Cnt <= Idx) then
    exit;

  var ALink := barUIVisibility.ItemLinks.Items[Idx];

  if (NOT Assigned(ALink)) then
    exit;

  ALink.BeginGroup := True;
end;

procedure TfrmMain._AfterBarViewWindowMerge;
begin
  var Cnt := barWindow.ItemLinks.Count;

  if (Cnt <= 1) then
    exit;

  var ALink := barWindow.ItemLinks.Items[Cnt - 1];

  if (NOT Assigned(ALink)) then
    exit;

  ALink.BeginGroup := True;
end;

procedure TfrmMain._ExecuteBSVAction(Action: TCustomAction);
begin
  bsvMain.ClosePopup;

  if (NOT Assigned(Action)) then
    Exit;

  Action.Execute;
end;

procedure TfrmMain._LoadUIThemeData;
begin
  sknctlMain.SkinName := dmImages.SkinName;
  sknctlMain.SkinPaletteName := dmImages.SkinPalette;
  sknctlMain.TouchMode := dmImages.TouchMode;

  ribMain.ColorSchemeName := dmImages.RibbonSkinName;

  skngalUISkin.SelectedSkinName := dmImages.SkinName;
  sknctlMain.PopulateSkinColorPalettes(cmdSkinPalette.Items);

  var Idx := cmdSkinPalette.Items.IndexOf(dmImages.SkinPalette);

  cmdSkinPalette.ItemIndex := Idx;
end;

end.
