unit uBaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmBaseCadastro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure LimparFormulario;
  public
    { Public declarations }
  end;

var
  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

procedure TfrmBaseCadastro.btnExcluirClick(Sender: TObject);
begin
  LimparFormulario;
end;

procedure TfrmBaseCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaseCadastro.btnSalvarClick(Sender: TObject);
begin
  LimparFormulario;
end;

procedure TfrmBaseCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBaseCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { Tecla Enter }
  begin
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmBaseCadastro.LimparFormulario;
var
  iIndiceComponente: Integer;
begin
  for iIndiceComponente := 0 to pred(Self.ComponentCount) do
  begin
    if (Components[iIndiceComponente] is TLabeledEdit) or
      (Components[iIndiceComponente] is TEdit) then
      (Components[iIndiceComponente] as TCustomEdit).Clear;

    if (Components[iIndiceComponente] is TComboBox) then
      (Components[iIndiceComponente] as TComboBox).ItemIndex := -1;
  end;
end;

end.
