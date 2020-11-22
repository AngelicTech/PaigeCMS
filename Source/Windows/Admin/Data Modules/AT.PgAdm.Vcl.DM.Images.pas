unit AT.PgAdm.Vcl.DM.Images;

interface

uses
  System.SysUtils, System.Classes, System.ImageList,
  Data.DB,
  Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  AT.PgAdm.DEB.Events,
  cxStyles, cxClasses,
  EventBus, MemDS, VirtualTable, dxRibbon, dxLayoutLookAndFeels;

type
  TdmImages = class(TDataModule)
    cxstylStatusBarText: TcxStyle;
    fldIconMapMainIconSet: TSmallintField;
    fldIconMapQATAboveIconSet: TSmallintField;
    fldIconMapQATBelowIconSet: TSmallintField;
    fldIconMapRibbonSkin: TStringField;
    fldIconMapSBIconSet: TSmallintField;
    fldIconMapSkinName: TStringField;
    fldIconMapSkinPalette: TStringField;
    fldIconMapTASIconSet: TSmallintField;
    fldIconMapTATIconSet: TSmallintField;
    imgcollBlack: TImageCollection;
    imgcollMain: TImageCollection;
    imgcollWhite: TImageCollection;
    stylrepoMain: TcxStyleRepository;
    vilBSVNewBlack: TVirtualImageList;
    vilBSVNewColor: TVirtualImageList;
    vilBSVNewWhite: TVirtualImageList;
    vilLargeBlack: TVirtualImageList;
    vilLargeColor: TVirtualImageList;
    vilLargeWhite: TVirtualImageList;
    vilSmallBlack: TVirtualImageList;
    vilSmallColor: TVirtualImageList;
    vilSmallWhite: TVirtualImageList;
    vtblIconMap: TVirtualTable;
    laylfMain: TdxLayoutLookAndFeelList;
    laylfsMain: TdxLayoutSkinLookAndFeel;
    laylfsBSVSubCaption: TdxLayoutCxLookAndFeel;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  strict private
    FInSkinUpdateEvent: Boolean;
    FInTouchModeUpdateEvent: Boolean;
    FSkinName: String;
    FSkinPalette: String;
    FTouchMode: Boolean;
    procedure _LoadUIThemeData;
    procedure _SaveUIThemeData;
  strict protected
    function GetMainIconSetLg: TVirtualImageList;
    function GetMainIconSetSm: TVirtualImageList;
    function GetQATIconSetAbove: TVirtualImageList;
    function GetQATIconSetBelow: TVirtualImageList;
    function GetRibbonSkinName: String;
    function GetSBIconSet: TVirtualImageList;
    function GetSkinName: String;
    function GetSkinPalette: String;
    function GetTASIconSet: TVirtualImageList;
    function GetTATIconSet: TVirtualImageList;
    function GetTouchMode: Boolean;
    procedure PostSkinMapEvents;
    procedure PostSkinMapRibbonSkinEvent;
    procedure PostUpdateIconSetsEvent;
    procedure PostUpdateUITouchModeEvent;
    procedure SetSkinName(const Value: String);
    procedure SetSkinPalette(const Value: String);
    procedure SetTouchMode(const Value: Boolean);
    procedure UpdateStatusBarStyles;
    procedure UpdateStyleRepo;
  public
    constructor Create(AOwner: TComponent); override;
    function MapSkinNameToIconSet(const ASkinName: string; ALargeIcons: Boolean =
        False): TVirtualImageList; overload;
    function MapSkinNameToIconSet(const ASkinName, ASkinPalette: string;
        ALargeIcons: Boolean = False): TVirtualImageList; overload;
    function MapSkinNameToQATIconSet(const ASkinName, ASkinPalette: string; QATPos:
        TdxQuickAccessToolbarPosition): TVirtualImageList; overload;
    function MapSkinNameToQATIconSet(const ASkinName: string; QATPos:
        TdxQuickAccessToolbarPosition): TVirtualImageList; overload;
    function MapSkinNameToRibbonSkin(const ASkinName: string): string;
    function MapSkinNameToSBIconSet(const ASkinName: string): TVirtualImageList;
        overload;
    function MapSkinNameToSBIconSet(const ASkinName: string; const ASkinPalette:
        String): TVirtualImageList; overload;
    function MapSkinNameToTASIconSet(const ASkinName: string): TVirtualImageList;
        overload;
    function MapSkinNameToTASIconSet(const ASkinName: string; const ASkinPalette:
        String): TVirtualImageList; overload;
    function MapSkinNameToTATIconSet(const ASkinName: string): TVirtualImageList;
        overload;
    function MapSkinNameToTATIconSet(const ASkinName: string; const ASkinPalette:
        String): TVirtualImageList; overload;
    [Subscribe(TThreadMode.Main)]
    procedure OnUISkinChanged(AEvent: TEvtUISkinChanged); virtual;
    [Subscribe(TThreadMode.Main)]
    procedure OnUITouchModeChanged(AEvent: TEvtUITouchModeChanged); virtual;
    property MainIconSetLg: TVirtualImageList read GetMainIconSetLg;
    property MainIconSetSm: TVirtualImageList read GetMainIconSetSm;
    property QATIconSetAbove: TVirtualImageList read GetQATIconSetAbove;
    property QATIconSetBelow: TVirtualImageList read GetQATIconSetBelow;
    property RibbonSkinName: String read GetRibbonSkinName;
    property SBIconSet: TVirtualImageList read GetSBIconSet;
    property TASIconSet: TVirtualImageList read GetTASIconSet;
    property TATIconSet: TVirtualImageList read GetTATIconSet;
  published
    property SkinName: String read GetSkinName write SetSkinName;
    property SkinPalette: String read GetSkinPalette write SetSkinPalette;
    property TouchMode: Boolean read GetTouchMode write SetTouchMode;
  end;

var
  dmImages: TdmImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  System.Variants,
  AT.Vcl.Dialogs.SplashDX, AT.GarbageCollector,
  cxLookAndFeels,
  dxSkinsLookAndFeelPainter, dxSkinsCore, AT.Automate,
  AT.PgAdm.ResourceStrings, AT.PgAdm.Config.Consts, AT.PgAdm.Config;

{$R *.dfm}

constructor TdmImages.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FInSkinUpdateEvent := False;
  FInTouchModeUpdateEvent := False;
  FTouchMode := False;

  GlobalEventBus.RegisterSubscriber(Self);
end;

procedure TdmImages.DataModuleDestroy(Sender: TObject);
begin
  _SaveUIThemeData;
end;

procedure TdmImages.DataModuleCreate(Sender: TObject);
begin
  TdlgSplashDX.ChangeStartMessage(rstrLoadAppImages, 100);

  TdlgSplashDX.ChangeStartMessage(rstrLoadIconMap, 100);
  vtblIconMap.Open;

  TdlgSplashDX.ChangeStartMessage(rstrLoadUITheme, 100);
  _LoadUIThemeData;
end;

function TdmImages.GetMainIconSetLg: TVirtualImageList;
begin
  Result := MapSkinNameToIconSet(SkinName, SkinPalette, True);
end;

function TdmImages.GetMainIconSetSm: TVirtualImageList;
begin
  Result := MapSkinNameToIconSet(SkinName, SkinPalette, False);
end;

function TdmImages.GetQATIconSetAbove: TVirtualImageList;
begin
  Result := MapSkinNameToQATIconSet(SkinName, SkinPalette, qtpAboveRibbon);
end;

function TdmImages.GetQATIconSetBelow: TVirtualImageList;
begin
  Result := MapSkinNameToQATIconSet(SkinName, SkinPalette, qtpBelowRibbon);
end;

function TdmImages.GetRibbonSkinName: String;
begin
  Result := MapSkinNameToRibbonSkin(SkinName);
end;

function TdmImages.GetSBIconSet: TVirtualImageList;
begin
  Result := MapSkinNameToSBIconSet(SkinName, SkinPalette);
end;

function TdmImages.GetSkinName: String;
begin
  Result := FSkinName;
end;

function TdmImages.GetSkinPalette: String;
begin
  Result := FSkinPalette;
end;

function TdmImages.GetTASIconSet: TVirtualImageList;
begin
  Result := MapSkinNameToTASIconSet(SkinName, SkinPalette);
end;

function TdmImages.GetTATIconSet: TVirtualImageList;
begin
  Result := MapSkinNameToTATIconSet(SkinName, SkinPalette);
end;

function TdmImages.GetTouchMode: Boolean;
begin
  Result := FTouchMode;
end;

function TdmImages.MapSkinNameToIconSet(const ASkinName: string; ALargeIcons:
    Boolean = False): TVirtualImageList;
var
  iIconSet: Integer;
begin
  if (ALargeIcons) then
    Result := vilLargeColor
  else
    Result := vilSmallColor;

  if ( vtblIconMap.Locate('SkinName', ASkinName, [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName('MainIconSet').AsInteger;

      if (ALargeIcons) then
        begin
          case iIconSet of
            1 : Result := vilLargeColor;
            2 : Result := vilLargeBlack;
            3 : Result := vilLargeWhite;
          end;
        end
      else
        begin
          case iIconSet of
            1 : Result := vilSmallColor;
            2 : Result := vilSmallBlack;
            3 : Result := vilSmallWhite;
          end;
        end;
    end;

end;

function TdmImages.MapSkinNameToIconSet(const ASkinName, ASkinPalette: string;
    ALargeIcons: Boolean = False): TVirtualImageList;
var
  iIconSet: Integer;
begin
  if (ALargeIcons) then
    Result := vilLargeColor
  else
    Result := vilSmallColor;

  if ( vtblIconMap.Locate('SkinName;SkinPalette',
      VarArrayOf([ASkinName, ASkinPalette]), [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName('MainIconSet').AsInteger;

      if (ALargeIcons) then
        begin
          case iIconSet of
            1 : Result := vilLargeColor;
            2 : Result := vilLargeBlack;
            3 : Result := vilLargeWhite;
          end;
        end
      else
        begin
          case iIconSet of
            1 : Result := vilSmallColor;
            2 : Result := vilSmallBlack;
            3 : Result := vilSmallWhite;
          end;
        end;
    end;

end;

function TdmImages.MapSkinNameToQATIconSet(const ASkinName, ASkinPalette:
    string; QATPos: TdxQuickAccessToolbarPosition): TVirtualImageList;
var
  AFldName: string;
  iIconSet: Integer;
begin
  Result := vilSmallColor;

  case QATPos of
    qtpAboveRibbon: AFldName := 'QATAboveIconSet';
    qtpBelowRibbon: AFldName := 'QATBelowIconSet';
  else
    AFldName := 'QATAboveIconSet';
  end;

  if ( vtblIconMap.Locate('SkinName;SkinPalette',
      VarArrayOf([ASkinName, ASkinPalette]), [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName(AFldName).AsInteger;

      case iIconSet of
        1 : Result := vilSmallColor;
        2 : Result := vilSmallBlack;
        3 : Result := vilSmallWhite;
      end;

    end;

end;

function TdmImages.MapSkinNameToQATIconSet(const ASkinName: string; QATPos:
    TdxQuickAccessToolbarPosition): TVirtualImageList;
var
  AFldName: String;
  iIconSet: Integer;
begin
  Result := vilSmallColor;

  case QATPos of
    qtpAboveRibbon: AFldName := 'QATAboveIconSet';
    qtpBelowRibbon: AFldName := 'QATBelowIconSet';
  else
    AFldName := 'QATAboveIconSet';
  end;

  if ( vtblIconMap.Locate('SkinName', ASkinName, [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName(AFldName).AsInteger;

      case iIconSet of
        1 : Result := vilSmallColor;
        2 : Result := vilSmallBlack;
        3 : Result := vilSmallWhite;
      end;

    end;

end;

function TdmImages.MapSkinNameToRibbonSkin(const ASkinName: string): string;
begin

  if ( vtblIconMap.Locate('SkinName', ASkinName, [TLocateOption.loCaseInsensitive]) ) then
    Result := vtblIconMap.FieldByName('RibbonSkin').AsString
  else
    Result := ASkinName;

end;

function TdmImages.MapSkinNameToSBIconSet(const ASkinName: string):
    TVirtualImageList;
var
  iIconSet: Integer;
begin
  Result := vilSmallColor;

  if ( vtblIconMap.Locate('SkinName', ASkinName, [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName('SBIconSet').AsInteger;

      case iIconSet of
        1 : Result := vilSmallColor;
        2 : Result := vilSmallBlack;
        3 : Result := vilSmallWhite;
      end;

    end;

end;

function TdmImages.MapSkinNameToSBIconSet(const ASkinName: string; const
    ASkinPalette: String): TVirtualImageList;
var
  iIconSet: Integer;
begin
  Result := vilSmallColor;

  if ( vtblIconMap.Locate('SkinName;SkinPalette',
      VarArrayOf([ASkinName, ASkinPalette]), [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName('SBIconSet').AsInteger;

      case iIconSet of
        1 : Result := vilSmallColor;
        2 : Result := vilSmallBlack;
        3 : Result := vilSmallWhite;
      end;

    end;

end;

function TdmImages.MapSkinNameToTASIconSet(
  const ASkinName: string): TVirtualImageList;
var
  iIconSet: Integer;
begin
  Result := vilSmallColor;

  if ( vtblIconMap.Locate('SkinName', ASkinName, [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName('TASIconSet').AsInteger;

      case iIconSet of
        1 : Result := vilSmallColor;
        2 : Result := vilSmallBlack;
        3 : Result := vilSmallWhite;
      end;

    end;

end;

function TdmImages.MapSkinNameToTASIconSet(const ASkinName,
  ASkinPalette: String): TVirtualImageList;
var
  iIconSet: Integer;
begin
  Result := vilSmallColor;

  if ( vtblIconMap.Locate('SkinName;SkinPalette',
      VarArrayOf([ASkinName, ASkinPalette]), [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName('TASIconSet').AsInteger;

      case iIconSet of
        1 : Result := vilSmallColor;
        2 : Result := vilSmallBlack;
        3 : Result := vilSmallWhite;
      end;

    end;

end;

function TdmImages.MapSkinNameToTATIconSet(
  const ASkinName: string): TVirtualImageList;
var
  iIconSet: Integer;
begin
  Result := vilSmallColor;

  if ( vtblIconMap.Locate('SkinName', ASkinName, [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName('TATIconSet').AsInteger;

      case iIconSet of
        1 : Result := vilSmallColor;
        2 : Result := vilSmallBlack;
        3 : Result := vilSmallWhite;
      end;

    end;

end;

function TdmImages.MapSkinNameToTATIconSet(const ASkinName,
  ASkinPalette: String): TVirtualImageList;
var
  iIconSet: Integer;
begin
  Result := vilSmallColor;

  if ( vtblIconMap.Locate('SkinName;SkinPalette',
      VarArrayOf([ASkinName, ASkinPalette]), [TLocateOption.loCaseInsensitive]) ) then
    begin

      iIconSet := vtblIconMap.FieldByName('TATIconSet').AsInteger;

      case iIconSet of
        1 : Result := vilSmallColor;
        2 : Result := vilSmallBlack;
        3 : Result := vilSmallWhite;
      end;

    end;

end;

procedure TdmImages.OnUISkinChanged(AEvent: TEvtUISkinChanged);
begin
  if (NOT Assigned(AEvent)) then
    Exit;

  FInSkinUpdateEvent := True;

  var ACleanup := TATAutoCleanupP.Create(procedure
    begin
      FInSkinUpdateEvent := False;
    end);

  SetSkinName(AEvent.SkinName);
  SetSkinPalette(AEvent.SkinPalette);

  UpdateStyleRepo;

  PostSkinMapEvents;

  AEvent.Free;
end;

procedure TdmImages.OnUITouchModeChanged(
  AEvent: TEvtUITouchModeChanged);
begin
  if (NOT Assigned(AEvent)) then
    Exit;

  FInTouchModeUpdateEvent := True;

  var ACleanup := TATAutoCleanupP.Create(procedure
    begin
      FInTouchModeUpdateEvent := False;
    end);

  SetTouchMode(AEvent.TouchMode);

  AEvent.Free;
end;

procedure TdmImages.PostSkinMapEvents;
begin
  PostSkinMapRibbonSkinEvent;
  PostUpdateIconSetsEvent;
end;

procedure TdmImages.PostSkinMapRibbonSkinEvent;
var
  ARibbonSkin: String;
begin
  ARibbonSkin := MapSkinNameToRibbonSkin(SkinName);

  GlobalEventBus.Post(TEvtSkinMapRibbonSkin.Create(ARibbonSkin));
end;

procedure TdmImages.PostUpdateIconSetsEvent;
begin
  GlobalEventBus.Post(TEvtUpdateIconSets.Create());
end;

procedure TdmImages.PostUpdateUITouchModeEvent;
begin
  GlobalEventBus.Post(TEvtUpdateUITouchMode.Create(TouchMode));
end;

procedure TdmImages.SetSkinName(const Value: String);
begin
  if (Value.IsEmpty) then
    Exit;

  FSkinName := Value;

  if (FInSkinUpdateEvent) then
    Exit;

  UpdateStyleRepo;

  PostSkinMapEvents
end;

procedure TdmImages.SetSkinPalette(const Value: String);
begin
  if (Value.IsEmpty) then
    Exit;

  FSkinPalette := Value;

  if (FInSkinUpdateEvent) then
    Exit;

  UpdateStyleRepo;

  PostSkinMapEvents
end;

procedure TdmImages.SetTouchMode(const Value: Boolean);
begin
  FTouchMode := Value;

  if (FInTouchModeUpdateEvent) then
    Exit;

  PostUpdateUITouchModeEvent;
end;

procedure TdmImages.UpdateStatusBarStyles;
var
  AElement: TdxSkinElement;
  AGroup: TdxSkinControlGroup;
  ASkin: TdxSkin;
  ASkinInfo: TdxSkinLookAndFeelPainterInfo;
begin
  if (NOT RootLookAndFeel.Painter.GetPainterData(ASkinInfo)) then
    exit;

  ASkin := ASkinInfo.Skin;

  if (NOT ASkin.GetGroupByName('Bars', AGroup)) then
    exit;

  if (NOT AGroup.GetElementByName('StatusBar', AElement)) then
    exit;

  cxstylStatusBarText.Font.Color := AElement.TextColor;
  cxstylStatusBarText.TextColor := AElement.TextColor;
end;

procedure TdmImages.UpdateStyleRepo;
begin
  UpdateStatusBarStyles;
end;

procedure TdmImages._LoadUIThemeData;
begin
  FSkinName := Config(False).ReadString(cCfgSecUI, cCfgKeySkinName,
      cCfgDefSkinName);

  FSkinPalette := Config(False).ReadString(cCfgSecUI,
      cCfgKeySkinPalette, cCfgDefSkinPalette);

  FTouchMode := Config(False).ReadBoolean(cCfgSecUI, cCfgKeyTouchMode,
      cCfgDefTouchMode);
end;

procedure TdmImages._SaveUIThemeData;
begin
  Config(False).WriteString(cCfgSecUI, cCfgKeySkinName, FSkinName);

  Config(False).WriteString(cCfgSecUI, cCfgKeySkinPalette,
      FSkinPalette);

  Config(False).WriteBoolean(cCfgSecUI, cCfgKeyTouchMode, FTouchMode);
end;

end.

