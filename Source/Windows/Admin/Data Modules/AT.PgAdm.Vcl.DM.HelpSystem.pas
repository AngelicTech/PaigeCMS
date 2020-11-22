unit AT.PgAdm.Vcl.DM.HelpSystem;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmHelpSystem = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  end;

var
  dmHelpSystem: TdmHelpSystem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  AT.PgAdm.ResourceStrings, AT.Vcl.Dialogs.SplashDX;

{$R *.dfm}

procedure TdmHelpSystem.DataModuleCreate(Sender: TObject);
begin
  TdlgSplashDX.ChangeStartMessage(rstrInitHelpSys, 100);


end;

end.
