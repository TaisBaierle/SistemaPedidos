object dmPedidos: TdmPedidos
  OnCreate = DataModuleCreate
  Height = 352
  Width = 534
  object FDConexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=SQLite'
      'Port=3050')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 144
    Top = 8
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 41
    Top = 96
  end
  object FDManager: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 144
    Top = 96
  end
  object qrClientes: TFDQuery
    OnCalcFields = qrClientesCalcFields
    CachedUpdates = True
    Connection = FDConexao
    SQL.Strings = (
      'SELECT '#39'F'#39' AS SELECIONADO,'
      '       CODIGO,'
      '       NOME,'
      '       CIDADE,'
      '       UF'
      'FROM CLIENTES')
    Left = 40
    Top = 176
    object qrClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qrClientesNOME: TWideMemoField
      FieldName = 'NOME'
      BlobType = ftWideMemo
    end
    object qrClientesCIDADE: TWideMemoField
      FieldName = 'CIDADE'
      BlobType = ftWideMemo
    end
    object qrClientesUF: TWideMemoField
      FieldName = 'UF'
      BlobType = ftWideMemo
      Size = 2
    end
    object qrClientesNOME_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOME_STR'
      Calculated = True
    end
    object qrClientesCIDADE_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'CIDADE_STR'
      Calculated = True
    end
    object qrClientesUF_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'UF_STR'
      Calculated = True
    end
  end
  object qrProdutos: TFDQuery
    OnCalcFields = qrProdutosCalcFields
    CachedUpdates = True
    Connection = FDConexao
    SQL.Strings = (
      'SELECT CODIGO,'
      '       DESCRICAO,'
      '       PRECO_VENDA'
      'FROM PRODUTOS')
    Left = 112
    Top = 176
    object qrProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qrProdutosPRECOVENDA: TCurrencyField
      FieldName = 'PRECO_VENDA'
      EditFormat = 'R$ #,##0.00'
    end
    object qrProdutosDESCRICAO: TWideMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftWideMemo
    end
    object qrProdutosDESCRICAO_STR: TStringField
      DisplayLabel = 'DESCRICAO_STR'
      FieldKind = fkCalculated
      FieldName = 'DESCRICA_STR'
      Calculated = True
    end
  end
  object dcClientes: TDataSource
    DataSet = qrClientes
    Left = 40
    Top = 232
  end
  object dsProdutos: TDataSource
    DataSet = qrProdutos
    Left = 112
    Top = 232
  end
  object dsPedidos: TDataSource
    DataSet = qrPedidos
    Left = 184
    Top = 232
  end
  object dsPedidosItens: TDataSource
    DataSet = mdPedidoItens
    Left = 264
    Top = 232
  end
  object qrAux: TFDQuery
    Connection = FDConexao
    Left = 264
    Top = 88
  end
  object mdPedidoItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 376
    Top = 232
    object mdPedidoItensID: TIntegerField
      FieldName = 'ID'
    end
    object mdPedidoItensNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object mdPedidoItensCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
    end
    object mdPedidoItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object mdPedidoItensVALORTOTAL: TCurrencyField
      FieldName = 'VALOR_TOTAL'
      EditFormat = 'R$ #,##0.00'
    end
    object mdPedidoItensVALORUNITARIO: TCurrencyField
      FieldName = 'VALOR_UNITARIO'
      EditFormat = 'R$ #,##0.00'
    end
    object mdPedidoItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object qrPedidosItens: TFDQuery
    CachedUpdates = True
    Connection = FDConexao
    SQL.Strings = (
      'SELECT PI.ID,'
      '       PI.NUMERO_PEDIDO,'
      '       PI.CODIGO_PRODUTO,'
      '       PI.QUANTIDADE,'
      '       PI.VALOR_TOTAL,'
      '       PI.VALOR_UNITARIO,'
      '       P.DESCRICAO'
      'FROM PEDIDOS_ITENS PI'
      'JOIN PRODUTOS P ON P.CODIGO = PI.CODIGO_PRODUTO')
    Left = 264
    Top = 168
    object qrPedidosItensID: TIntegerField
      FieldName = 'ID'
    end
    object qrPedidosItensNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object qrPedidosItensCODIGOPRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
    end
    object qrPedidosItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object qrPedidosItensVALORTOTAL: TCurrencyField
      FieldName = 'VALOR_TOTAL'
      EditFormat = 'R$ #,##0.00'
    end
    object qrPedidosItensVALORUNITARIO: TCurrencyField
      FieldName = 'VALOR_UNITARIO'
      EditFormat = 'R$ #,##0.00'
    end
    object qrPedidosItensDESCRICAO: TWideMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftWideMemo
    end
  end
  object qrPedidos: TFDQuery
    OnCalcFields = qrPedidosCalcFields
    Connection = FDConexao
    SQL.Strings = (
      'SELECT P.NUMERO_PEDIDO,'
      '       P.DATA_EMISSAO,'
      '       P.CODIGO_CLIENTE,'
      '       P.VALOR_TOTAL,'
      '       C.NOME'
      'FROM PEDIDOS P'
      'JOIN CLIENTES C '
      'ON C.CODIGO = P.CODIGO_CLIENTE'
      '       ')
    Left = 184
    Top = 168
    object qrPedidosNUMEROPEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object qrPedidosNOME: TWideMemoField
      FieldName = 'NOME'
      BlobType = ftWideMemo
    end
    object qrPedidosNOME_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOME_STR'
      Calculated = True
    end
    object qrPedidosVALORTOTAL: TCurrencyField
      FieldName = 'VALOR_TOTAL'
      EditFormat = 'R$ #,##0.00'
    end
    object qrPedidosDATAEMISSAO: TWideMemoField
      FieldName = 'DATA_EMISSAO'
      BlobType = ftWideMemo
    end
    object qrPedidosDATA_DT: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DATA_DT'
      DisplayFormat = 'dd/mm/yyyy'
      Calculated = True
    end
  end
end
