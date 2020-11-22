unit AT.PgAdm.Attributes;

interface

uses
  Vcl.Forms,
  AT.PgAdm.Types;

type
  TATFormSingleInstanceAttribute = class(TCustomAttribute)
  strict private
    FIsSingleInstance: Boolean;
  public
    constructor Create(AIsSingleInstance: Boolean = False);
    property IsSingleInstance: Boolean read FIsSingleInstance write FIsSingleInstance;
  end;

  TATFormTypeAttribute = class(TCustomAttribute)
  strict private
    FFormType: TATFormTypeEnum;
  public
    constructor Create(AFormType: TATFormTypeEnum);
    property FormType: TATFormTypeEnum read FFormType write FFormType;
  end;


function GetFormSingleInstanceAttrValue(AForm: TForm): Boolean; overload;
function GetFormSingleInstanceAttrValue(AFormClass: TFormClass): Boolean; overload;
function GetFormSingleInstanceAttrValue(AClassInfo: Pointer): Boolean; overload;
function GetFormTypeAttrValue(AForm: TForm): TATFormTypeEnum;

implementation

uses
  System.Rtti,
  AT.Automate, AT.Rtti.Automate;

function GetFormSingleInstanceAttrValue(AForm: TForm): Boolean;
begin

  //Get rtti context...
  var AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  var AType := AContext.GetType(AForm.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //Exit, return unspecified...
      Exit(False);
    end;

  var AAttribs := AType.GetAttributes;

  Result := False;

  for var AAttrib in AAttribs do
    begin

      if (AAttrib IS TATFormSingleInstanceAttribute) then
        begin

          var AFTAttrib := (AAttrib AS TATFormSingleInstanceAttribute);

          exit(AFTAttrib.IsSingleInstance);

        end;

    end;

end;

function GetFormSingleInstanceAttrValue(AFormClass: TFormClass): Boolean;
begin

  //Get rtti context...
  var AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  var AType := AContext.GetType(AFormClass.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //Exit, return unspecified...
      Exit(False);
    end;

  var AAttribs := AType.GetAttributes;

  Result := False;

  for var AAttrib in AAttribs do
    begin

      if (AAttrib IS TATFormSingleInstanceAttribute) then
        begin

          var AFTAttrib := (AAttrib AS TATFormSingleInstanceAttribute);

          exit(AFTAttrib.IsSingleInstance);

        end;

    end;

end;

function GetFormSingleInstanceAttrValue(AClassInfo: Pointer): Boolean;
begin

  //Get rtti context...
  var AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  var AType := AContext.GetType(AClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //Exit, return unspecified...
      Exit(False);
    end;

  var AAttribs := AType.GetAttributes;

  Result := False;

  for var AAttrib in AAttribs do
    begin

      if (AAttrib IS TATFormSingleInstanceAttribute) then
        begin

          var AFTAttrib := (AAttrib AS TATFormSingleInstanceAttribute);

          exit(AFTAttrib.IsSingleInstance);

        end;

    end;

end;

function GetFormTypeAttrValue(AForm: TForm): TATFormTypeEnum;
begin

  //Get rtti context...
  var AContext := TRttiContext.Create;
  var ACtxAutoFree := TATRttiAutoFreeCtx.Create(AContext);

  //Attempt to use rtti...
  //Try to get the type info for AObject...
  var AType := AContext.GetType(AForm.ClassInfo);

  //Did we get type info for AObject???
  if (NOT Assigned(AType)) then
    begin
      //Exit, return unspecified...
      Exit(TATFormTypeEnum.fteUnspecified);
    end;

  var AAttribs := AType.GetAttributes;

  Result := TATFormTypeEnum.fteUnspecified;

  for var AAttrib in AAttribs do
    begin

      if (AAttrib IS TATFormTypeAttribute) then
        begin

          var AFTAttrib := (AAttrib AS TATFormTypeAttribute);

          exit(AFTAttrib.FormType);

        end;

    end;

end;

{ TATFormSingleInstanceAttribute }

constructor TATFormSingleInstanceAttribute.Create(
  AIsSingleInstance: Boolean);
begin
  FIsSingleInstance := AIsSingleInstance;
end;

{ TATFormTypeAttribute }

constructor TATFormTypeAttribute.Create(AFormType: TATFormTypeEnum);
begin
  FFormType := AFormType;
end;

end.
