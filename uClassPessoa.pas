unit uClassPessoa;

interface

uses
  System.SysUtils, Vcl.Dialogs, uClassMunicipio;

type
  IPessoa = interface
    function getID: Integer;
    procedure setID(AValor: Integer);

    function getNome: String;
    procedure setNome(AValor: String);

    function getLogradouro: String;
    procedure setLogradouro(AValor: String);

    function getNumero: String;
    procedure setNumero(AValor: String);

    function getBairro: String;
    procedure setBairro(AValor: String);

    function getComplemento: String;
    procedure setComplemento(AValor: String);

    function getEmail: String;
    procedure setEmail(AValor: String);

    function getCelular: Currency;
    procedure setCelular(AValor: Currency);

    function getTelefone: Currency;
    procedure setTelefone(AValor: Currency);

    function getMunicipio: TMunicipio;
    procedure setMunicipio(AValor: TMunicipio);

    property ID: Integer read getID  write setID;
    property Nome: String read getNome write setNome;
    property Logradouro: String read getLogradouro write setLogradouro;
    property Numero: String read getNumero write setNumero;
    property Municipio: TMunicipio read getMunicipio write setMunicipio;
    property Bairro: String read getBairro write setBairro;
    property Complemento: String read getComplemento write setComplemento;
    property Celular: Currency read getCelular write setCelular;
    property Telefone: Currency read getTelefone write setTelefone;
    property EMail: String read getEmail write setEmail;
  end;

implementation

end.
