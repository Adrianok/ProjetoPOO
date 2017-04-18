inherited frmMunicipio: TfrmMunicipio
  Caption = 'Cadastro de munic'#237'pios'
  ClientHeight = 221
  ClientWidth = 494
  OnCreate = FormCreate
  ExplicitWidth = 510
  ExplicitHeight = 260
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 494
    Height = 221
    ExplicitWidth = 494
    ExplicitHeight = 221
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 486
      ExplicitHeight = 193
      object Label1: TLabel [0]
        Left = 271
        Top = 99
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      inherited Panel1: TPanel
        Top = 152
        Width = 486
        ExplicitTop = 152
        ExplicitWidth = 486
        inherited Panel2: TPanel
          Left = 236
          ExplicitLeft = 236
        end
      end
      object edtID: TLabeledEdit
        Left = 8
        Top = 23
        Width = 73
        Height = 21
        Ctl3D = True
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        ParentCtl3D = False
        TabOrder = 1
        OnExit = edtIDExit
      end
      object edtNome: TLabeledEdit
        Left = 8
        Top = 69
        Width = 465
        Height = 21
        Ctl3D = True
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        ParentCtl3D = False
        TabOrder = 2
      end
      object edtCodigoIbge: TLabeledEdit
        Left = 8
        Top = 116
        Width = 97
        Height = 21
        Ctl3D = True
        EditLabel.Width = 59
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo IBGE'
        ParentCtl3D = False
        TabOrder = 3
      end
      object EdtCep: TLabeledEdit
        Left = 111
        Top = 116
        Width = 89
        Height = 21
        Ctl3D = True
        EditLabel.Width = 19
        EditLabel.Height = 13
        EditLabel.Caption = 'CEP'
        ParentCtl3D = False
        TabOrder = 4
      end
      object cmbEstado: TComboBox
        Left = 271
        Top = 116
        Width = 202
        Height = 21
        AutoDropDown = True
        Ctl3D = True
        ParentCtl3D = False
        Sorted = True
        TabOrder = 6
      end
      object EdtDDD: TLabeledEdit
        Left = 205
        Top = 116
        Width = 60
        Height = 21
        Ctl3D = True
        EditLabel.Width = 21
        EditLabel.Height = 13
        EditLabel.Caption = 'DDD'
        ParentCtl3D = False
        TabOrder = 5
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 486
      ExplicitHeight = 193
      inherited DBGrid1: TDBGrid
        Width = 486
        Height = 193
      end
    end
  end
end
