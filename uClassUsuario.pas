unit uClassUsuario;

interface

uses
  vcl.Dialogs, uClassPessoa;

type
  TUsuario = class //(TInterfacedObject, IPessoa)
  private
    FLogin: String;
    FSenha: String;
  public
    property Login: String read FLogin write FLogin;
    property Senha: String read FSenha write FSenha;

    destructor Destroy; override;
  end;

implementation

{ TUsuario }

destructor TUsuario.Destroy;
begin
  inherited;
end;

end.
