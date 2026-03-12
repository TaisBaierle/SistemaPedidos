unit UDFPedidoController;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, UDFPedido;
type
  TPedidoController = class
  private
    FConexao: TFDConnection;
  public
    constructor Create(AConexao: TFDConnection);

    function CriarPedido(ACodigoCliente: Integer): Integer;
    procedure AdicionarItem(AItemPedido: TItemPedido);
    function CalcularTotal(ANumeroPedido: Integer): Double;
    procedure FinalizarPedido(ANumeroPedido: Integer);
  end;

implementation

uses
  PedidosData;

constructor TPedidoController.Create(AConexao: TFDConnection);
begin
  FConexao := AConexao;
end;

function TPedidoController.CriarPedido(ACodigoCliente: Integer): Integer;
begin
  dmPedidos.qrAux.Close;
  dmPedidos.qrAux.SQL.Clear;

  dmPedidos.qrAux.SQL.Text := 'INSERT INTO PEDIDOS (DATA_EMISSAO, CODIGO_CLIENTE, VALOR_TOTAL) VALUES (date(''NOW''), :CLIENTE, 0)';
  dmPedidos.qrAux.ParamByName('CLIENTE').AsInteger := ACodigoCliente;
  dmPedidos.qrAux.ExecSQL;
  Self.FConexao.CommitRetaining;

  Result := FConexao.ExecSQLScalar('SELECT last_insert_rowid()');
end;

procedure TPedidoController.AdicionarItem(AItemPedido: TItemPedido);
var
  LValorTotal: Double;
begin
  dmPedidos.qrAux.Close;
  dmPedidos.qrAux.SQL.Clear;

  LValorTotal := AItemPedido.Quantidade * AItemPedido.ValorUnitario;

  dmPedidos.qrAux.SQL.Text := 'INSERT INTO PEDIDOS_ITENS (NUMERO_PEDIDO, CODIGO_PRODUTO, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL) ' + 'VALUES (:PEDIDO, :PRODUTO, :QTD, :VLRUNIT, :VLRTOTAL)';

  dmPedidos.qrAux.ParamByName('PEDIDO').AsInteger := AItemPedido.NumeroPedido;
  dmPedidos.qrAux.ParamByName('PRODUTO').AsInteger := AItemPedido.CodigoProduto;
  dmPedidos.qrAux.ParamByName('QTD').AsInteger := AItemPedido.Quantidade;
  dmPedidos.qrAux.ParamByName('VLRUNIT').AsFloat := AItemPedido.ValorUnitario;
  dmPedidos.qrAux.ParamByName('VLRTOTAL').AsFloat := AItemPedido.ValorTotal;
  dmPedidos.qrAux.ExecSQL;
end;

function TPedidoController.CalcularTotal(ANumeroPedido: Integer): Double;
begin
  dmPedidos.qrAux.Close;
  dmPedidos.qrAux.SQL.Clear;
  dmPedidos.qrAux.SQL.Text := 'SELECT SUM(VALOR_TOTAL) TOTAL FROM PEDIDOS_ITENS WHERE NUMERO_PEDIDO = :PEDIDO';
  dmPedidos.qrAux.ParamByName('PEDIDO').AsInteger := ANumeroPedido;
  dmPedidos.qrAux.Open;
  Result := dmPedidos.qrAux.FieldByName('TOTAL').AsFloat;
end;

procedure TPedidoController.FinalizarPedido(ANumeroPedido: Integer);
var
  Total: Double;
begin
  Total := CalcularTotal(ANumeroPedido);

  dmPedidos.qrAux.Close;
  dmPedidos.qrAux.SQL.Clear;
  dmPedidos.qrAux.SQL.Text := 'UPDATE PEDIDOS SET VALOR_TOTAL = :TOTAL ' + 'WHERE NUMERO_PEDIDO = :PEDIDO';

  dmPedidos.qrAux.ParamByName('TOTAL').AsFloat := Total;
  dmPedidos.qrAux.ParamByName('PEDIDO').AsInteger := ANumeroPedido;

  dmPedidos.qrAux.ExecSQL;
end;

end.
