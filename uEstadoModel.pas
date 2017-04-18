//Banco de dados
unit uEstadoModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, FireDAC.DApt, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, uListaEstados,
  uEstadoDto, uClassConexaoSingleton;

type
  TEstadoModel = class
  public
    function BuscarEstados: TDataSource;

    function BuscarListaEstados(out ALista: TListaEstados): Boolean;

    function Ler(var AEstado: TEstadoDto): Boolean;

    function Inserir(var AEstado: TEstadoDto): Boolean;

    function Alterar(var AEstado: TEstadoDto): Boolean;

    function Deletar(const AIDUF: Integer): Boolean;

    function BuscarID: Integer;
  end;

implementation

{ TEstadoModel }

function TEstadoModel.Alterar(var AEstado: TEstadoDto): Boolean;
var
  sSql: String;
begin
  sSql := 'update Estado'+
          '   set UF = '+QuotedStr(AEstado.UF)+
          '     , Nome = '+QuotedStr(AEstado.Nome)+
          ' where idEstado = '+IntToStr(AEstado.ID);

  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TEstadoModel.BuscarEstados: TDataSource;
var
  oQuery: TFDQuery;
begin
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('select UF, NOME from Estado');
    if (not(oQuery.IsEmpty)) then
      Result := oQuery.DataSource;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;


function TEstadoModel.BuscarID: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('select max(idEstado) as ID'+
                '  from Estado');
    if (not(oQuery.IsEmpty)) then
      Result := oQuery.FieldByName('ID').AsInteger + 1;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;


function TEstadoModel.BuscarListaEstados(out ALista: TListaEstados): Boolean;
var
  oEstadoDTO: TEstadoDTO;
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
    oQuery.Open('select IdEstado, UF, NOME from Estado');
    if (not(oQuery.IsEmpty)) then
    begin
      oQuery.First;
      while (not(oQuery.Eof)) do
      begin
        oEstadoDTO := TEstadoDto.Create;
        oEstadoDTO.ID := oQuery.FieldByName('IdEstado').AsInteger;
        oEstadoDTO.Nome := oQuery.FieldByName('Nome').AsString;
        oEstadoDTO.UF := oQuery.FieldByName('UF').AsString;

        ALista.Add(oEstadoDTO.Nome, oEstadoDTO);

        oQuery.Next;
      end;
      Result := True;
    end;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;



function TEstadoModel.Deletar(const AIDUF: Integer): Boolean;
begin
  Result := TConexaoSingleton.GetInstancia.ExecSQL(
    'delete from Estado where idEstado = '+IntToStr(AIDUF)) > 0;
end;

function TEstadoModel.Inserir(var AEstado: TEstadoDto): Boolean;
var
  sSql: String;
begin
  sSql := 'insert into Estado (idEstado,'+
          '                    UF,'+
          '                    Nome) values ('+
          IntToStr(AEstado.ID)+', '+
          QuotedStr(AEstado.UF)+', '+
          QuotedStr(AEstado.Nome)+')';

  Result := TConexaoSingleton.GetInstancia.ExecSQL(sSql) > 0;
end;

function TEstadoModel.Ler(var AEstado: TEstadoDto): Boolean;
var
  oQuery: TFDQuery;
begin
  Result := False;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TConexaoSingleton.GetInstancia;
//  oQuery.Open('select idEstado, Nome from Estado where UF = '''+AEstado.UF+'''');
    oQuery.Open('select idEstado, Nome'+
                '  from Estado'+
                ' where UF = '+QuotedStr(AEstado.UF));
    if (not(oQuery.IsEmpty)) then
    begin
      AEstado.ID := oQuery.FieldByName('idEstado').AsInteger;
      AEstado.Nome := oQuery.FieldByName('Nome').AsString;

      Result := True;
    end;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

end.
