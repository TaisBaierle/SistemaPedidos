unit UDFProdutoController;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, UDFProduto;

type
  TProdutoController = class
  private
    FConexao: TFDConnection;
  public
    constructor Create(AConexao: TFDConnection);

    procedure Inserir(AProduto: TProduto);
    procedure Atualizar(AProduto: TProduto);
    procedure Excluir(Codigo: Integer);
    function BuscarProduto(ACodigo: Integer): TProduto;
  end;

implementation

uses
  PedidosData;

{ TProdutoController }

constructor TProdutoController.Create(AConexao: TFDConnection);
begin
  FConexao := AConexao;
end;

procedure TProdutoController.Inserir(AProduto: TProduto);
begin
  dmPedidos.qrAux.Close;
  dmPedidos.qrAux.SQL.Clear;

  dmPedidos.qrAux.SQL.Text :=
    'INSERT INTO PRODUTOS (DESCRICAO, PRECO_VENDA) VALUES (:DESCRICAO, :PRECO_VENDA)';

  dmPedidos.qrAux.ParamByName('DESCRICAO').AsString := AProduto.Descricao;
  dmPedidos.qrAux.ParamByName('PRECO_VENDA').AsFloat := AProduto.PrecoVenda;

  dmPedidos.qrAux.ExecSQL;
  Self.FConexao.CommitRetaining;
end;

procedure TProdutoController.Atualizar(AProduto: TProduto);
begin
  dmPedidos.qrAux.Close;
  dmPedidos.qrAux.SQL.Clear;

  dmPedidos.qrAux.SQL.Text :=
    'UPDATE PRODUTOS SET DESCRICAO = :DESCRICAO, PRECO_VENDA = :PRECO_VENDA WHERE CODIGO = :CODIGO';

  dmPedidos.qrAux.ParamByName('DESCRICAO').AsString := AProduto.Descricao;
  dmPedidos.qrAux.ParamByName('PRECO_VENDA').AsFloat := AProduto.PrecoVenda;
  dmPedidos.qrAux.ParamByName('CODIGO').AsInteger := AProduto.Codigo;

  dmPedidos.qrAux.ExecSQL;
  Self.FConexao.CommitRetaining;
end;

procedure TProdutoController.Excluir(Codigo: Integer);
begin
  dmPedidos.qrAux.Close;
  dmPedidos.qrAux.SQL.Clear;

  dmPedidos.qrAux.SQL.Text := 'DELETE FROM PRODUTOS WHERE CODIGO = :CODIGO';

  dmPedidos.qrAux.ParamByName('CODIGO').AsInteger := Codigo;

  dmPedidos.qrAux.ExecSQL;
  Self.FConexao.CommitRetaining;
end;

function TProdutoController.BuscarProduto(ACodigo: Integer): TProduto;
begin
  Result := TProduto.Create;
  try
    dmPedidos.qrAux.Close;
    dmPedidos.qrAux.SQL.Clear;

    dmPedidos.qrAux.SQL.Text :=
      'SELECT CODIGO, DESCRICAO, PRECO_VENDA FROM PRODUTOS WHERE CODIGO = :CODIGO';
    dmPedidos.qrAux.ParamByName('CODIGO').AsInteger := ACodigo;

    dmPedidos.qrAux.Open;

    if not dmPedidos.qrAux.IsEmpty then
    begin
      Result.Codigo := dmPedidos.qrAux.FieldByName('CODIGO').AsInteger;
      Result.Descricao := dmPedidos.qrAux.FieldByName('DESCRICAO').AsString;
      Result.PrecoVenda := dmPedidos.qrAux.FieldByName('PRECO_VENDA').AsCurrency;
    end;

  finally
    dmPedidos.qrAux.Close;
  end;
end;

end.
