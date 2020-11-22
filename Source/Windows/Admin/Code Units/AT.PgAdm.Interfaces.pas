unit AT.PgAdm.Interfaces;

interface

uses
  dxBar;

type
  IDocumentFileLoad = interface
  ['{EEF0D376-ED2B-4F12-8D59-9F76223591EE}']
    procedure LoadFile(const AFilename: String);
  end;

  IDocumentHint = interface
  ['{298EAAD4-8998-4C8D-A349-B19842FF5E07}']
    function GetDocumentHint: String;
  end;

  IDocumentPgNumQuery = interface
  ['{E2355FC0-D87C-411E-8675-DFD54235B9CB}']
    function GetCurrentPageNum: Integer;
    function GetPageCount: Integer;
    property CurrentPageNum: Integer read GetCurrentPageNum;
    property PageCount: Integer read GetPageCount;
  end;

  IDocumentSwitch = interface
  ['{5335C779-FE2C-47E5-BF84-6A592F4AABA3}']
    procedure ActivateChildForm;
    procedure DeactivateChildForm;
  end;

  IFormUpdateIconSets = interface
  ['{68735A7C-BBDD-4D5D-B3AC-562D13F17EB4}']
    procedure UpdateIconSets;
  end;

  IMainFormBarMgr = interface
  ['{BE3B903A-A3D7-494B-B30F-FD90354BFDFE}']
    function GetBarManager: TdxBarManager;
    property BarManager: TdxBarManager read GetBarManager;

  end;
  IMainFormBars = interface
  ['{30E245ED-0791-4267-AF56-B6E399051DD7}']
    function GetKeyStateBar: TdxBar;
    function GetPageInfoBar: TdxBar;
    function GetZoomLevelBar: TdxBar;
    property KeyStateBar: TdxBar read GetKeyStateBar;
    property PageInfoBar: TdxBar read GetPageInfoBar;
    property ZoomLevelBar: TdxBar read GetZoomLevelBar;
  end;

  IMainFormPgNumUpdate = interface
  ['{6BF02F4E-FB51-402A-B8E6-2F4D716FC34C}']
    procedure UpdateCurrentPgNum(APageNum: Integer);
    procedure UpdatePageCount(APageCount: Integer);
  end;

implementation

end.
