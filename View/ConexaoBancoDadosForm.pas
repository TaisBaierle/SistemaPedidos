unit ConexaoBancoDadosForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfmConexaoBancoDados = class(TForm)
    paFundo: TPanel;
    lbCaminhoBancoDados: TLabel;
    edCaminhoServidor: TMaskEdit;
    btSelecionar: TButton;
    btSalvar: TButton;
    btCancelar: TButton;
    OpenDialog: TOpenDialog;
    procedure btCancelarClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConexaoBancoDados: TfmConexaoBancoDados;

implementation

{$R *.dfm}

uses
  UDFConexaoBancoDados, FileCtrl;

procedure TfmConexaoBancoDados.btCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfmConexaoBancoDados.btSalvarClick(Sender: TObject);
var
  LConexao: TConexao;
begin
  if (edCaminhoServidor.Text = '') then
  begin
    MessageDlg('O caminho do servidor deve estar preenchido!', mtInformation,
      [mbOK], 0);
    exit;
  end
  else
  begin
    if Trim(edCaminhoServidor.Text) <> '' then
    begin
      LConexao := TConexao.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
      try
        LConexao.GravarINI(edCaminhoServidor.Text);
      finally
        FreeAndNil(LConexao);
      end;

      Close;
    end
    else
      MessageDlg('Informe o caminho do banco de dados!', mtInformation, [mbOK], 0);
  end;
end;

procedure TfmConexaoBancoDados.btSelecionarClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    edCaminhoServidor.Text := OpenDialog.FileName;
  end;
end;

end.
