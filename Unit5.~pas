unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm5 = class(TForm)
    Button13: TButton;
    Button4: TButton;
    Image1: TImage;
    Label8: TLabel;
    Label1: TLabel;
    procedure Button13Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit2, Unit1;

{$R *.dfm}

procedure TForm5.Button13Click(Sender: TObject);
begin
quickreport2.ADOQuery1.SQL.clear;
quickreport2.ADOQuery1.SQL.add('select * from tabel_beli');
quickreport2.ADOQuery1.open;
quickreport2.preview;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
form5.Hide;
form1.show;
end;

end.
