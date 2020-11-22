program PgSecurity;

uses
  Vcl.Forms,
  AT.Pg.Security.VCL.Forms.Main in 'Forms\AT.Pg.Security.VCL.Forms.Main.pas' {frmMain},
  AT.Pg.Security.Config in 'Code Units\AT.Pg.Security.Config.pas',
  AT.Pg.Security.Config.Consts in 'Code Units\AT.Pg.Security.Config.Consts.pas',
  AT.Pg.Security.Consts in 'Code Units\AT.Pg.Security.Consts.pas',
  AT.Pg.Security.Vcl.DM.Main in 'Data Modules\AT.Pg.Security.Vcl.DM.Main.pas' {dmMain: TDataModule},
  AT.Pg.Security.DEB.Events in 'Code Units\AT.Pg.Security.DEB.Events.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
