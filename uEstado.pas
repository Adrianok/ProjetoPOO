unit uEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, uEstadoControler, uEstadoDto, Vcl.ComCtrls,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Data.DBXDBReaders, Data.DBXCommon, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmEstado = class(TfrmBaseCadastro)
    edtUF: TLabeledEdit;
    edtNome: TLabeledEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtUFExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    oControlerEstado: TEstadoControler;

    oEstado: TEstadoDto;
  public
    { Public declarations }
  end;

var
  frmEstado: TfrmEstado;

implementation

{$R *.dfm}

procedure TfrmEstado.btnExcluirClick(Sender: TObject);
begin
  inherited;
  oControlerEstado.Excluir(oEstado);
end;

procedure TfrmEstado.btnFecharClick(Sender: TObject);
begin
  inherited;
  frmEstado := nil;
end;

procedure TfrmEstado.btnSalvarClick(Sender: TObject);
begin
  inherited;

  oEstado.UF := edtUF.Text;
  oEstado.Nome := edtNome.Text;

  oControlerEstado.Salvar(oEstado)
end;

procedure TfrmEstado.edtUFExit(Sender: TObject);
begin
  inherited;
  oControlerEstado.Limpar(oEstado);
  oEstado.UF := edtUF.Text;

  if oControlerEstado.Buscar(oEstado) then
    edtNome.Text := oEstado.Nome;
end;

procedure TfrmEstado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if Assigned(oControlerEstado) then
    FreeAndNil(oControlerEstado);

  if Assigned(oEstado) then
    FreeAndNil(oEstado);

  frmEstado := nil;
end;

// TMyClass = class(TComponent)private
{ private declarations }
// protected
{ protected declarations }
// public
{ public declarations }
// published
{ published declarations }
// end;

procedure TfrmEstado.FormCreate(Sender: TObject);
begin
  inherited;

  oEstado := TEstadoDto.Create;
  oControlerEstado := TEstadoControler.Create;

  oControlerEstado.Limpar(oEstado);

  DBGrid1.DataSource := oControlerEstado.BuscarEstados;
end;

end.
