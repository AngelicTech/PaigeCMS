unit AT.PgAdm.DEB.Events;

interface

uses
  Vcl.VirtualImageList, Vcl.Forms,
  EventBus;

type
  TEvtAppClosing = class(TObject)
  end;

  TEvtAppIdle = class(TObject)
  end;

  TEvtSetStatusText = class(TObject)
  strict private
    FStatusText: String;
  public
    constructor Create(const AStatusText: String);
    property StatusText: String read FStatusText;
  end;

  TEvtSkinMapRibbonSkin = class(TObject)
  strict private
    FRibbonSkin: String;
  public
    constructor Create(const ARibbonSkin: String);
    property RibbonSkin: String read FRibbonSkin;
  end;

  TEvtUISkinChanged = class(TObject)
  strict private
    FSkinName: String;
    FSkinPalette: String;
  public
    constructor Create(const ASkinName, ASkinPalette: String);
    property SkinName: String read FSkinName;
    property SkinPalette: String read FSkinPalette;
  end;

  TEvtUITouchModeChanged = class(TObject)
  strict private
    FTouchMode: Boolean;
  public
    constructor Create(ATouchMode: Boolean);
    property TouchMode: Boolean read FTouchMode;
  end;

  TEvtUpdateActions = class(TObject)
  end;

  TEvtUpdateIconSets = class(TObject)
  end;

  TEvtUpdateMainFormUI = class(TObject)
  end;

  TEvtUpdateUITouchMode = class(TObject)
  strict private
    FTouchMode: Boolean;
  public
    constructor Create(ATouchMode: Boolean);
    property TouchMode: Boolean read FTouchMode;
  end;



implementation


{ TEvtSetStatusText }

constructor TEvtSetStatusText.Create(const AStatusText: String);
begin
  FStatusText := AStatusText;
end;


{ TEvtSkinMapRibbonSkin }

constructor TEvtSkinMapRibbonSkin.Create(const ARibbonSkin: String);
begin
  FRibbonSkin := ARibbonSkin;
end;


{ TEvtUISkinChanged }

constructor TEvtUISkinChanged.Create(const ASkinName, ASkinPalette: String);
begin
  FSkinName := ASkinName;
  FSkinPalette := ASkinPalette;
end;


{ TEvtUITouchModeChanged }

constructor TEvtUITouchModeChanged.Create(ATouchMode: Boolean);
begin
  FTouchMode := ATouchMode;
end;


{ TEvtUpdateUITouchMode }

constructor TEvtUpdateUITouchMode.Create(ATouchMode: Boolean);
begin
  FTouchMode := ATouchMode;
end;


end.
