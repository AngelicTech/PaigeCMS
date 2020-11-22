unit AT.Pg.Security.DEB.Events;

interface

uses
  EventBus;

type
  TEvtPerformLogin = class(TObject)
  end;

  TEvtPerformLogout = class(TObject)
  end;

  TEvtSetUserNameStatus = class(TObject)
  strict private
    FUserName: String;
  public
    constructor Create(const AUserName: String);
    property UserName: String read FUserName;
  end;

  TEvtShowMessage = class(TObject)
  strict private
    FMessage: String;
  public
    constructor Create(const AMessage: String);
    property &Message: String read FMessage;
  end;

  TEvtShowSecurityDialog = class(TObject)
  end;


implementation

{ TEvtSetUserNameStatus }

constructor TEvtSetUserNameStatus.Create(const AUserName: String);
begin
  FUserName := AUserName;
end;

{ TEvtShowMessage }

constructor TEvtShowMessage.Create(const AMessage: String);
begin
  FMessage := AMessage;
end;

end.
