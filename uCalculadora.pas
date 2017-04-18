unit uCalculadora;

interface

uses
  System.SysUtils;

type
  //Nome da classe
  TCalculadora = class
  private
    //Variáveis que irão armazenar os valores das propriedades
    FNumero1: Currency;
    FNumero2: Currency;

    //Procedimentos e funções responsáveis por armazenar e
    //buscar os dados para a propriedade
    function GetNumero1: String;
    procedure SetNumero1(ANumero1: String);

    function GetNumero2: String;
    procedure SetNumero2(ANumero2: String);

    //Procedimento que verifica se foi enviado um numero válido
    procedure EhNumero(AValor: String);
  public
    property Numero1: String  read GetNumero1  write SetNumero1;
    property Numero2: String  read GetNumero2  write SetNumero2;

    //Função que retorna o valor para a calculadora
    function Resultado(sOperacao: String): String;
  end;

implementation

{ TCalculadora }

procedure TCalculadora.EhNumero(AValor: String);
begin
  try
    StrToCurr(AValor);
  except
    //Cria uma excessão que irá retornar para a aplicação principal
    raise Exception.Create('Valor informado não é um número válido.');
  end;
end;


function TCalculadora.GetNumero1: String;
begin
  Result := CurrToStr(FNumero1);
end;


function TCalculadora.GetNumero2: String;
begin
  Result := CurrToStr(FNumero2);
end;

procedure TCalculadora.SetNumero1(ANumero1: String);
begin
  EhNumero(ANumero1);

  FNumero1 := StrToCurr(ANumero1);
end;

procedure TCalculadora.SetNumero2(ANumero2: String);
begin
  EhNumero(ANumero2);

  FNumero2 := StrToCurr(ANumero2);
end;

end.
