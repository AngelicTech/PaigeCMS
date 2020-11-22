unit AT.PgAdm.Vcl.DM.InetSystem;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmInetSystem = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  end;



var
  dmInetSystem: TdmInetSystem;

implementation

uses
  Winapi.Windows,
  Vcl.Forms,
  AT.PgAdm.ResourceStrings, AT.Vcl.Dialogs.SplashDX, AT.PgAdm.Inet.Consts;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmInetSystem.DataModuleCreate(Sender: TObject);
begin
  TdlgSplashDX.ChangeStartMessage(rstrInitInetSys, 100);


end;

end.
