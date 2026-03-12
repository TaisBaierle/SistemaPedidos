program Produtos;

uses
  Vcl.Forms,
  UDFProduto in 'Model\UDFProduto.pas',
  UDFCliente in 'Model\UDFCliente.pas',
  UDFPedido in 'Model\UDFPedido.pas',
  UDFConexaoBancoDados in 'DAO\UDFConexaoBancoDados.pas',
  PedidosData in 'DAO\PedidosData.pas' {dmPedidos: TDataModule},
  ConexaoBancoDadosForm in 'View\ConexaoBancoDadosForm.pas' {fmConexaoBancoDados},
  PontoVendaForm in 'View\PontoVendaForm.pas' {fmPontoVenda},
  UDFScripts in 'DAO\UDFScripts.pas',
  UDFClienteController in 'Controller\UDFClienteController.pas',
  UDFProdutoController in 'Controller\UDFProdutoController.pas',
  UDFPedidoController in 'Controller\UDFPedidoController.pas',
  UDFUtils in 'Utils\UDFUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPedidos, dmPedidos);
  Application.CreateForm(TfmPontoVenda, fmPontoVenda);
  Application.CreateForm(TfmConexaoBancoDados, fmConexaoBancoDados);
  Application.Run;
end.
