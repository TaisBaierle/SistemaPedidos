object fmConexaoBancoDados: TfmConexaoBancoDados
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conex'#227'o com o banco de dados'
  ClientHeight = 131
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object paFundo: TPanel
    Left = 0
    Top = 0
    Width = 499
    Height = 131
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lbCaminhoBancoDados: TLabel
      Left = 8
      Top = 24
      Width = 213
      Height = 15
      Caption = 'Caminho do banco de dados / servidor *'
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edCaminhoServidor: TMaskEdit
      Left = 8
      Top = 45
      Width = 400
      Height = 23
      TabOrder = 0
      Text = ''
      TextHint = 'Forne'#231'a o caminho do banco de dados...'
    end
    object btSelecionar: TButton
      Left = 414
      Top = 44
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = btSelecionarClick
    end
    object btSalvar: TButton
      Left = 8
      Top = 90
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btSalvarClick
    end
    object btCancelar: TButton
      Left = 101
      Top = 90
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 3
      OnClick = btCancelarClick
    end
  end
  object OpenDialog: TOpenDialog
    Left = 375
    Top = 71
  end
end
