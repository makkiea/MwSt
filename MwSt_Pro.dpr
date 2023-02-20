program MwSt_Pro;

uses
  Vcl.Forms,
  MwSt in 'MwSt.pas' {Steuerabzug};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSteuerabzug, Steuerabzug);
  Application.Run;
end.
