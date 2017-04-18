unit uMunicipioControler;

interface

uses
  Vcl.StdCtrls, System.Generics.Collections, uListaEstados, uEstadoDTO,
  System.SysUtils,
  uEstadoModel, uMunicipioDTO, uMunicipioModel;

type
  TMunicipioControler = class
  private
    oMunicipioModel: TMunicipioModel;
  public
    procedure Limpar(out AMunicipioDTO: TMunicipioDTO);
    procedure ListaEstados(ACmbEstados: TComboBox);
    function Ler(var AMunicipioDTO: TMunicipioDTO): Boolean;
    function Salvar(const AMunicipioDTO: TMunicipioDTO): Boolean;
    function Deletar(const AIDMunicipio: Integer): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TMunicipioControler }

function TMunicipioControler.Ler(var AMunicipioDTO: TMunicipioDTO): Boolean;
begin
  Result := False;
  if AMunicipioDTO.IdMunicipio > 0 then
    Result := oMunicipioModel.Ler(AMunicipioDTO);
end;

constructor TMunicipioControler.Create;
begin
  oMunicipioModel := TMunicipioModel.Create;
end;

destructor TMunicipioControler.Destroy;
begin
  if Assigned(oMunicipioModel) then
    FreeAndNil(oMunicipioModel);
  inherited;
end;

function TMunicipioControler.Deletar(const AIDMunicipio: Integer): Boolean;
begin
  Result := False;
  if (AIDMunicipio > 0) then
    Result := oMunicipioModel.Deletar(AIDMunicipio);
end;

procedure TMunicipioControler.Limpar(out AMunicipioDTO: TMunicipioDTO);
begin
  AMunicipioDTO.IdMunicipio := 0;
  AMunicipioDTO.CodigoIbge := 0;
  AMunicipioDTO.Nome := EmptyStr;
  AMunicipioDTO.CEP := 0;
  AMunicipioDTO.DDD := 0;
  AMunicipioDTO.Estado := 0;
end;

procedure TMunicipioControler.ListaEstados(ACmbEstados: TComboBox);
var
  oListaEstados: TListaEstados;
  oEstadoModel: TEstadoModel;
  oEstadoDTO: TEstadoDTO;
begin
  ACmbEstados.Items.Clear;
  oEstadoModel := TEstadoModel.Create;
  try
    oListaEstados := TListaEstados.Create([doOwnsValues]);

    if oEstadoModel.BuscarListaEstados(oListaEstados) then
    begin
      for oEstadoDTO in oListaEstados.Values do
        ACmbEstados.Items.AddObject(oEstadoDTO.Nome, TObject(oEstadoDTO.ID));
    end;
  finally
    // if Assigned(oEstadoDTO) then
    // oEstadoDTO.Free;

    if Assigned(oEstadoModel) then
      oEstadoModel.Free;

    if Assigned(oListaEstados) then
      oListaEstados.Free;
  end;
end;

function TMunicipioControler.Salvar(const AMunicipioDTO: TMunicipioDTO)
  : Boolean;
begin
  // Validar os campos
  if AMunicipioDTO.IdMunicipio > 0 then
    Result := oMunicipioModel.Alterar(AMunicipioDTO)
  else
  begin
    AMunicipioDTO.IdMunicipio := oMunicipioModel.BuscarID;

    Result := oMunicipioModel.Inserir(AMunicipioDTO);
  end;
end;

end.
