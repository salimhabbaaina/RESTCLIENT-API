unit restapi3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, REST.Response.Adapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    Button1: TButton;
    ADOTable1: TADOTable;
    ADOConnection1: TADOConnection;
    ADOTable1ID_ARTICLE: TIntegerField;
    ADOTable1NOM_ARTICLE: TStringField;
    ADOTable1REFERENCE: TStringField;
    ADOCommand1: TADOCommand;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var Qry : TADOQuery;
begin
  Qry := TADOQuery.Create(Self);
  Qry.Connection := ADOConnection1;
  FDMemTable1.First;
  while not FDMemTable1.Eof do
  begin
     Qry.SQL.Clear;
     Qry.SQL.Add('select count(*) from ARTICLES');
     Qry.SQL.Add('where ID_ARTICLE = ' + IntToStr(FDMemTable1.FieldByName('ID').AsInteger) + '');
     Qry.open;
     if Qry.Fields[0].AsInteger = 0 then
     begin
       ADOCommand1.CommandText:='insert into articles (ID_ARTICLE,NOM_ARTICLE)'
                             + 'values('
                             + '''' + FDMemTable1.FieldByName('ID').Value + ''', '
                             + '''' + FDMemTable1.FieldByName('NOM').Value +''')';

       try
         ADOConnection1.BeginTrans;
         ADOCommand1.Execute;
         ADOConnection1.CommitTrans;
       except
         if ADOConnection1.InTransaction then
            ADOConnection1.RollbackTrans;
       end;
     end;
     Qry.Close;
     FDMemTable1.Next;
   end;

end;
end.
