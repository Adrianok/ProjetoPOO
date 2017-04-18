object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Aplicativo para aprendizagem de POO'
  ClientHeight = 541
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 32
    Top = 192
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Estado1: TMenuItem
        Caption = 'Estado'
        OnClick = Estado1Click
      end
      object Municipio1: TMenuItem
        Caption = 'Municipio'
        OnClick = Municipio1Click
      end
      object Usurio1: TMenuItem
        Caption = 'Usu'#225'rio'
        OnClick = Usurio1Click
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object SintaxeBsica1: TMenuItem
        Caption = 'Sintaxe B'#225'sica'
        OnClick = SintaxeBsica1Click
      end
    end
  end
end
