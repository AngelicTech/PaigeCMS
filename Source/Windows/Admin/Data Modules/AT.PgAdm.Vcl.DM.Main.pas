unit AT.PgAdm.Vcl.DM.Main;

interface

uses
  System.SysUtils, System.Classes, System.Actions, System.ImageList,
  Vcl.ActnList, Vcl.StdActns, Vcl.ImgList, Vcl.Controls, Vcl.AppEvnts,
  EventBus,
  cxImageList, cxGraphics, cxClasses,
  dxLayoutLookAndFeels;

type
  TdmMain = class(TDataModule)
    actAppExit: TFileExit;
    actAppSettings: TAction;
    actCapsLock: TAction;
    actFileOpen: TFileOpen;
    actNumLock: TAction;
    actScrollLock: TAction;
    alstApp: TActionList;
    actHelpContents: TAction;
    actAppAbout: TAction;
    actATWebsite: TAction;
    actPeerForum: TAction;
    actTechSupport: TAction;
    aeMain: TApplicationEvents;
    procedure AppIdleHandler(Sender: TObject; var Done: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure ExecuteATWebsiteAction(Sender: TObject);
    procedure ExecuteCapsLockAction(Sender: TObject);
    procedure ExecuteNumLockAction(Sender: TObject);
    procedure ExecutePeerForumAction(Sender: TObject);
    procedure ExecuteScrollLockAction(Sender: TObject);
    procedure ExecuteTechSupportAction(Sender: TObject);
    procedure FileOpenActionAccepted(Sender: TObject);
    procedure UpdateCapsLockAction(Sender: TObject);
    procedure UpdateNumLockAction(Sender: TObject);
    procedure UpdateScrollLockAction(Sender: TObject);
  strict private
    function _IsDocFile(const AFilename: String): Boolean;
    function _IsPDFFile(const AFilename: String): Boolean;
  public
    class procedure UpdateVisibilityAction(Sender: TObject);
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  System.IOUtils, System.Rtti,
  Vcl.Dialogs,
  AT.Rtti, AT.Windows,
  AT.PgAdm.Props.Consts, AT.PgAdm.Vcl.DM.Images, AT.PgAdm.ResourceStrings,
  AT.Vcl.Dialogs.SplashDX, AT.PgAdm.Consts, AT.PgAdm.DEB.Events;

{$R *.dfm}

procedure TdmMain.AppIdleHandler(Sender: TObject; var Done: Boolean);
begin
  GlobalEventBus.Post(TEvtAppIdle.Create);
  GlobalEventBus.Post(TEvtUpdateActions.Create);
end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  TdlgSplashDX.ChangeStartMessage(rstrInitAppData, 100);

  actFileOpen.Dialog.InitialDir := TPath.GetDocumentsPath;
end;

procedure TdmMain.ExecuteATWebsiteAction(Sender: TObject);
begin
  AT.Windows.GotoURL(cInetWebsite);
end;

procedure TdmMain.ExecuteCapsLockAction(Sender: TObject);
begin
  ToggleCapsLock;
end;

procedure TdmMain.ExecuteNumLockAction(Sender: TObject);
begin
  ToggleNumLock;
end;

procedure TdmMain.ExecutePeerForumAction(Sender: TObject);
begin
  AT.Windows.GotoURL(cInetPeerForum);
end;

procedure TdmMain.ExecuteScrollLockAction(Sender: TObject);
begin
  ToggleScrollLock;
end;

procedure TdmMain.ExecuteTechSupportAction(Sender: TObject);
begin
  AT.Windows.GotoURL(cInetTechSupport);
end;

procedure TdmMain.FileOpenActionAccepted(Sender: TObject);
//var
//  AFilename: String;
begin
  // TODO -cMM: TdmMain.FileOpenActionAccepted use rtti...

//  AFilename := actFileOpen.Dialog.FileName;

//  if (_IsPDFFile(AFilename)) then
//    TfrmPDFViewer.OpenDocument(AFilename)
//  else if (_IsDocFile(AFilename)) then
//    TfrmDocument.OpenDocument(AFilename)
//  else
//    ShowMessage('Unrecognized file format.');
end;

procedure TdmMain.UpdateCapsLockAction(Sender: TObject);
var
  bChecked: Boolean;
begin
  bChecked := IsCapsLockOn;

  AT.Rtti.SetPropertyValue(Sender, cPropChecked, bChecked);
end;

procedure TdmMain.UpdateNumLockAction(Sender: TObject);
var
  bChecked: Boolean;
begin
  bChecked := IsNumLockOn;

  AT.Rtti.SetPropertyValue(Sender, cPropChecked, bChecked);
end;

procedure TdmMain.UpdateScrollLockAction(Sender: TObject);
var
  bChecked: Boolean;
begin
  bChecked := IsScrollLockOn;

  AT.Rtti.SetPropertyValue(Sender, cPropChecked, bChecked);
end;

class procedure TdmMain.UpdateVisibilityAction(Sender: TObject);
begin
  var ACheckVal: TValue;

  if (NOT GetPropertyValue(Sender, cPropChecked, ACheckVal)) then
    exit;

  var ACapProp := EmptyStr;
  var AImgProp := EmptyStr;

  if (ACheckVal.AsBoolean) then
    begin
      ACapProp := cPropStringData;
      AImgProp := cPropInt32Data;
    end
  else
    begin
      ACapProp := cPropVariantdata;
      AImgProp := cPropInt64Data;
    end;

  var ACapValue: TValue;
  if (GetPropertyValue(Sender, ACapProp, ACapValue)) then
    SetPropertyValue(Sender, cPropCaption, ACapValue);

  var AImgValue: TValue;
  if (GetPropertyValue(Sender, AImgProp, AImgValue)) then
    SetPropertyValue(Sender, cPropImageIndex, AImgValue);
end;

function TdmMain._IsDocFile(const AFilename: String): Boolean;
var
  AExt: String;
begin
  AExt := TPath.GetExtension(AFilename);

  Result := ( SameText(AExt, '.doc') OR
              SameText(AExt, '.docx') OR
              SameText(AExt, '.rtf') );
end;

function TdmMain._IsPDFFile(const AFilename: String): Boolean;
var
  AExt: String;
begin
  AExt := TPath.GetExtension(AFilename);

  Result := SameText(AExt, '.pdf');
end;

end.
