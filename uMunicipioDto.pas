unit uMunicipioDto;

interface

uses
  System.SysUtils, uEstadoDto;

type
  TMunicipioDto = class
  private
    FIdMunicipio: Integer;
    FDDD: Integer;
    FCodigoIbge: Integer;
    FCEP: Currency;
    FNome: String;
    FEstado: Integer;
    procedure SetCEP(const Value: Currency);
    procedure SetCodigoIbge(const Value: Integer);
    procedure SetDDD(const Value: Integer);
    procedure SetEstado(const Value: Integer);
    procedure SetIdMunicipio(const Value: Integer);
    procedure SetNome(const Value: String);
  public
    property IdMunicipio: Integer read FIdMunicipio write SetIdMunicipio;
    property CodigoIbge: Integer read FCodigoIbge write SetCodigoIbge;
    property Nome: String read FNome write SetNome;
    property CEP: Currency read FCEP write SetCEP;
    property DDD: Integer read FDDD write SetDDD;
    property Estado: Integer read FEstado write SetEstado;
  end;

implementation


{ TMunicipioDto }

procedure TMunicipioDto.SetCEP(const Value: Currency);
begin
  FCEP := Value;
end;

procedure TMunicipioDto.SetCodigoIbge(const Value: Integer);
begin
  FCodigoIbge := Value;
end;

procedure TMunicipioDto.SetDDD(const Value: Integer);
begin
  FDDD := Value;
end;

procedure TMunicipioDto.SetEstado(const Value: Integer);
begin
  FEstado := Value;
end;

procedure TMunicipioDto.SetIdMunicipio(const Value: Integer);
begin
  FIdMunicipio := Value;
end;

procedure TMunicipioDto.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
