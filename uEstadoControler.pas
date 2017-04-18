//Validação
unit uEstadoControler;

interface

uses
  System.SysUtils, Data.DB, uEstadoDto, uEstadoModel;

type
  TEstadoControler = class
  private
    oModelEstado: TEstadoModel;

  public
    function BuscarEstados: TDataSource;
    function Buscar(var AEstado: TEstadoDto): Boolean;
    function Excluir(var AEstado: TEstadoDto): Boolean;
    function Salvar(var AEstado: TEstadoDto): Boolean;
    procedure Limpar(var AEstado: TEstadoDto);

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEstadoControler }

function TEstadoControler.Buscar(var AEstado: TEstadoDto): Boolean;
begin
  Result := False;
  //EmptyStr = '';
  if (trim(AEstado.UF) <> EmptyStr) then
    Result := oModelEstado.Ler(AEstado);
end;

function TEstadoControler.Excluir(var AEstado: TEstadoDto): Boolean;
begin
  Result := False;
  //EmptyStr = '';
  if AEstado.ID > 0 then
    Result := oModelEstado.Deletar(AEstado.ID);
end;

function TEstadoControler.BuscarEstados: TDataSource;
begin
  Result := oModelEstado.BuscarEstados;
end;

constructor TEstadoControler.Create;
begin
  oModelEstado := TEstadoModel.Create;
end;

destructor TEstadoControler.Destroy;
begin
  if Assigned(oModelEstado) then
    FreeAndNil(oModelEstado);

  inherited;
end;

procedure TEstadoControler.Limpar(var AEstado: TEstadoDto);
begin
  AEstado.ID := 0;
  AEstado.UF := EmptyStr;
  AEstado.Nome := EmptyStr;
end;

function TEstadoControler.Salvar(var AEstado: TEstadoDto): Boolean;
begin
  Result := False;

  if AEstado.ID > 0 then
    Result := oModelEstado.Alterar(AEstado)
  else
  begin
    AEstado.ID := oModelEstado.BuscarID;

    Result := oModelEstado.Inserir(AEstado);
  end;
end;

end.
