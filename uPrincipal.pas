unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, uClassConexaoSingleton;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    SintaxeBsica1: TMenuItem;
    Cadastro1: TMenuItem;
    Estado1: TMenuItem;
    Municipio1: TMenuItem;
    Usurio1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure SintaxeBsica1Click(Sender: TObject);
    procedure Municipio1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uSintaxe, uEstado, uMunicipio, uUsuario;

{$R *.dfm}

procedure TfrmPrincipal.Estado1Click(Sender: TObject);
begin
  // Verifica se a variável do formulário foi instanciada
  if (not(Assigned(frmEstado))) then
    frmEstado := TfrmEstado.Create(Self);
  // Manda mostrar o formulário
  frmEstado.Show;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(frmMunicipio) then
    frmMunicipio.Close;

    if Assigned(frmEstado) then
    frmEstado.Close;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  // Quando True verifica se ocorreu vazamento de memória ao fechar o programa
  ReportMemoryLeaksOnShutdown := True;

  // Cria a conexão com o banco de dados
  try
    TConexaoSingleton.GetInstancia;
  except
    ShowMessage('Erro ao conectar com o banco de dados.');
    // Manda encerrar a aplicação
    Application.Terminate;
    exit;
  end;
end;

procedure TfrmPrincipal.Municipio1Click(Sender: TObject);
begin
  // Verifica se a variável do formulário foi instanciada
  if (not(Assigned(frmMunicipio))) then
    frmMunicipio := TfrmMunicipio.Create(Self);
  // Manda mostrar o formulário
  frmMunicipio.Show;
end;

procedure TfrmPrincipal.SintaxeBsica1Click(Sender: TObject);
begin
  // Verifica se a variável do formulário foi instanciada
  if (not(Assigned(frmSintaxe))) then
    frmSintaxe := TfrmSintaxe.Create(Self);
  // Manda mostrar o formulário
  frmSintaxe.Show;
end;

procedure TfrmPrincipal.Usurio1Click(Sender: TObject);
begin
  // Verifica se a variável do formulário foi instanciada
  if (not(Assigned(frmUsuario))) then
    frmUsuario := TfrmUsuario.Create(Self);
  // Manda mostrar o formulário
  frmUsuario.Show;
end;

end.
