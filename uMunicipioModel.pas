unit uMunicipioModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, FireDAC.DApt, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, uClassConexaoSingleton, uMunicipioDto, uEstadoModel;

type
  TMunicipioModel = class

  public
    function BuscarID: Integer;
    function Alterar(const AMunicipioDTO: TMunicipioDto): Boolean;
    function Inserir(const AMunicipioDTO: TMunicipioDto): Boolean;
    function Deletar(const AIDMunicipio: Integer): Boolean;
    function Ler(var AMunicipioDTO: TMunicipioDto): Boolean;
  end;

implementation

{ TMunicipioModel }

function TMunicipioModel.Alterar(const AMunicipioDTO: TMunicipioDto): Boolean;
var
  sSql: String;
begin
  sSql := 'update Municipio'+
          '   set CodigoIBGE = '+ IntToStr(AMunicipioDTO.CodigoIbge)+
          '     , Nome = '+ QuotedStr(AMunicipioDTO.Nome) +
	        '     , CEP = '+ CurrToStr(AMunicipioDTO.CEP)+
         	'     , DDD = '+ IntToStr(AMunicipioDTO.DDD)+
          '     , IDEstado = '+ IntToStr(AMunicipioDTO.Estado)+
          ' where IDMunicipio = '+ IntToStr(AMunicipioDTO.IdMunicipio);

  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TMunicipioModel.Ler(var AMunicipioDTO: TMunicipioDto): Boolean;
var
  oQuery: TFDQuery;
  oEstadoModel: TEstadoModel;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('select CodigoIBGE, Nome, CEP, DDD, IDEstado'+
                '  from Municipio'+
                ' where IDMunicipio = '+IntToStr(AMunicipioDTO.IdMunicipio));
    if (not(oQuery.IsEmpty)) then
    begin
      AMunicipioDTO.CodigoIbge := oQuery.FieldByName('CodigoIBGE').AsInteger;
      AMunicipioDTO.Nome := oQuery.FieldByName('Nome').AsString;
      AMunicipioDTO.CEP := oQuery.FieldByName('CEP').AsCurrency;
      AMunicipioDTO.DDD := oQuery.FieldByName('DDD').AsInteger;
      AMunicipioDTO.Estado := oQuery.FieldByName('IDEstado').AsInteger;

      Result := True;
    end;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

function TMunicipioModel.BuscarID: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('select max(idMunicipio) as ID from Municipio');
    if (not(oQuery.IsEmpty)) then
      Result := oQuery.FieldByName('ID').AsInteger + 1;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

function TMunicipioModel.Deletar(const AIDMunicipio: Integer): Boolean;
begin
  Result := TConexaoSingleton.GetInstancia.ExecSQL(
    'delete from Municipio where idMunicipio = '+IntToStr(AIDMunicipio)) > 0;
end;

function TMunicipioModel.Inserir(const AMunicipioDTO: TMunicipioDto): Boolean;
var
  sSql: String;
begin
  sSql := 'insert into Municipio (CodigoIBGE, Nome, CEP, DDD, IDEstado, IDMunicipio)'+
          ' values ('+ IntToStr(AMunicipioDTO.CodigoIbge)+
          '     , '+ QuotedStr(AMunicipioDTO.Nome) +
	        '     , '+ CurrToStr(AMunicipioDTO.CEP)+
         	'     , '+ IntToStr(AMunicipioDTO.DDD)+
          '     , '+ IntToStr(AMunicipioDTO.Estado)+
          '     , '+ IntToStr(AMunicipioDTO.IdMunicipio)+')';

  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

end.
