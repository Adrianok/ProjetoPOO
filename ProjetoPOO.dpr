program ProjetoPOO;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uSintaxe in 'uSintaxe.pas' {frmSintaxe},
  uClassCalculadora in 'uClassCalculadora.pas',
  uMunicipioDto in 'uMunicipioDto.pas',
  uBaseCadastro in 'uBaseCadastro.pas' {frmBaseCadastro},
  uEstado in 'uEstado.pas' {frmEstado},
  uMunicipio in 'uMunicipio.pas' {frmMunicipio},
  uClassPessoa in 'uClassPessoa.pas',
  uClassUsuario in 'uClassUsuario.pas',
  uUsuario in 'uUsuario.pas' {frmUsuario},
  uClassConexao in 'uClassConexao.pas',
  uClassConexaoSingleton in 'uClassConexaoSingleton.pas',
  uEstadoControler in 'uEstadoControler.pas',
  uEstadoModel in 'uEstadoModel.pas',
  uEstadoDto in 'uEstadoDto.pas',
  uMunicipioControler in 'uMunicipioControler.pas',
  uMunicipioModel in 'uMunicipioModel.pas',
  uListaEstados in 'uListaEstados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
