unit UDFConexaoBancoDados;

interface

uses
  System.SysUtils,
  System.IniFiles,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef;

const
  Secao = 'Conexao';

type
  TConexao = class
  private
    FCaminho: string;
    FDatabase: string;
  public
    constructor Create(Path: string);

    procedure LerINI;
    procedure GravarINI(Banco: string);
    procedure ConfigurarParametros(Conexao: TFDConnection);

    property Caminho: string read FCaminho write FCaminho;
    property Database: string read FDatabase write FDatabase;
  end;

implementation

constructor TConexao.Create(Path: string);
begin
  FCaminho := Path;
end;

procedure TConexao.GravarINI(Banco: string);
var
  LArqIni: TIniFile;
begin
  LArqIni := TIniFile.Create(Caminho);
  try
    LArqIni.WriteString(Secao, 'Database', Banco);
  finally
    LArqIni.Free;
  end;
end;

procedure TConexao.LerINI;
var
  LArqIni: TIniFile;
begin
  LArqIni := TIniFile.Create(Caminho);
  try
    FDatabase := LArqIni.ReadString(Secao, 'Database', '');
  finally
    LArqIni.Free;
  end;
end;

procedure TConexao.ConfigurarParametros(Conexao: TFDConnection);
begin
  LerINI;

  Conexao.Connected := False;
  Conexao.LoginPrompt := False;

  Conexao.Params.Clear;
  Conexao.Params.DriverID := 'SQLite';
  Conexao.Params.Database := FDatabase;

  Conexao.Connected := True;
end;

end.
