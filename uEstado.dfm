inherited frmEstado: TfrmEstado
  Caption = 'Cadastro de Estados'
  ClientHeight = 188
  ClientWidth = 313
  OnCreate = FormCreate
  ExplicitWidth = 329
  ExplicitHeight = 227
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 313
    Height = 188
    ExplicitWidth = 313
    ExplicitHeight = 188
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 305
      ExplicitHeight = 160
      inherited Panel1: TPanel
        Top = 119
        Width = 305
        ExplicitTop = 119
        ExplicitWidth = 305
        inherited Panel2: TPanel
          Left = 55
          ExplicitLeft = 55
        end
      end
      object edtUF: TLabeledEdit
        Left = 10
        Top = 30
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 13
        EditLabel.Height = 13
        EditLabel.Caption = 'UF'
        MaxLength = 3
        TabOrder = 1
        TextHint = 'Informe a UF'
        OnExit = edtUFExit
      end
      object edtNome: TLabeledEdit
        Left = 10
        Top = 78
        Width = 281
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 30
        TabOrder = 2
        TextHint = 'Informe o nome do estado'
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitWidth = 305
      ExplicitHeight = 160
      inherited DBGrid1: TDBGrid
        Width = 305
        Height = 160
        Columns = <
          item
            Expanded = False
            FieldName = 'UF'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 242
            Visible = True
          end>
      end
    end
  end
end
