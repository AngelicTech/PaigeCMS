unit AT.PgAdm.Config;

interface

uses
  AT.Config.Storage.Custom;


function Config(
  const AllUsers: Boolean = False): TATCustomConfigStorage;

implementation

uses
  System.SysUtils,
  AT.Config.Storage.SQLite3, AT.XPlatform.Folders, AT.PgAdm.Config.Consts,
  AT.PgAdm.Consts;


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
        AAllUsersCfg := TATConfigSQLite3Storage.Create(AFileName,
            '{82784200-678F-4A98-B5E1-82445E7095A1}',
            '{A8A99295-B166-4B80-BD3A-D3ABEF474706}'
          );


      //Return AllUsers Config object...
      Exit(AAllUsersCfg);
    end
  else
    begin //No, CurrentUser...
      //Does CurrentUser config exist?
      if (NOT Assigned(ACurrUserConfig)) then
        //No, create it...
        ACurrUserConfig := TATConfigSQLite3Storage.Create(AFileName,
            '{1BFA88D1-605A-46FB-B5EE-D279CB6BB157}',
            '{0216FEAA-EFFA-46BC-8A81-442563C2FCED}'
          );

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

