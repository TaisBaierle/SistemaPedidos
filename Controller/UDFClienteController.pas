unit UDFClienteController;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.Classes,
  UDFCliente,
  PedidosData;

type
  TClienteController = class
  private
    FConexao: TFDConnection;
  public
    constructor Create(AConexao: TFDConnection);

    procedure Inserir(ACliente: TCliente);
    function BuscarCliente(ACodigo: Integer): TCliente;
  end;

implementation

constructor TClienteController.Create(AConexao: TFDConnection);
begin
  FConexao := AConexao;
end;

procedure TClienteController.Inserir(ACliente: TCliente);
begin
  dmPedidos.qrAux.Close;
  dmPedidos.qrAux.SQL.Clear;

  dmPedidos.qrAux.SQL.Text :=
    'INSERT INTO CLIENTES (NOME, CIDADE, UF) VALUES (:NOME, :CIDADE, :UF)';

  dmPedidos.qrAux.ParamByName('NOME').AsString := ACliente.Nome;
  dmPedidos.qrAux.ParamByName('CIDADE').AsString := ACliente.Cidade;
  dmPedidos.qrAux.ParamByName('UF').AsString := ACliente.UF;
  dmPedidos.qrAux.ExecSQL;

  Self.FConexao.CommitRetaining;
end;

function TClienteController.BuscarCliente(ACodigo: Integer): TCliente;
begin
  Result := TCliente.Create;
  try
    dmPedidos.qrAux.Close;
    dmPedidos.qrAux.SQL.Clear;
    dmPedidos.qrAux.SQL.Text :=
      'SELECT CODIGO, NOME, CIDADE, UF FROM CLIENTES WHERE CODIGO = :CODIGO';
    dmPedidos.qrAux.ParamByName('CODIGO').AsInteger := ACodigo;

    dmPedidos.qrAux.Open;
    if not dmPedidos.qrAux.IsEmpty then
    begin
      Result.Codigo := dmPedidos.qrAux.FieldByName('CODIGO').AsInteger;
      Result.Nome := dmPedidos.qrAux.FieldByName('NOME').AsString;
      Result.Cidade := dmPedidos.qrAux.FieldByName('CIDADE').AsString;
      Result.UF := dmPedidos.qrAux.FieldByName('UF').AsString;
    end;
  finally
    dmPedidos.qrAux.Close;
  end;
end;

end.
