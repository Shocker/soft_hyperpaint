program HyperPaint;

uses
  Forms,
  main in 'main.pas' {Form1},
  NewFile in 'NewFile.pas' {Form2},
  Effects in 'Effects.pas',
  ClientCommunication in 'ClientCommunication.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HyperPaintNet by Shocker';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
