unit UDFUtils;

interface

uses
  SysUtils;

function ObterValorCurreny(AValorTexto: String): Double;

implementation

function ObterValorCurreny(AValorTexto: String): Double;
var
  LIndice: Integer;
  LDigitosSeparador: string;
  LTextoResultado: string;
  LConfigFormatacao: TFormatSettings;
begin
  LDigitosSeparador := '';
  for LIndice := 1 to Length(AValorTexto) do
    if AValorTexto[LIndice] in ['0' .. '9', ',', '.'] then
      LDigitosSeparador := LDigitosSeparador + AValorTexto[LIndice];

  LTextoResultado := StringReplace(LDigitosSeparador, '.', '', [rfReplaceAll]);
  LTextoResultado := StringReplace(LTextoResultado, ',', '.', [rfReplaceAll]);

  LConfigFormatacao := FormatSettings;
  LConfigFormatacao.DecimalSeparator := '.';

  Result := StrToFloatDef(LTextoResultado, 0, LConfigFormatacao);
end;

end.
