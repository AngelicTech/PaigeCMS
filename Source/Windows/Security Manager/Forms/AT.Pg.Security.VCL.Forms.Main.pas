unit AT.Pg.Security.VCL.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ActnList,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  cxClasses, cxControls,
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
  dxBar, dxStatusBar,
  AT.Pg.Security.DEB.Events,
  EventBus, AT.Pg.Security.Vcl.DM.Main;

type
  TfrmMain = class( TForm )
    actEditSecurity: TAction;
    actLogin: TAction;
    actLogout: TAction;
    alstMain: TActionList;
    barmgrMain: TdxBarManager;
    barmgrMainBar1: TdxBar;
    cmdEditSecurity: TdxBarLargeButton;
    cmdLogin: TdxBarLargeButton;
    cmdLogout: TdxBarLargeButton;
    sbMain: TdxStatusBar;
    procedure ExecuteEditSecurityAction( Sender: TObject );
    procedure ExecuteLoginAction( Sender: TObject );
    procedure ExecuteLogoutAction( Sender: TObject );
    procedure FormShow( Sender: TObject );
    procedure UpdateEditSecurityAction( Sender: TObject );
    procedure UpdateLoginAction( Sender: TObject );
    procedure UpdateLogoutAction( Sender: TObject );
  public
    constructor Create(AOwner: TComponent); override;
    [Subscribe(TThreadMode.Main)]
    procedure OnSetUserNameStatus(AEvent: TEvtSetUserNameStatus);
    [Subscribe(TThreadMode.Main)]
    procedure OnShowMessage(AEvent: TEvtShowMessage);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  AT.Rtti;

constructor TfrmMain.Create(AOwner: TComponent);
begin

  inherited;

  GlobalEventBus.RegisterSubscriber(Self);

end;

procedure TfrmMain.ExecuteEditSecurityAction( Sender: TObject );
begin

  GlobalEventBus.Post(TEvtShowSecurityDialog.Create);

end;

procedure TfrmMain.ExecuteLoginAction( Sender: TObject );
begin

  GlobalEventBus.Post(TEvtPerformLogin.Create);

end;

procedure TfrmMain.ExecuteLogoutAction( Sender: TObject );
begin

  GlobalEventBus.Post(TEvtPerformLogout.Create);

end;

procedure TfrmMain.FormShow( Sender: TObject );
begin

  if( NOT dmMain.LoggedIn )then
    actLogin.Execute;

end;

procedure TfrmMain.OnSetUserNameStatus(AEvent: TEvtSetUserNameStatus);
begin

  sbMain.Panels[ 0 ].Text := AEvent.UserName;

  AEvent.Free;

end;

procedure TfrmMain.OnShowMessage(AEvent: TEvtShowMessage);
begin

  ShowMessage(AEvent.Message);

  AEvent.Free;

end;

procedure TfrmMain.UpdateEditSecurityAction( Sender: TObject );
begin

  var AIsLoggedIn := dmMain.LoggedIn ;

  if( NOT AIsLoggedIn )then
    begin

      SetPropertyValue( Sender, 'Enabled', False );
      SetPropertyValue( Sender, 'Visible', False );

      exit;

    end;

  var AIsSuperUser := dmMain.HasPermission( 'SuperUser' );
  var AIsSecAdmin := dmMain.HasPermission( 'SecurityAdmin' );

  var AVisible :=( AIsSuperUser OR AIsSecAdmin );

  SetPropertyValue( Sender, 'Enabled', AVisible );
  SetPropertyValue( Sender, 'Visible', AVisible );

end;

procedure TfrmMain.UpdateLoginAction( Sender: TObject );
begin

  var ALoggedIn := dmMain.LoggedIn;
  var AValue :=( NOT ALoggedIn );

  SetPropertyValue( Sender, 'Visible', AValue );

end;

procedure TfrmMain.UpdateLogoutAction( Sender: TObject );
begin

  var ALoggedIn := dmMain.LoggedIn;

  SetPropertyValue( Sender, 'Visible', ALoggedIn );

end;

end.
