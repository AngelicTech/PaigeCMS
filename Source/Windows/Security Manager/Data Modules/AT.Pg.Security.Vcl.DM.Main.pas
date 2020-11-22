unit AT.Pg.Security.Vcl.DM.Main;

interface

uses
  System.SysUtils, System.Classes,
  Data.DB,
  uLoginDlg, uSecDlg, CREncryption, Uni, DBAccess, MemDS, UniProvider,
  InterBaseUniProvider, uSecControl, EventBus,
  AT.Pg.Security.DEB.Events;

type
  TdmMain = class( TDataModule )
    conMain: TUniConnection;
    dlgLogin: TuilLoginDlg;
    dlgSecurity: TuilSecurityDlg;
    dsGroupPerms: TUniDataSource;
    dsGroups: TUniDataSource;
    dsGroupUsers: TUniDataSource;
    dsPermissions: TUniDataSource;
    dsUserPerms: TUniDataSource;
    dsUsers: TUniDataSource;
    encUsers: TUniEncryptor;
    fldGroupPermsGROUP_NAME: TWideStringField;
    fldGroupPermsPERMISSION: TWideStringField;
    fldGroupsDESCRIPTION: TWideStringField;
    fldGroupsGROUP_NAME: TWideStringField;
    fldGroupUsersGROUP_NAME: TWideStringField;
    fldGroupUsersUSER_NAME: TWideStringField;
    fldPermissionsACTION: TIntegerField;
    fldPermissionsDESCRIPTION: TWideStringField;
    fldPermissionsFORMNAME: TWideStringField;
    fldPermissionsITEMS: TBlobField;
    fldPermissionsPERMISSION: TWideStringField;
    fldUserPermsPERMISSION: TWideStringField;
    fldUserPermsUSER_NAME: TWideStringField;
    fldUsersACCESS_COUNT: TLargeintField;
    fldUsersACTIVE: TBooleanField;
    fldUsersCREATED_DATE: TDateField;
    fldUsersCREATED_TIME: TTimeField;
    fldUsersDISPLAY_NAME: TWideStringField;
    fldUsersLASTACCESS_DATE: TDateField;
    fldUsersLASTACCESS_TIME: TTimeField;
    fldUsersPASSWORD: TBlobField;
    fldUsersUSER_NAME: TWideStringField;
    provibMain: TInterBaseUniProvider;
    secmgrMain: TuilSecurityManager;
    tblGroupPerms: TUniTable;
    tblGroups: TUniTable;
    tblGroupUsers: TUniTable;
    tblPermissions: TUniTable;
    tblUserPerms: TUniTable;
    tblUsers: TUniTable;
    procedure DisabledLoginHandler( Sender: TObject;
      UserName:string );
    procedure FailedLoginDetailHandler( Sender: TObject;
      UserName, Password:string );
    procedure GroupPermsDeleteErrorHandler( DataSet: TDataSet;
      E: EDatabaseError;var Action: TDataAction );
    procedure GroupsDeleteErrorHandler( DataSet: TDataSet;
      E: EDatabaseError;var Action: TDataAction );
    procedure GroupUsersDeleteErrorHandler( DataSet: TDataSet;
      E: EDatabaseError;var Action: TDataAction );
    procedure PermsDeleteErrorHandler( DataSet: TDataSet;
      E: EDatabaseError;var Action: TDataAction );
    procedure SuccessfulLoginHandler( Sender: TObject );
    procedure UserPermsDeleteErrorHandler( DataSet: TDataSet;
      E: EDatabaseError;var Action: TDataAction );
    procedure UsersDeleteErrorHandler( DataSet: TDataSet;
      E: EDatabaseError;var Action: TDataAction );
  strict private
    procedure _InitializeDatabase;
    procedure _OpenDatabase;
    procedure _OpenTables;
  strict protected
    function GetCurrentUser:string;
    function GetLoggedIn: Boolean;
    procedure PostSetUserNameStatus( const AUserName:string );
    procedure PostShowMessage( const AMessage:string );
  public
    constructor Create( AOwner: TComponent ); override;
    function HasPermission( const APermission:string ): Boolean;
    [ Subscribe( TThreadMode.Main )]
    procedure OnPerformLogin( AEvent: TEvtPerformLogin );
    [ Subscribe( TThreadMode.Main )]
    procedure OnPerformLogout( AEvent: TEvtPerformLogout );
    [ Subscribe( TThreadMode.Main )]
    procedure OnShowSecurityDialog( AEvent: TEvtShowSecurityDialog );
    property CurrentUser:string
      read   GetCurrentUser;
    property LoggedIn: Boolean
      read   GetLoggedIn;
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  AT.Pg.Security.Config.Consts, AT.Pg.Security.Config;

{$R *.dfm}

constructor TdmMain.Create( AOwner: TComponent );
begin

  inherited;

  _InitializeDatabase;
  _OpenDatabase;
  _OpenTables;

  GlobalEventBus.RegisterSubscriber( Self );

end;

procedure TdmMain.DisabledLoginHandler( Sender: TObject;
  UserName:string );
begin

  PostShowMessage( Format( 'User %s is disabled.',[ UserName ]));

end;

procedure TdmMain.FailedLoginDetailHandler( Sender: TObject;
  UserName, Password:string );
begin

  PostShowMessage( Format( 'Login attempt failed for user (%s).',
      [ UserName ]));

end;

function TdmMain.GetCurrentUser:string;
begin

  Result := secmgrMain.CurrentUser;

end;

function TdmMain.GetLoggedIn: Boolean;
begin

  Result := secmgrMain.LoggedIn;

end;

procedure TdmMain.GroupPermsDeleteErrorHandler( DataSet: TDataSet;
  E: EDatabaseError;var Action: TDataAction );
begin

  var
  APermFld := DataSet.FieldByName( 'PERMISSION' );
  var
  APerm := APermFld.AsString;

  var
  AGrpFld := DataSet.FieldByName( 'GROUP_NAME' );
  var
  AGrp := AGrpFld.AsString;

  PostShowMessage
    ( Format( 'Cannot remove permission (%s) from group (%s).',
      [ APerm, AGrp ]));

  Action := TDataAction.daAbort;

end;

procedure TdmMain.GroupsDeleteErrorHandler( DataSet: TDataSet;
  E: EDatabaseError;var Action: TDataAction );
begin

  var
  AGrpFld := DataSet.FieldByName( 'GROUP_NAME' );
  var
  AGrp := AGrpFld.AsString;

  PostShowMessage( Format( 'Cannot remove group (%s).',[ AGrp ]));

  Action := TDataAction.daAbort;

end;

procedure TdmMain.GroupUsersDeleteErrorHandler( DataSet: TDataSet;
  E: EDatabaseError;var Action: TDataAction );
begin

  var
  AGrpFld := DataSet.FieldByName( 'GROUP_NAME' );
  var
  AGrp := AGrpFld.AsString;

  var
  AUserFld := DataSet.FieldByName( 'USER_NAME' );
  var
  AUser := AUserFld.AsString;

  PostShowMessage( Format( 'Cannot remove user (%s) from group (%s).',
      [ AUser, AGrp ]));

  Action := TDataAction.daAbort;

end;

function TdmMain.HasPermission( const APermission:string ): Boolean;
begin

  Result := secmgrMain.HasPermission( APermission );

end;

procedure TdmMain.OnPerformLogin( AEvent: TEvtPerformLogin );
begin

  dlgLogin.Execute;

  AEvent.Free;

end;

procedure TdmMain.OnPerformLogout( AEvent: TEvtPerformLogout );
begin

  secmgrMain.Logout;

  PostSetUserNameStatus( EmptyStr );

  AEvent.Free;

end;

procedure TdmMain.OnShowSecurityDialog
  ( AEvent: TEvtShowSecurityDialog );
begin

  dlgSecurity.Execute;

  AEvent.Free;

end;

procedure TdmMain.PermsDeleteErrorHandler( DataSet: TDataSet;
  E: EDatabaseError;var Action: TDataAction );
begin

  var
  APermFld := DataSet.FieldByName( 'PERMISSION' );
  var
  APerm := APermFld.AsString;

  PostShowMessage( Format( 'Cannot remove permission (%s).',
      [ APerm ]));

  Action := TDataAction.daAbort;

end;

procedure TdmMain.PostSetUserNameStatus( const AUserName:string );
begin
  GlobalEventBus.Post( TEvtSetUserNameStatus.Create( AUserName ));
end;

procedure TdmMain.PostShowMessage( const AMessage:string );
begin
  GlobalEventBus.Post( TEvtShowMessage.Create( AMessage ));
end;

procedure TdmMain.SuccessfulLoginHandler( Sender: TObject );
begin

  PostSetUserNameStatus( CurrentUser );

end;

procedure TdmMain.UserPermsDeleteErrorHandler( DataSet: TDataSet;
  E: EDatabaseError;var Action: TDataAction );
begin

  var
  APermFld := DataSet.FieldByName( 'PERMISSION' );
  var
  APerm := APermFld.AsString;

  var
  AUserFld := DataSet.FieldByName( 'USER_NAME' );
  var
  AUser := AUserFld.AsString;

  PostShowMessage
    ( Format( 'Cannot remove permission (%s) from user (%s).',
      [ APerm, AUser ]));

  Action := TDataAction.daAbort;

end;

procedure TdmMain.UsersDeleteErrorHandler( DataSet: TDataSet;
  E: EDatabaseError;var Action: TDataAction );
begin

  var
  AUserFld := DataSet.FieldByName( 'USER_NAME' );
  var
  AUser := AUserFld.AsString;

  PostShowMessage( Format( 'Cannot remove user (%s).',[ AUser ]));

  Action := TDataAction.daAbort;

end;

procedure TdmMain._InitializeDatabase;
begin

  var
  AServer := Config( True ).ReadString( cCfgSecDatabase,
    cCfgKeyServer, 'localhost' );
  conMain.Server := AServer;

  var
  APort := Config( True ).ReadInteger( cCfgSecDatabase,
    cCfgKeyPort, 3050 );
  conMain.Port := APort;

  var
  AUserName := Config( True ).ReadString( cCfgSecDatabase,
    cCfgKeyUserName, 'SYSDBA' );
  conMain.UserName := AUserName;

  var
  ADBPwd := Config( True ).ReadString( cCfgSecDatabase,
    cCfgKeyPassword, 'masterkey' );
  conMain.Password := ADBPwd;

  var
  ADBName := Config( True ).ReadString( cCfgSecDatabase,
    cCfgKeyDatabase, EmptyStr );
  conMain.Database := ADBName;

  var
  ADBEncPwd := Config( True ).ReadString( cCfgSecDBEncrypt,
    cCfgKeyPassword, EmptyStr );
  encUsers.Password := ADBEncPwd;

end;

procedure TdmMain._OpenDatabase;
begin

  conMain.Open;

end;

procedure TdmMain._OpenTables;
begin

  tblGroupPerms.Open;
  tblGroups.Open;
  tblGroupUsers.Open;
  tblPermissions.Open;
  tblUserPerms.Open;
  tblUsers.Open;

end;

end.
