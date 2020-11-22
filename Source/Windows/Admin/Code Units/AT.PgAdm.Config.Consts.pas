unit AT.PgAdm.Config.Consts;

interface

const
  cConfigFNFmt = '%sconfig.dat';
  cEmptyStr    = '';

  //Config sections...
  cCfgSecBrowser    = 'Web Browser';
  cCfgSecMainWin    = 'Window.Main';
  cCfgSecUI         = 'UI';

  //Config keys...
  cCfgKeyDefaultURL       = 'DefaultURL';
  cCfgKeyHeight           = 'Height';
  cCfgKeyInfoBarVisible   = 'InfoBarVisible';
  cCfgKeyLeft             = 'Left';
  cCfgKeyQATPosition      = 'QATPosition';
  cCfgKeyQATVisible       = 'QATVisible';
  cCfgKeySearchBarVisible = 'SearchBarVisible';
  cCfgKeySkinName         = 'SkinName';
  cCfgKeySkinPalette      = 'SkinPalette';
  cCfgKeyState            = 'State';
  cCfgKeyStatusBarVisible = 'StatusBarVisible';
  cCfgKeyTop              = 'Top';
  cCfgKeyTouchMode        = 'TouchMode';
  cCfgKeyWidth            = 'Width';
  cCfgKeyWinUseDefault    = 'WinUseDefault';

 //Config defaults...
 cCfgDefBrowserDefaultURL = 'https://angelictech.com';
 cCfgDefSkinName          = 'Office2019Colorful';
 cCfgDefSkinPalette       = 'Yale';
 cCfgDefTouchMode         = False;
 cCfgDefWinUseDefault     = True;

implementation

end.
