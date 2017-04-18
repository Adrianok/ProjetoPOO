unit uClassMunicipio;

interface

uses
  System.SysUtils;

type
  TMunicipio = class
  private
    FIDMunicipio: Integer;
    FCodigoIBGE: Integer;
    FNome: String;
    FCEP: Currency;
    FDDD: Integer;

    procedure SetIDMunicipio(AValor: Integer);
    function GetIDMunicipio: Integer;

    procedure SetCodigoIBGE(AValor: Integer);
    function GetCodigoIBGE: Integer;

    procedure SetNome(AValor: String);
    function GetNome: String;

    procedure SetCEP(AValor: Currency);
    function GetCEP: Currency;

    procedure SetDDD(AValor: Integer);
    function GetDDD: Integer;

  public
    property IDMunicipio: Integer  read GetIDMunicipio  write SetIDMunicipio;
    property CodigoIBGE: Integer  read GetCodigoIBGE  write SetCodigoIBGE;
    property Nome: String  read GetNome  write SetNome;
    property CEP: Currency  read GetCEP  write SetCEP;
    property DDD: Integer  read GetDDD  write SetDDD;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TMunicipio }

constructor TMunicipio.Create;
begin
  FIDMunicipio := 0;
  FCodigoIBGE := 0;
  FNome := EmptyStr;
  FCEP := 0;
  FDDD := 0;
end;

destructor TMunicipio.Destroy;
begin

  inherited;
end;

function TMunicipio.GetCEP: Currency;
begin
  Result := FCEP;
end;

function TMunicipio.GetCodigoIBGE: Integer;
begin
  Result := FCodigoIBGE;
end;

function TMunicipio.GetDDD: Integer;
begin
  Result := FDDD;
end;

function TMunicipio.GetIDMunicipio: Integer;
begin
  Result := FIDMunicipio;
end;

function TMunicipio.GetNome: String;
begin
  Result := FNome;
end;

procedure TMunicipio.SetCEP(AValor: Currency);
begin
  FCEP := AValor;
end;

procedure TMunicipio.SetCodigoIBGE(AValor: Integer);
begin
  FCodigoIBGE := AValor;
end;

procedure TMunicipio.SetDDD(AValor: Integer);
begin
  FDDD := AValor;
end;

procedure TMunicipio.SetIDMunicipio(AValor: Integer);
begin
  FIDMunicipio := AValor;
end;

procedure TMunicipio.SetNome(AValor: String);
begin
  FNome := AValor;
end;

end.
