unit PontoVendaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Samples.Spin, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, UDFProdutoController, UDFPedido, UDFClienteController,
  UDFPedidoController;

type
  TfmPontoVenda = class(TForm)
    pcPDV: TPageControl;
    tsPontoVenda: TTabSheet;
    tsClientes: TTabSheet;
    tsProdutos: TTabSheet;
    tsRelatorios: TTabSheet;
    paRodape: TPanel;
    paClientePedido: TPanel;
    paVendas: TPanel;
    lbNomeClientePedido: TLabel;
    edNomeClientePedido: TMaskEdit;
    edCodigoClientePedido: TSpinEdit;
    lbCodigoClientePedido: TLabel;
    edCodigoProdutoPedido: TSpinEdit;
    lbProduto: TLabel;
    edDescricaoProdutoPedido: TMaskEdit;
    edQuantidade: TSpinEdit;
    lbQuantidade: TLabel;
    edValorUnitario: TMaskEdit;
    lbValorUnitario: TLabel;
    btAdicionarItem: TButton;
    paGrid: TPanel;
    grPedidos: TDBGrid;
    btCancelarPedido: TButton;
    btSalvarPedido: TButton;
    lbItensProdutos: TLabel;
    edValorTotal: TMaskEdit;
    paCliente: TPanel;
    lbNomeCliente: TLabel;
    edNomeCliente: TMaskEdit;
    paClientesGrid: TPanel;
    grClientes: TDBGrid;
    paProduto: TPanel;
    lbDescricaoProduto: TLabel;
    edDescricaoProduto: TMaskEdit;
    paProdutoGrid: TPanel;
    grProdutos: TDBGrid;
    paRelatorio: TPanel;
    lbFiltro: TLabel;
    paRelatorioGrid: TPanel;
    grRelatorios: TDBGrid;
    lbCidade: TLabel;
    edCidade: TMaskEdit;
    cbEstado: TComboBox;
    lbEstado: TLabel;
    btSalvarCliente: TButton;
    lbValorVenda: TLabel;
    btSalvarProduto: TButton;
    cbFiltro: TComboBox;
    pcFiltros: TPageControl;
    tsFiltroNomeCliente: TTabSheet;
    lbFiltroNomeCliente: TLabel;
    edFiltroNomeCliente: TMaskEdit;
    tsFiltroTodos: TTabSheet;
    btLocalizarPedidos: TButton;
    edValorVenda: TMaskEdit;
    btAlterarItem: TButton;
    btExcluirItem: TButton;
    btNovoPedido: TButton;
    lbNumeroPedido: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSalvarClienteClick(Sender: TObject);
    procedure btSalvarProdutoClick(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoProdutoPedidoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCodigoClientePedidoChange(Sender: TObject);
    procedure btCancelarPedidoClick(Sender: TObject);
    procedure btAdicionarItemClick(Sender: TObject);
    procedure btExcluirItemClick(Sender: TObject);
    procedure edCodigoClientePedidoExit(Sender: TObject);
    procedure btAlterarItemClick(Sender: TObject);
    procedure btSalvarPedidoClick(Sender: TObject);
    procedure btNovoPedidoClick(Sender: TObject);
    procedure cbFiltroChange(Sender: TObject);
    procedure btLocalizarPedidosClick(Sender: TObject);
  private
    FProdutoController: TProdutoController;
    FClienteController: TClienteController;
    FPedidoController: TPedidoController;
    FIDPedidoItem: Integer;
    FValorTotalPedido: Currency;
    FQuantidadeItens: Integer;
    FSQLPedidos: String;

    procedure AjustarColunas(DBGrid: TDBGrid);
    function ExibirConfiguracao: Boolean;
    function ValidarCampos: Boolean;
    procedure LimparCampos;
    procedure AtualizarValorPedido(AValor: Currency; ASomar: Boolean);
    procedure AtualizarQuantidadePedido(AQuantidade: Integer; ASomar: Boolean);
  public

  end;

var
  fmPontoVenda: TfmPontoVenda;

implementation

uses
  PedidosData,
  ConexaoBancoDadosForm,
  UDFCliente,
  UDFProduto,
  UDFUtils;

{$R *.dfm}
{ TfmPontoVenda }

procedure TfmPontoVenda.AjustarColunas(DBGrid: TDBGrid);
var
  LIndice: Integer;
  LLargura: Integer;
begin
  if DBGrid.Columns.Count = 0 then
    Exit;

  LLargura := DBGrid.ClientWidth;

  if dgIndicator in DBGrid.Options then
    Dec(LLargura, 20);

  for LIndice := 0 to DBGrid.Columns.Count - 1 do
  begin
    if DBGrid.Columns[LIndice].FieldName = 'SELECIONADO_BOL' then
      DBGrid.Columns[LIndice].Width := (LLargura div DBGrid.Columns.Count) div 4
    else
      DBGrid.Columns[LIndice].Width := LLargura div DBGrid.Columns.Count;
  end;
end;

procedure TfmPontoVenda.btAdicionarItemClick(Sender: TObject);
begin
  if not ValidarCampos then
    Exit;

  if btAlterarItem.Tag = 1 then
  begin
    MessageDlg('Termine de editar o item antes!', mtInformation, [mbOK], 0);
    Exit;
  end;

  if (not(dmPedidos.mdPedidoItens.State in [dsInsert, dsEdit])) then
  begin
    dmPedidos.mdPedidoItens.Append;
    dmPedidos.mdPedidoItensDESCRICAO.AsString := edDescricaoProdutoPedido.Text;
    dmPedidos.mdPedidoItensCODIGOPRODUTO.AsInteger := edCodigoProdutoPedido.Value;
    dmPedidos.mdPedidoItensQUANTIDADE.AsInteger := edQuantidade.Value;
    dmPedidos.mdPedidoItensVALORUNITARIO.AsCurrency := StrToCurrDef(edValorUnitario.Text, 0);
    dmPedidos.mdPedidoItensVALORTOTAL.AsCurrency := dmPedidos.mdPedidoItensQUANTIDADE.AsInteger * dmPedidos.mdPedidoItensVALORUNITARIO.AsCurrency;
    dmPedidos.mdPedidoItens.Post;
  end;
  AtualizarValorPedido(dmPedidos.mdPedidoItensVALORTOTAL.AsCurrency, True);
  AtualizarQuantidadePedido(dmPedidos.mdPedidoItensQUANTIDADE.AsInteger, True);
end;

procedure TfmPontoVenda.btCancelarPedidoClick(Sender: TObject);
begin
  Self.LimparCampos;
  dmPedidos.mdPedidoItens.Close;
  dmPedidos.mdPedidoItens.Open;
  MessageDlg('Pedido cancelado!', mtInformation, [mbOK], 0);
end;

procedure TfmPontoVenda.btExcluirItemClick(Sender: TObject);
begin
  if btAlterarItem.Tag = 1 then
  begin
    MessageDlg('Termine de editar o item antes!', mtInformation, [mbOK], 0);
    Exit;
  end;

  if MessageDlg('Você deseja excluir o item do pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    AtualizarValorPedido(dmPedidos.mdPedidoItensVALORTOTAL.AsCurrency, False);
    AtualizarQuantidadePedido(dmPedidos.mdPedidoItensQUANTIDADE.AsInteger, False);
    dmPedidos.mdPedidoItens.Delete;
  end;
end;

procedure TfmPontoVenda.btLocalizarPedidosClick(Sender: TObject);
begin
  dmPedidos.qrPedidos.Close;
  dmPedidos.qrPedidos.SQL.Text := FSQLPedidos;

  case pcFiltros.ActivePageIndex of
    0:
      begin
        if Trim(edFiltroNomeCliente.Text) <> '' then
        begin
          dmPedidos.qrPedidos.SQL.Add('AND UPPER(C.NOME) LIKE :NOME');

          dmPedidos.qrPedidos.ParamByName('NOME').AsString := '%' + UpperCase(Trim(edFiltroNomeCliente.Text)) + '%';
        end
        else
        begin
          MessageDlg('Necessário informar um nome para o filtro!', mtInformation, [mbOK], 0);
          Exit;
        end;
      end;
  end;
  dmPedidos.qrPedidos.Open;
end;

procedure TfmPontoVenda.btNovoPedidoClick(Sender: TObject);
begin
  Self.LimparCampos;

  dmPedidos.mdPedidoItens.Close;
  dmPedidos.mdPedidoItens.Open;

  edCodigoClientePedido.Value := 0;
  edNomeClientePedido.Text := '';

  lbNumeroPedido.Caption := 'SEM PEDIDO';
end;

procedure TfmPontoVenda.btSalvarClienteClick(Sender: TObject);
var
  LCliente: TCliente;
  LClienteController: TClienteController;
begin
  LCliente := TCliente.Create;
  LClienteController := TClienteController.Create(dmPedidos.FDConexao);
  try
    if Self.ValidarCampos then
    begin
      LCliente.Nome := edNomeCliente.Text;
      LCliente.Cidade := edCidade.Text;
      LCliente.UF := cbEstado.Text;

      LClienteController.Inserir(LCliente);
      Self.LimparCampos;

      dmPedidos.qrClientes.Refresh;
    end;
  finally
    LCliente.Free;
    LClienteController.Free;
  end;
end;

procedure TfmPontoVenda.btAlterarItemClick(Sender: TObject);
begin
  if btAlterarItem.Tag = 1 then
  begin
    edCodigoProdutoPedido.Enabled := True;
    btAlterarItem.Tag := 0;
    btAlterarItem.Caption := 'Alterar item';

    dmPedidos.mdPedidoItens.Locate('ID', FIDPedidoItem, []);
    if (not(dmPedidos.mdPedidoItens.State in [dsInsert, dsEdit])) then
    begin
      dmPedidos.mdPedidoItens.Edit;
      dmPedidos.mdPedidoItensDESCRICAO.AsString := edDescricaoProdutoPedido.Text;
      dmPedidos.mdPedidoItensCODIGOPRODUTO.AsInteger := edCodigoProdutoPedido.Value;
      dmPedidos.mdPedidoItensQUANTIDADE.AsInteger := edQuantidade.Value;
      dmPedidos.mdPedidoItensVALORUNITARIO.AsCurrency := StrToCurrDef(edValorUnitario.Text, 0);
      dmPedidos.mdPedidoItensVALORTOTAL.AsCurrency := dmPedidos.mdPedidoItensVALORUNITARIO.AsCurrency * dmPedidos.mdPedidoItensQUANTIDADE.AsInteger;
    end;
  end
  else
  begin
    edCodigoProdutoPedido.Enabled := False;
    btAlterarItem.Tag := 1;
    btAlterarItem.Caption := 'Salvar item';

    edCodigoProdutoPedido.Value := dmPedidos.mdPedidoItensCODIGOPRODUTO.AsInteger;
    edDescricaoProdutoPedido.Text := dmPedidos.mdPedidoItensDESCRICAO.AsString;
    edQuantidade.Value := dmPedidos.mdPedidoItensQUANTIDADE.AsInteger;
    edValorUnitario.Text := CurrToStr(dmPedidos.mdPedidoItensVALORUNITARIO.AsCurrency);
    FIDPedidoItem := dmPedidos.mdPedidoItensID.AsInteger;
  end;
end;

procedure TfmPontoVenda.btSalvarPedidoClick(Sender: TObject);
var
  LItem: TItemPedido;
  LCodigoPedido: Integer;
begin
  LItem := TItemPedido.Create;
  try
    try
      if edCodigoClientePedido.Value = 0 then
      begin
        MessageDlg('Necessário informar um cliente!', mtInformation, [mbOK], 0);
        Exit;
      end;

      if dmPedidos.mdPedidoItens.RecordCount = 0 then
      begin
        MessageDlg('Necessário incluir pelo menos um item!', mtInformation, [mbOK], 0);
        Exit;
      end;

      LCodigoPedido := FPedidoController.CriarPedido(edCodigoClientePedido.Value);

      dmPedidos.mdPedidoItens.First;
      while not dmPedidos.mdPedidoItens.Eof do
      begin
        LItem.Limpar;
        LItem.CodigoProduto := dmPedidos.mdPedidoItensCODIGOPRODUTO.AsInteger;
        LItem.NumeroPedido := LCodigoPedido;
        LItem.Quantidade := dmPedidos.mdPedidoItensQUANTIDADE.AsInteger;
        LItem.ValorUnitario := dmPedidos.mdPedidoItensVALORUNITARIO.AsCurrency;
        LItem.ValorTotal := LItem.ValorUnitario * LItem.Quantidade;
        FPedidoController.AdicionarItem(LItem);
        dmPedidos.mdPedidoItens.Next;
      end;
      dmPedidos.FDConexao.CommitRetaining;

      FPedidoController.FinalizarPedido(LCodigoPedido);

      dmPedidos.FDConexao.CommitRetaining;

      MessageDlg('Pedido incluído!', mtInformation, [mbOK], 0);

      if LCodigoPedido > 0 then
        lbNumeroPedido.Caption := 'Pedido ' + IntToStr(LCodigoPedido);

    except
      on E: Exception do
      begin
        MessageDlg('Ocorreu o seguinte erro: ' + E.Message, mtError, [mbOK], 0);
        dmPedidos.FDConexao.RollbackRetaining;
      end;
    end;
  finally
    LItem.Free;
  end;
end;

procedure TfmPontoVenda.btSalvarProdutoClick(Sender: TObject);
var
  LProduto: TProduto;
begin
  LProduto := TProduto.Create;
  try
    if Self.ValidarCampos then
    begin
      LProduto.Descricao := edDescricaoProduto.Text;
      LProduto.PrecoVenda := UDFUtils.ObterValorCurreny(edValorVenda.Text);

      Self.FProdutoController.Inserir(LProduto);
      Self.LimparCampos;

      dmPedidos.qrProdutos.Refresh;
    end;
  finally
    LProduto.Free;
  end;
end;

procedure TfmPontoVenda.cbFiltroChange(Sender: TObject);
begin
  if cbFiltro.ItemIndex = 0 then
    pcFiltros.ActivePage := tsFiltroTodos
  else
    pcFiltros.ActivePage := tsFiltroNomeCliente;
end;

procedure TfmPontoVenda.edCodigoClientePedidoChange(Sender: TObject);
begin
  btCancelarPedido.Visible := edCodigoClientePedido.Value = 0;
end;

procedure TfmPontoVenda.edCodigoClientePedidoExit(Sender: TObject);
var
  LCliente: TCliente;
begin
  try
    LCliente := TCliente.Create;

    if edCodigoClientePedido.Value > 0 then
    begin
      LCliente := Self.FClienteController.BuscarCliente(edCodigoClientePedido.Value);

      if (LCliente.Codigo) = 0 then
      begin
        MessageDlg('Item não cadastrado!', mtInformation, [mbOK], 0);
        Self.LimparCampos;
        edCodigoProdutoPedido.SetFocus;
        Exit;
      end;

      edNomeClientePedido.Text := LCliente.Nome;
    end
    else
      MessageDlg('Informe um código para busca.', mtInformation, [mbOK], 0);
  finally
    LCliente.Free;
  end;
end;

procedure TfmPontoVenda.edCodigoProdutoPedidoExit(Sender: TObject);
var
  LProduto: TProduto;
begin
  try
    LProduto := TProduto.Create;

    if edCodigoProdutoPedido.Value > 0 then
    begin
      LProduto := Self.FProdutoController.BuscarProduto(edCodigoProdutoPedido.Value);

      if LProduto.Codigo = 0 then
      begin
        MessageDlg('Item não cadastrado!', mtInformation, [mbOK], 0);
        Self.LimparCampos;
        edCodigoProdutoPedido.SetFocus;
        Exit;
      end;

      edDescricaoProdutoPedido.Text := LProduto.Descricao;
      edValorUnitario.Text := CurrToStr(LProduto.PrecoVenda);
      if edQuantidade.Value > 1 then
        edQuantidade.Value := 1;
    end
    else
      MessageDlg('Informe um código para busca.', mtInformation, [mbOK], 0);
  finally
    LProduto.Free;
  end;
end;

procedure TfmPontoVenda.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8, ',', '.']) then
    Key := #0
  else if (Key in [',', '.']) then
  begin
    Key := ',';
    if Pos(',', TEdit(Sender).Text) > 0 then
      Key := #0;
  end;
end;

function TfmPontoVenda.ExibirConfiguracao: Boolean;
var
  LConfiguracao: TfmConexaoBancoDados;
begin
  Result := False;
  LConfiguracao := TfmConexaoBancoDados.Create(Self);
  try
    if LConfiguracao.ShowModal = mrOk then
    begin
      Result := dmPedidos.TentarConectar;
    end;
  finally
    LConfiguracao.Free;
  end;
end;

procedure TfmPontoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.FProdutoController.Free;
  Self.FClienteController.Free;
  Self.FPedidoController.Free;
end;

procedure TfmPontoVenda.FormCreate(Sender: TObject);
begin

  begin
    if not dmPedidos.TentarConectar then
    begin
      MessageDlg('Conexão não encontrada ou banco de dados inválido.' + #13 + 'Por favor, configure os dados de acesso.', mtInformation, [mbOK], 0);

      if not ExibirConfiguracao then
      begin
        Application.Terminate;
      end;
    end;
  end;
end;

procedure TfmPontoVenda.FormResize(Sender: TObject);
begin
  Self.AjustarColunas(grPedidos);
  Self.AjustarColunas(grClientes);
  Self.AjustarColunas(grProdutos);
  Self.AjustarColunas(grRelatorios);
end;

procedure TfmPontoVenda.FormShow(Sender: TObject);
begin
  Self.AjustarColunas(grPedidos);
  Self.AjustarColunas(grClientes);
  Self.AjustarColunas(grProdutos);
  Self.AjustarColunas(grRelatorios);

  dmPedidos.qrProdutos.Open;
  dmPedidos.qrClientes.Open;
  dmPedidos.mdPedidoItens.Open;
  dmPedidos.qrPedidos.Open;

  FProdutoController := TProdutoController.Create(dmPedidos.FDConexao);
  FClienteController := TClienteController.Create(dmPedidos.FDConexao);
  FPedidoController := TPedidoController.Create(dmPedidos.FDConexao);
  edCodigoClientePedidoChange(nil);
  cbFiltroChange(nil);
  FValorTotalPedido := 0;
  FQuantidadeItens := 0;
  pcPDV.ActivePage := tsPontoVenda;

  FSQLPedidos := dmPedidos.qrPedidos.SQL.Text;
end;

function TfmPontoVenda.ValidarCampos: Boolean;
begin
  Result := True;

  case pcPDV.ActivePageIndex of
    0:
      begin
        if edCodigoProdutoPedido.Value = 0 then
        begin
          MessageDlg('É obrigatório informar um produto.', mtWarning, [mbOK], 0);
          Result := False;
          Exit;
        end;

        if edQuantidade.Value = 0 then
        begin
          MessageDlg('Não é possivel informar uma quantidade zero.', mtWarning, [mbOK], 0);
          Result := False;
          Exit;
        end;

        if Length(Trim(edValorUnitario.Text)) = 0 then
        begin
          MessageDlg('O valor unitário é obrigatório.', mtWarning, [mbOK], 0);
          Result := False;
          Exit;
        end;
      end;
    1:
      begin
        if Length(Trim(edNomeCliente.Text)) = 0 then
        begin
          MessageDlg('O nome do cliente é obrigatório.', mtWarning, [mbOK], 0);
          Result := False;
          Exit;
        end;

        if Length(Trim(edCidade.Text)) = 0 then
        begin
          MessageDlg('O nome do cidade é obrigatório.', mtWarning, [mbOK], 0);
          Result := False;
          Exit;
        end;
      end;
    2:
      begin
        if Length(Trim(edDescricaoProduto.Text)) = 0 then
        begin
          MessageDlg('A descrição do produto é obrigatório.', mtWarning, [mbOK], 0);
          Result := False;
          Exit;
        end;

        if Length(Trim(edValorVenda.Text)) = 0 then
        begin
          MessageDlg('O valor de venda do produto é obrigatório.', mtWarning, [mbOK], 0);
          Result := False;
          Exit;
        end;
      end;
  end;
end;

procedure TfmPontoVenda.LimparCampos;
begin
  case pcPDV.ActivePageIndex of
    0:
      begin
        edDescricaoProdutoPedido.Clear;
        edValorUnitario.Clear;
        edQuantidade.Value := 1;
        edCodigoProdutoPedido.Value := 0;
      end;
    1:
      begin
        Self.edNomeCliente.Clear;
        Self.edCidade.Clear;
        Self.cbEstado.ItemIndex := 0;
      end;
    2:
      begin
        edDescricaoProduto.Clear;
        edValorVenda.Clear;
        edNomeClientePedido.Clear;
      end;
  end;
end;

procedure TfmPontoVenda.AtualizarValorPedido(AValor: Currency; ASomar: Boolean);
begin
  if ASomar then
    FValorTotalPedido := FValorTotalPedido + AValor
  else
    FValorTotalPedido := FValorTotalPedido - AValor;

  edValorTotal.Text := 'Total R$ ' + FormatFloat('0.00', FValorTotalPedido);
end;

procedure TfmPontoVenda.AtualizarQuantidadePedido(AQuantidade: Integer; ASomar: Boolean);
begin
  if ASomar then
    FQuantidadeItens := FQuantidadeItens + AQuantidade
  else
    FQuantidadeItens := FQuantidadeItens - AQuantidade;

  if FQuantidadeItens = 0 then
    lbItensProdutos.Caption := 'Nenhum item'
  else
    lbItensProdutos.Caption := 'Itens: ' + IntToStr(FQuantidadeItens);
end;

end.
