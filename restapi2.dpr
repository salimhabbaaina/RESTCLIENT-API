program restapi2;

uses
  Vcl.Forms,
  restapi in 'restapi.pas' {Form2},
  restapi3 in 'restapi3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
