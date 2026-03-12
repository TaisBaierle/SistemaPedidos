object fmPontoVenda: TfmPontoVenda
  Left = 0
  Top = 0
  Caption = 'Ponto de venda (PDV)'
  ClientHeight = 720
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 15
  object pcPDV: TPageControl
    Left = 0
    Top = 0
    Width = 1024
    Height = 720
    ActivePage = tsPontoVenda
    Align = alClient
    TabOrder = 0
    object tsPontoVenda: TTabSheet
      Caption = 'PDV'
      object paRodape: TPanel
        Left = 0
        Top = 609
        Width = 1016
        Height = 81
        Align = alBottom
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object btCancelarPedido: TButton
          Left = 294
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Cancelar pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btCancelarPedidoClick
        end
        object btSalvarPedido: TButton
          Left = 6
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Salvar pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btSalvarPedidoClick
        end
        object btNovoPedido: TButton
          Left = 152
          Top = 24
          Width = 121
          Height = 25
          Caption = 'Novo pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btNovoPedidoClick
        end
      end
      object paClientePedido: TPanel
        Left = 0
        Top = 0
        Width = 1016
        Height = 81
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 1
        object lbNomeClientePedido: TLabel
          Left = 152
          Top = 8
          Width = 91
          Height = 15
          Caption = 'Nome do cliente:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbCodigoClientePedido: TLabel
          Left = 8
          Top = 3
          Width = 96
          Height = 15
          Caption = 'C'#243'digo do cliente:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object edNomeClientePedido: TMaskEdit
          Left = 152
          Top = 24
          Width = 585
          Height = 23
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 1
          Text = ''
        end
        object edCodigoClientePedido: TSpinEdit
          Left = 8
          Top = 24
          Width = 121
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnChange = edCodigoClientePedidoChange
          OnExit = edCodigoClientePedidoExit
        end
      end
      object paVendas: TPanel
        Left = 0
        Top = 81
        Width = 1016
        Height = 528
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          1016
          528)
        object lbProduto: TLabel
          Left = 8
          Top = 8
          Width = 46
          Height = 15
          Caption = 'Produto:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbQuantidade: TLabel
          Left = 10
          Top = 64
          Width = 65
          Height = 15
          Caption = 'Quantidade:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbValorUnitario: TLabel
          Left = 152
          Top = 64
          Width = 74
          Height = 15
          Caption = 'Valor unit'#225'rio:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbItensProdutos: TLabel
          Left = 8
          Top = 480
          Width = 84
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'Nenhum item'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbNumeroPedido: TLabel
          Left = 937
          Top = 6
          Width = 71
          Height = 15
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'SEM PEDIDO'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object edCodigoProdutoPedido: TSpinEdit
          Left = 8
          Top = 24
          Width = 121
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnExit = edCodigoProdutoPedidoExit
        end
        object edDescricaoProdutoPedido: TMaskEdit
          Left = 152
          Top = 24
          Width = 585
          Height = 23
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 1
          Text = ''
        end
        object edQuantidade: TSpinEdit
          Left = 8
          Top = 80
          Width = 121
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 1
        end
        object edValorUnitario: TMaskEdit
          Left = 152
          Top = 80
          Width = 90
          Height = 23
          TabOrder = 3
          Text = ''
          OnKeyPress = edValorKeyPress
        end
        object btAdicionarItem: TButton
          Left = 264
          Top = 79
          Width = 121
          Height = 25
          Caption = 'Adicionar item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ModalResult = 1
          ParentFont = False
          TabOrder = 4
          OnClick = btAdicionarItemClick
        end
        object paGrid: TPanel
          Left = 8
          Top = 127
          Width = 1000
          Height = 342
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 7
          object grPedidos: TDBGrid
            Left = 0
            Top = 0
            Width = 996
            Height = 338
            Align = alClient
            DataSource = dmPedidos.dsPedidosItens
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO_PRODUTO'
                Title.Caption = 'C'#243'digo do produto'
                Width = 138
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Descri'#231#227'o do produto'
                Width = 173
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Caption = 'Quantidade'
                Width = 107
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                Title.Caption = 'Valor unit'#225'rio'
                Width = 131
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                Title.Caption = 'Valor total'
                Width = 124
                Visible = True
              end>
          end
        end
        object edValorTotal: TMaskEdit
          Left = 772
          Top = 475
          Width = 234
          Height = 36
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          Text = 'Total: R$ 00,00'
        end
        object btAlterarItem: TButton
          Left = 408
          Top = 79
          Width = 121
          Height = 25
          Caption = 'Alterar item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ModalResult = 1
          ParentFont = False
          TabOrder = 5
          OnClick = btAlterarItemClick
        end
        object btExcluirItem: TButton
          Left = 552
          Top = 79
          Width = 121
          Height = 25
          Caption = 'Excluir item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ModalResult = 1
          ParentFont = False
          TabOrder = 6
          OnClick = btExcluirItemClick
        end
      end
    end
    object tsClientes: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 1
      object paCliente: TPanel
        Left = 0
        Top = 0
        Width = 1016
        Height = 169
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object lbNomeCliente: TLabel
          Left = 8
          Top = 11
          Width = 91
          Height = 15
          Caption = 'Nome do cliente:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbCidade: TLabel
          Left = 152
          Top = 56
          Width = 39
          Height = 15
          Caption = 'Cidade:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbEstado: TLabel
          Left = 8
          Top = 56
          Width = 38
          Height = 15
          Caption = 'Estado:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object edNomeCliente: TMaskEdit
          Left = 8
          Top = 27
          Width = 729
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 0
          Text = ''
        end
        object edCidade: TMaskEdit
          Left = 152
          Top = 72
          Width = 585
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 2
          Text = ''
        end
        object cbEstado: TComboBox
          Left = 8
          Top = 72
          Width = 121
          Height = 23
          ItemIndex = 0
          TabOrder = 1
          Items.Strings = (
            ''
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
        end
        object btSalvarCliente: TButton
          Left = 8
          Top = 119
          Width = 121
          Height = 25
          Caption = 'Salvar cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btSalvarClienteClick
        end
      end
      object paClientesGrid: TPanel
        Left = 0
        Top = 169
        Width = 1016
        Height = 521
        Align = alClient
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 1
        object grClientes: TDBGrid
          Left = 0
          Top = 0
          Width = 1012
          Height = 517
          Align = alClient
          DataSource = dmPedidos.dcClientes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo do cliente'
              Width = 138
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_STR'
              Title.Caption = 'Nome'
              Width = 173
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE_STR'
              Title.Caption = 'Cidade'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UF_STR'
              Title.Caption = 'Estado'
              Width = 131
              Visible = True
            end>
        end
      end
    end
    object tsProdutos: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 2
      object paProduto: TPanel
        Left = 0
        Top = 0
        Width = 1016
        Height = 169
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object lbDescricaoProduto: TLabel
          Left = 8
          Top = 8
          Width = 55
          Height = 15
          Caption = 'Descri'#231#227'o:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbValorVenda: TLabel
          Left = 8
          Top = 56
          Width = 81
          Height = 15
          Caption = 'Valor de venda:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object edDescricaoProduto: TMaskEdit
          Left = 8
          Top = 27
          Width = 585
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 0
          Text = ''
        end
        object edValorVenda: TMaskEdit
          Left = 8
          Top = 72
          Width = 116
          Height = 23
          TabOrder = 1
          Text = ''
          OnKeyPress = edValorKeyPress
        end
        object btSalvarProduto: TButton
          Left = 8
          Top = 119
          Width = 121
          Height = 25
          Caption = 'Salvar produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btSalvarProdutoClick
        end
      end
      object paProdutoGrid: TPanel
        Left = 0
        Top = 169
        Width = 1016
        Height = 521
        Align = alClient
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 1
        object grProdutos: TDBGrid
          Left = 0
          Top = 0
          Width = 1012
          Height = 517
          Align = alClient
          DataSource = dmPedidos.dsProdutos
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'digo do produto'
              Width = 138
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICA_STR'
              Title.Caption = 'Descri'#231#227'o do produto'
              Width = 173
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_VENDA'
              Title.Caption = 'Valor de venda'
              Width = 131
              Visible = True
            end>
        end
      end
    end
    object tsRelatorios: TTabSheet
      Caption = 'Relat'#243'rios'
      ImageIndex = 3
      object paRelatorio: TPanel
        Left = 0
        Top = 0
        Width = 1016
        Height = 169
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object lbFiltro: TLabel
          Left = 8
          Top = 8
          Width = 30
          Height = 15
          Caption = 'Filtro:'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object cbFiltro: TComboBox
          Left = 8
          Top = 24
          Width = 121
          Height = 23
          ItemIndex = 0
          TabOrder = 0
          Text = 'Todos'
          OnChange = cbFiltroChange
          Items.Strings = (
            'Todos'
            'Clientes')
        end
        object pcFiltros: TPageControl
          Left = 152
          Top = 0
          Width = 689
          Height = 63
          ActivePage = tsFiltroTodos
          TabOrder = 1
          StyleElements = [seFont, seClient]
          object tsFiltroNomeCliente: TTabSheet
            TabVisible = False
            object lbFiltroNomeCliente: TLabel
              Left = 0
              Top = 0
              Width = 91
              Height = 15
              Caption = 'Nome do cliente:'
              Color = clSilver
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object edFiltroNomeCliente: TMaskEdit
              Left = 0
              Top = 18
              Width = 585
              Height = 23
              CharCase = ecUpperCase
              TabOrder = 0
              Text = ''
            end
          end
          object tsFiltroTodos: TTabSheet
            ImageIndex = 2
            TabVisible = False
          end
        end
        object btLocalizarPedidos: TButton
          Left = 8
          Top = 119
          Width = 121
          Height = 25
          Caption = 'Localizar pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btLocalizarPedidosClick
        end
      end
      object paRelatorioGrid: TPanel
        Left = 0
        Top = 169
        Width = 1016
        Height = 521
        Align = alClient
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 1
        object grRelatorios: TDBGrid
          Left = 0
          Top = 0
          Width = 1012
          Height = 517
          Align = alClient
          DataSource = dmPedidos.dsPedidos
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NUMERO_PEDIDO'
              Title.Caption = 'N'#250'mero do pedido'
              Width = 138
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_STR'
              Title.Caption = 'Nome do cliente'
              Width = 173
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Title.Caption = 'Valor total'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_DT'
              Title.Caption = 'Data'
              Width = 131
              Visible = True
            end>
        end
      end
    end
  end
end
