unit uEstadoDto;

interface

type
  TEstadoDto = class
  private
    FID: Integer;
    FUF: String;
    FNome: String;
  public
    property ID: Integer  read FID  write FID;
    property UF: String  read FUF  write FUF;
    property Nome: String  read FNome  write FNome;
  end;

implementation

end.
