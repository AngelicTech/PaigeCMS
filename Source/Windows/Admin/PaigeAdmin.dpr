program PaigeAdmin;

uses
  System.SysUtils,
  Winapi.Windows,
  Vcl.Forms,
  AT.PgAdm.Vcl.Forms.Main in 'Forms\AT.PgAdm.Vcl.Forms.Main.pas' {frmMain},
  AT.PgAdm.Vcl.Forms.BaseChild in 'Forms\AT.PgAdm.Vcl.Forms.BaseChild.pas' {frmBaseChild},
  AT.PgAdm.Vcl.DM.Main in 'Data Modules\AT.PgAdm.Vcl.DM.Main.pas' {dmMain: TDataModule},
  AT.PgAdm.Interfaces in 'Code Units\AT.PgAdm.Interfaces.pas',
  AT.PgAdm.Vcl.Forms.PagesChild in 'Forms\AT.PgAdm.Vcl.Forms.PagesChild.pas' {frmPagesChild},
  AT.PgAdm.DEB.Events in 'Code Units\AT.PgAdm.DEB.Events.pas',
  AT.PgAdm.Vcl.DM.Images in 'Data Modules\AT.PgAdm.Vcl.DM.Images.pas' {dmImages: TDataModule},
  AT.PgAdm.Props.Consts in 'Code Units\AT.PgAdm.Props.Consts.pas',
  AT.Vcl.Automate in 'D:\Components\RS27\AngelicTech\Source\VCL\AT.Vcl.Automate.pas',
  AT.Automate in 'D:\Components\RS27\AngelicTech\Source\Common\AT.Automate.pas',
  AT.PgAdm.Consts in 'Code Units\AT.PgAdm.Consts.pas',
  AT.Vcl.Dialogs.SplashDX in 'D:\Components\RS27\AngelicTech\Source\VCL\AT.Vcl.Dialogs.SplashDX.pas' {dlgSplashDX},
  AT.PgAdm.ResourceStrings in 'Code Units\AT.PgAdm.ResourceStrings.pas',
  AT.PgAdm.Config.Consts in 'Code Units\AT.PgAdm.Config.Consts.pas',
  AT.PgAdm.Config in 'Code Units\AT.PgAdm.Config.pas',
  AT.PgAdm.UI.Types in 'Code Units\AT.PgAdm.UI.Types.pas',
  AT.PgAdm.Vcl.DM.HelpSystem in 'Data Modules\AT.PgAdm.Vcl.DM.HelpSystem.pas' {dmHelpSystem: TDataModule},
  AT.PgAdm.Vcl.DM.InetSystem in 'Data Modules\AT.PgAdm.Vcl.DM.InetSystem.pas' {dmInetSystem: TDataModule},
  AT.PgAdm.Inet.Consts in 'Code Units\AT.PgAdm.Inet.Consts.pas',
  AT.PgAdm.Inet.ResourceStrings in 'Code Units\AT.PgAdm.Inet.ResourceStrings.pas',
  AT.PgAdm.Vcl.Dialogs.Base in 'Forms\AT.PgAdm.Vcl.Dialogs.Base.pas' {dlgBase},
  AT.PgAdm.Vcl.Forms.BaseClosableChild in 'Forms\AT.PgAdm.Vcl.Forms.BaseClosableChild.pas' {frmBaseClosableChild},
  AT.PgAdm.Attributes in 'Code Units\AT.PgAdm.Attributes.pas',
  AT.PgAdm.Types in 'Code Units\AT.PgAdm.Types.pas',
  AT.PgAdm.Vcl.Forms.BaseNonClosingChild in 'Forms\AT.PgAdm.Vcl.Forms.BaseNonClosingChild.pas' {frmBaseNonClosingChild},
  AT.Rtti.Automate in 'D:\Components\RS27\AngelicTech\Source\Common\AT.Rtti.Automate.pas',
  AT.PgAdm.Vcl.Forms.Child.Home in 'Forms\AT.PgAdm.Vcl.Forms.Child.Home.pas' {frmChildHome};

{$R *.res}

begin

  Application.Initialize;

  Application.MainFormOnTaskbar := True;
  Application.Title := rstrAppTitle;

  TdlgSplashDX.ShowSplash( smSplash, sbcBlue );
  TdlgSplashDX.ChangeStartMessage(
    Format(rstrInitApp, [Application.Title]), 100);

  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TdmInetSystem, dmInetSystem);
  Application.CreateForm(TdmHelpSystem, dmHelpSystem);

  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmChildHome, frmChildHome);

  Application.Run;

end.
