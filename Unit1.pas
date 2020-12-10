unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, jpeg,
  ComCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Button1: TButton;
    Label5: TLabel;
    Image2: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  usname: String;
implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  usname := ComboBox1.Text;
  if ((ComboBox1.Text='Supplier') and (edit2.Text='supplier')) then
   begin
     form1.Hide;
     form3.show;
     ComboBox1.Text:='Select User Privileges';
     edit2.Text:='';
   end
  else if ((ComboBox1.Text='Cashier') and (edit2.Text='cashier')) then
    begin
     form1.Hide;
     form4.show;
     ComboBox1.Text:='Select User Privileges';
     edit2.Text:='';
    end
  else if ((ComboBox1.Text='Manager') and (edit2.Text='manager')) then
    begin
     form1.Hide;
     form5.show;
     ComboBox1.Text:='Select User Privileges';
     edit2.Text:='';
    end

  else
     showmessage('Invalid User and Password! Try Again!');
     edit2.Text:='';
     ComboBox1.Text:='Select User Privileges';
end;

procedure TForm1.Label5Click(Sender: TObject);
begin
form1.Hide;
form4.Show;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
showMessage('Delhpi 7 Desktop Project Masker' +sLineBreak+
'Programmed By: @servatiusadhii' +sLineBreak+
'Designed By: @tarunaersa')
end;

end.
