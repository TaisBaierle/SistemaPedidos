unit UDFPedido;

interface

type

  TItemPedido = class
  private
    FID: Integer;
    FNumeroPedido: Integer;
    FCodigoProduto: Integer;
    FQuantidade: Integer;
    FValorUnitario: Currency;
    FValorTotal: Currency;
  public
    property ID: Integer read FID write FID;
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property CodigoProduto: Integer read FCodigoProduto write FCodigoProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property ValorUnitario: Currency read FValorUnitario write FValorUnitario;
    property ValorTotal: Currency read FValorTotal write FValorTotal;

    constructor Create;

    procedure Limpar;
  end;

  TPedido = class
  private
    FNumeroPedido: Integer;
    FDataEmissao: TDateTime;
    FCodigoCliente: Integer;
    FValorTotal: Currency;
  public
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property CodigoCliente: Integer read FCodigoCliente write FCodigoCliente;
    property ValorTotal: Currency read FValorTotal write FValorTotal;

    constructor Create;
  end;

implementation

{ TItemPedido }

constructor TItemPedido.Create;
begin
  Self.FID := 0;
  Self.FNumeroPedido := 0;
  Self.FCodigoProduto := 0;
  Self.FQuantidade := 0;
  Self.FValorUnitario := 0;
  Self.FValorTotal := 0;
end;

procedure TItemPedido.Limpar;
begin
  Self.FNumeroPedido := 0;
  Self.FCodigoProduto := 0;
  Self.FQuantidade := 0;
  Self.FValorUnitario := 0;
  Self.FValorTotal := 0;
end;

{ TPedido }

constructor TPedido.Create;
begin
  Self.FNumeroPedido := 0;
  Self.DataEmissao := 0;
  Self.FCodigoCliente := 0;
  Self.FValorTotal := 0;
end;

end.
