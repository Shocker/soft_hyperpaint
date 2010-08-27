program hypernet;

uses
  Forms,
  main in 'main.pas' {Form1},
  new_plan in 'new_plan.pas' {Form2},
  effects_unit in 'effects_unit.pas',
  ClientCommunication in 'ClientCommunication.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HyperPaintNet by Shocker';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
