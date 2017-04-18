object frmSintaxe: TfrmSintaxe
  Left = 0
  Top = 0
  BorderWidth = 5
  Caption = 'Sintaxe b'#225'sica'
  ClientHeight = 342
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 545
    Height = 342
    Align = alLeft
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      
        '<BR>Classe:</BR>'#201' a representa'#231#227'o de um objeto; uma estrutura qu' +
        'e abstrai um conjunto de objetos com'
      
        'caracter'#237'sticas similares. Uma classe define o comportamento de ' +
        'seus objetos atrav'#233's de m'#233'todos e os '
      
        'estados poss'#237'veis destes objetos atrav'#233's de atributos. Em outros' +
        ' termos, uma classe descreve os servi'#231'os '
      
        'providos por seus objetos e quais informa'#231#245'es eles podem armazen' +
        'a.'
      ''
      'Objeto: '#201' a instancia de uma classe.'
      ''
      'Sintaxe:'
      ''
      'type'
      '     <nome da classe> = class(<heranca (opcional)>'
      '     protected'
      
        '        <descri'#231#227'o de propriedades, procedimentos e fun'#231#245'es prot' +
        'egidas>'
      '     published'
      
        '        <descri'#231#227'o de propriedades, procedimentos e fun'#231#245'es publ' +
        'icadas - RTTI>'
      '     private'
      
        '        <descri'#231#227'o de propriedades, procedimentos e fun'#231#245'es priv' +
        'adas>'
      '     public'
      
        '        <descri'#231#227'o de propriedades, procedimentos e fun'#231#245'es publ' +
        'icas>'
      '     end;')
    ParentFont = False
    TabOrder = 0
    Zoom = 100
    ExplicitHeight = 287
  end
  object GroupBox1: TGroupBox
    Left = 551
    Top = 0
    Width = 185
    Height = 342
    Align = alRight
    Caption = ' Passos '
    TabOrder = 1
    ExplicitLeft = 576
    ExplicitTop = 40
    ExplicitHeight = 105
    object Button1: TButton
      Left = 5
      Top = 23
      Width = 174
      Height = 25
      Caption = 'Defini'#231#227'o da classe'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 5
      Top = 53
      Width = 174
      Height = 25
      Caption = 'Dar uses da unit da classe'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 5
      Top = 82
      Width = 174
      Height = 25
      Caption = 'Criar a vari'#225'vel do objeto'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 5
      Top = 111
      Width = 174
      Height = 25
      Caption = 'Instanciar o objeto'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 5
      Top = 309
      Width = 174
      Height = 25
      Caption = 'Liberar o objeto da mem'#243'ria'
      TabOrder = 4
      OnClick = Button5Click
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 137
      Width = 173
      Height = 166
      Caption = ' Utilizar o objeto '
      TabOrder = 5
      object EdtNumero1: TEdit
        Left = 8
        Top = 21
        Width = 156
        Height = 21
        TabOrder = 0
        TextHint = 'Informe o primeiro n'#250'mero'
      end
      object edtNumero2: TEdit
        Left = 8
        Top = 49
        Width = 156
        Height = 21
        TabOrder = 1
        TextHint = 'Informe o segundo n'#250'mero'
      end
      object edtResultado: TEdit
        Left = 8
        Top = 77
        Width = 156
        Height = 21
        Enabled = False
        TabOrder = 2
        TextHint = 'Resultado'
      end
      object rgOperacao: TRadioGroup
        Left = 8
        Top = 103
        Width = 156
        Height = 54
        Caption = 'Selecione a Opera'#231#227'o'
        Columns = 2
        Items.Strings = (
          '+'
          '-'
          'x'
          '/')
        TabOrder = 3
        OnClick = rgOperacaoClick
      end
    end
  end
end
