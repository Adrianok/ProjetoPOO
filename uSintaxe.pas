unit uSintaxe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  //Uses da unit da classe
  uClassCalculadora, Vcl.ExtCtrls;

type
  TfrmSintaxe = class(TForm)
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    GroupBox2: TGroupBox;
    EdtNumero1: TEdit;
    edtNumero2: TEdit;
    edtResultado: TEdit;
    rgOperacao: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure rgOperacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    oCalculadora : TCalculadora;
  public
    { Public declarations }
  end;

var
  frmSintaxe: TfrmSintaxe;

implementation

{$R *.dfm}

procedure TfrmSintaxe.Button1Click(Sender: TObject);
begin
  ShowMessage('Veja o arquivo uClassCalculadora.pas');
end;

procedure TfrmSintaxe.Button2Click(Sender: TObject);
begin
  ShowMessage('Uses uClassCalculadora');
end;

procedure TfrmSintaxe.Button3Click(Sender: TObject);
begin
  ShowMessage('oCalculadora : TCalculadora;');
end;

procedure TfrmSintaxe.Button4Click(Sender: TObject);
begin
  ShowMessage('oCalculadora := TCalculadora.Create;');
  oCalculadora := TCalculadora.Create;
end;

procedure TfrmSintaxe.Button5Click(Sender: TObject);
begin
  ShowMessage('FreeAndNil(oCalculadora);');
  FreeAndNil(oCalculadora);
end;

procedure TfrmSintaxe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Manda fechar o formulário
  action := cafree;
  //Limpa a variável da memória
  frmSintaxe := Nil;
end;

procedure TfrmSintaxe.rgOperacaoClick(Sender: TObject);
begin
  //Passa os valores para o objeto
  oCalculadora.Numero1 := edtNumero1.Text;
  oCalculadora.Numero2 := edtNumero2.Text;
  //Solicita o resultado
  case rgOperacao.ItemIndex of
    0: edtResultado.Text := oCalculadora.Resultado('Adicao');
    1: edtResultado.Text := oCalculadora.Resultado('Subtracao');
    2: edtResultado.Text := oCalculadora.Resultado('Multiplicacao');
    3: edtResultado.Text := oCalculadora.Resultado('Divisao');
  else
    ShowMessage('Operação inválida');
  end;
end;

end.
