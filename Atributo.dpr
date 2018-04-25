program Atributo;

uses
  Forms,
  Modelo in 'Modelo.pas' {frmModelo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Modelo';
  Application.CreateForm(TfrmModelo, frmModelo);
  Application.Run;
end.
