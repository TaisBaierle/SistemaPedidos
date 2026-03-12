unit PedidosData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.UI, Data.DB, UDFConexaoBancoDados, Vcl.Forms, Vcl.Dialogs,
  UDFScripts, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.StrUtils, System.DateUtils,
  FireDAC.Phys.SQLiteWrapper.FDEStat;

type
  TdmPedidos = class(TDataModule)
    FDConexao: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDManager: TFDManager;
    qrClientes: TFDQuery;
    qrProdutos: TFDQuery;
    dcClientes: TDataSource;
    dsProdutos: TDataSource;
    dsPedidos: TDataSource;
    dsPedidosItens: TDataSource;
    qrClientesCODIGO: TIntegerField;
    qrProdutosCODIGO: TIntegerField;
    qrProdutosPRECOVENDA: TCurrencyField;
    qrAux: TFDQuery;
    qrProdutosDESCRICAO: TWideMemoField;
    qrClientesNOME: TWideMemoField;
    qrClientesCIDADE: TWideMemoField;
    qrClientesUF: TWideMemoField;
    qrClientesNOME_STR: TStringField;
    qrClientesCIDADE_STR: TStringField;
    qrClientesUF_STR: TStringField;
    qrProdutosDESCRICAO_STR: TStringField;
    mdPedidoItens: TFDMemTable;
    mdPedidoItensID: TIntegerField;
    mdPedidoItensNUMEROPEDIDO: TIntegerField;
    mdPedidoItensCODIGOPRODUTO: TIntegerField;
    mdPedidoItensQUANTIDADE: TIntegerField;
    mdPedidoItensVALORTOTAL: TCurrencyField;
    mdPedidoItensVALORUNITARIO: TCurrencyField;
    qrPedidosItens: TFDQuery;
    qrPedidosItensID: TIntegerField;
    qrPedidosItensNUMEROPEDIDO: TIntegerField;
    qrPedidosItensCODIGOPRODUTO: TIntegerField;
    qrPedidosItensQUANTIDADE: TIntegerField;
    qrPedidosItensVALORTOTAL: TCurrencyField;
    qrPedidosItensVALORUNITARIO: TCurrencyField;
    qrPedidosItensDESCRICAO: TWideMemoField;
    mdPedidoItensDESCRICAO: TStringField;
    qrPedidos: TFDQuery;
    qrPedidosNUMEROPEDIDO: TIntegerField;
    qrPedidosNOME: TWideMemoField;
    qrPedidosNOME_STR: TStringField;
    qrPedidosVALORTOTAL: TCurrencyField;
    qrPedidosDATAEMISSAO: TWideMemoField;
    qrPedidosDATA_DT: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qrClientesCalcFields(DataSet: TDataSet);
    procedure qrProdutosCalcFields(DataSet: TDataSet);
    procedure qrPedidosCalcFields(DataSet: TDataSet);
  private
    FConexao: TConexao;
  public
    function TentarConectar: Boolean;
  end;

var
  dmPedidos: TdmPedidos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdmProduto }

procedure TdmPedidos.DataModuleCreate(Sender: TObject);
begin
  try
    FConexao := TConexao.Create(ExtractFilePath(Application.ExeName) +
      'Config.ini');

    FConexao.ConfigurarParametros(FDConexao);

    FDConexao.Connected := True;

    if FDConexao.Connected then
      UDFScripts.CriarEstruturaBanco;
  except
    on E: Exception do
      ShowMessage('Erro fatal na inicialização do banco: ' + E.Message);
  end;
end;

procedure TdmPedidos.qrClientesCalcFields(DataSet: TDataSet);
begin
  qrClientesNOME_STR.AsString := qrClientes.FieldByName('NOME').AsString;
  qrClientesCIDADE_STR.AsString := qrClientes.FieldByName('CIDADE').AsString;
  qrClientesUF_STR.AsString := qrClientes.FieldByName('UF').AsString;
end;
procedure TdmPedidos.qrPedidosCalcFields(DataSet: TDataSet);
begin
  qrPedidosNOME_STR.AsString := qrPedidos.FieldByName('NOME').AsString;
  qrPedidosDATA_DT.AsDateTime := ISO8601ToDate(qrPedidos.FieldByName('DATA_EMISSAO').AsString);
end;

procedure TdmPedidos.qrProdutosCalcFields(DataSet: TDataSet);
begin
  qrProdutosDESCRICAO_STR.AsString := qrProdutos.FieldByName('DESCRICAO').AsString;
end;

function TdmPedidos.TentarConectar: Boolean;
var
  LBancoDados: String;
begin
  Result := False;

  if Self.FConexao = nil then
    Self.FConexao := TConexao.Create(ExtractFilePath(Application.ExeName) +
      'Config.ini');

  Self.FConexao.LerINI;

  LBancoDados := Self.FConexao.Database;

  if (LBancoDados = '') then
    exit;

  try
    Self.FConexao.Database := LBancoDados;
    Self.FConexao.ConfigurarParametros(Self.FDConexao);

    Self.FDConexao.Connected := True;

    Result := Self.FDConexao.Connected;
  except
    Result := False;
  end;
end;

end.
