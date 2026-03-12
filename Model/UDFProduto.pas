unit UDFProduto;

interface

type
  TProduto = class
  private
    FCodigo: Integer;
    FDescricao: String;
    FPrecoVenda: Currency;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: String read FDescricao write FDescricao;
    property PrecoVenda: Currency read FPrecoVenda write FPrecoVenda;

    constructor Create;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  Self.FCodigo := 0;
  Self.FDescricao := '';
  Self.FPrecoVenda := 0;
end;

end.
