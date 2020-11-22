unit AT.Pg.Security.Config;

interface

uses
  AT.Config.Storage.Custom;


function Config(
  const AllUsers: Boolean = False): TATCustomConfigStorage;

implementation

uses
  System.SysUtils,
  AT.Config.Storage.INI, AT.XPlatform.Folders, AT.Pg.Security.Config.Consts,
  AT.Pg.Security.Consts;


var
  AAllUsersCfg: TATCustomConfigStorage;     //All users config...
  ACurrUserConfig: TATCustomConfigStorage;  //Current user config...


//Calculates the filename for the config...
function CfgFilename(AllUsers: Boolean = False): String;
var
  AFN: String;
begin
  //Get appdata folder.
  //AllUsers determines if all user's or current user...
  AFN := AT.XPlatform.Folders.GetAppDataDirectory(cAppDataFolder,
    AllUsers);

  //Ensure trailing path delimiter is included...
  AFN := IncludeTrailingPathDelimiter(AFN);

  //Calculate actual config filename...
  AFN := Format(cConfigFNFmt, [AFN]);

  //Return filename...
  Result := AFN;
end;

//Returns a config object depending on AllUsers parameter...
function Config(
  const AllUsers: Boolean = False): TATCustomConfigStorage;
var
  AFileName: String;
begin
  AFileName := CfgFilename(AllUsers);   //Calculate filename...

  //Requesting AllUsers config???
  if (AllUsers) then
    begin //Yes, AllUsers...
      //Does AllUsers config exist?
      if (NOT Assigned(AAllUsersCfg)) then
        //No, create it...
        AAllUsersCfg := TATConfigIniStorage.Create(AFileName);


      //Return AllUsers Config object...
      Exit(AAllUsersCfg);
    end
  else
    begin //No, CurrentUser...
      //Does CurrentUser config exist?
      if (NOT Assigned(ACurrUserConfig)) then
        //No, create it...
        ACurrUserConfig := TATConfigIniStorage.Create(AFileName);

      //Return CurrentUser config object...
      Result := ACurrUserConfig;
    end;
end;



initialization

finalization
  //Free config objects...
  FreeAndNil(AAllUsersCfg);     //AllUsers...
  FreeAndNil(ACurrUserConfig);  //CurrentUser...
end.
