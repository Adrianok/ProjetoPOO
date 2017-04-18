unit uMunicipio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, uMunicipioDTO, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, uMunicipioControler, uEstadoDTO;

type
  TfrmMunicipio = class(TfrmBaseCadastro)
    edtID: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCodigoIbge: TLabeledEdit;
    EdtCep: TLabeledEdit;
    cmbEstado: TComboBox;
    Label1: TLabel;
    EdtDDD: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtIDExit(Sender: TObject);
  private
    { Private declarations }
    oMunicipio: TMunicipioDTO;
    oMunicipioControler: TMunicipioControler;
  public
    { Public declarations }
    destructor Destroy;
  end;

var
  frmMunicipio: TfrmMunicipio;

implementation

{$R *.dfm}

procedure TfrmMunicipio.btnExcluirClick(Sender: TObject);
begin
  oMunicipioControler.Deletar(oMunicipio.IdMunicipio);
  inherited;
end;

procedure TfrmMunicipio.btnSalvarClick(Sender: TObject);
begin
  oMunicipio.CodigoIbge := StrToIntDef(edtCodigoIbge.Text, 0);
  oMunicipio.CEP := StrToCurrDef(EdtCep.Text, 0);
  oMunicipio.DDD := StrToIntDef(EdtDDD.Text, 0);
  oMunicipio.Nome := edtNome.Text;
  oMunicipio.Estado := Integer(cmbEstado.Items.Objects[cmbEstado.ItemIndex]);

  oMunicipioControler.Salvar(oMunicipio);
  inherited;
end;

destructor TfrmMunicipio.Destroy;
begin


end;

procedure TfrmMunicipio.edtIDExit(Sender: TObject);
begin
  inherited;
  oMunicipioControler.Limpar(oMunicipio);
  oMunicipio.IdMunicipio := StrToIntDef(edtID.Text, 0);

  if oMunicipioControler.Ler(oMunicipio) then
  begin
    edtCodigoIbge.Text := IntToStr(oMunicipio.CodigoIbge);
    EdtCep.Text := CurrToStr(oMunicipio.CEP);
    EdtDDD.Text := IntToStr(oMunicipio.DDD);
    edtNome.Text := oMunicipio.Nome;

    cmbEstado.ItemIndex := cmbEstado.Items.IndexOfObject(TObject(oMunicipio.Estado));
  end;
end;

procedure TfrmMunicipio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(oMunicipio) then
    FreeAndNil(oMunicipio);
 if Assigned(oMunicipioControler) then
    FreeAndNil(oMunicipioControler);

  frmMunicipio := nil;

  inherited;
end;

procedure TfrmMunicipio.FormCreate(Sender: TObject);
begin
  inherited;

  oMunicipio := TMunicipioDTO.Create;
  oMunicipioControler:= TMunicipioControler.Create;
  oMunicipioControler.ListaEstados(cmbEstado);
end;

end.
