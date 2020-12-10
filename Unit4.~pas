unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DB, ADODB, ComCtrls,
  StdCtrls, jpeg;

type
  TForm4 = class(TForm)
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Image2: TImage;
    Label21: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image21: TImage;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit5: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit13: TEdit;
    Button12: TButton;
    ADOConnection2: TADOConnection;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    GroupBox4: TGroupBox;
    Label27: TLabel;
    Image18: TImage;
    DBGrid2: TDBGrid;
    Edit12: TEdit;
    Button9: TButton;
    DBNavigator2: TDBNavigator;
    Label1: TLabel;
    Label8: TLabel;
    Button1: TButton;
    ADOConnection3: TADOConnection;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Button9Click(Sender: TObject);
    procedure Edit12Enter(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Stream:TMemoryStream;
  Jpeg:TJpegImage;
  hrg,jmlh,byar,pjk,totbay:real;

implementation

uses Unit2, Unit1;

{$R *.dfm}

procedure TForm4.Button4Click(Sender: TObject);
begin
Stream:=TMemoryStream.create;
Image2.Picture.Graphic.SaveToStream(stream);
Stream.Position:=0;
Adoquery2.Append;
Adoquery2.FieldByName('Kode_Transaksi').AsString:=Edit6.Text;
Adoquery2.FieldByName('Kode Masker').AsString:=Edit7.Text;
Adoquery2.FieldByName('Nama Masker').AsString:=Edit8.Text;
Adoquery2.FieldByName('Tipe Masker').AsString:=Edit9.Text;
Adoquery2.FieldByName('Harga Masker').AsInteger:=StrToInt(Edit10.Text);
Adoquery2.FieldByName('Unit').AsInteger:=StrToInt(Edit5.Text);
Adoquery2.FieldByName('Total Bayar').AsInteger:=StrToInt(Edit13.Text);
Adoquery2.FieldByName('Tanggal Transaksi').AsDateTime:=DateTimePicker1.Date;
Tblobfield(Adoquery2.FieldByName('Foto Masker')).LoadFromStream(stream);
Stream.Free;
Adoquery2.Post;

showMessage('Data Transaksi Pembelian Masker Berhasil Ditambahkan!')
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
Stream:=TMemoryStream.create;
Image2.Picture.Graphic.SaveToStream(stream);
Stream.Position:=0;
Adoquery2.Edit;
Adoquery2.FieldByName('Kode_Transaksi').AsString:=Edit6.Text;
Adoquery2.FieldByName('Kode Masker').AsString:=Edit7.Text;
Adoquery2.FieldByName('Nama Masker').AsString:=Edit8.Text;
Adoquery2.FieldByName('Tipe Masker').AsString:=Edit9.Text;
Adoquery2.FieldByName('Harga Masker').AsInteger:=StrToInt(Edit10.Text);
Adoquery2.FieldByName('Unit').AsInteger:=StrToInt(Edit5.Text);
Adoquery2.FieldByName('Total Bayar').AsInteger:=StrToInt(Edit13.Text);
Adoquery2.FieldByName('Tanggal Transaksi').AsDateTime:=DateTimePicker1.Date;
Tblobfield(Adoquery2.FieldByName('Foto Masker')).LoadFromStream(stream);
Stream.Free;
Adoquery2.Post;

showMessage('Data Transaksi Pembelian Masker Berhasil Diperbarui!')
end;


procedure TForm4.Button6Click(Sender: TObject);
begin
if (application.MessageBox('Apakah Anda Yakin Ingin Menghapus Data Penjualan ini?','Peringatan!',mb_yesno or mb_iconquestion)=idyes)
then
Adoquery2.Delete;
Edit5.Clear;
Edit6.Clear;
Edit7.Clear;
Edit8.Clear;
Edit9.Clear;
Edit10.Clear;
Edit13.Clear;
end;


procedure TForm4.Button12Click(Sender: TObject);
begin
Label15.Caption:='*otomatis terisi';
Edit5.Clear;
Edit6.Clear;
Edit7.Clear;
Edit8.Clear;
Edit9.Clear;
Edit10.Clear;
Edit13.Clear;
Edit12.Clear;
ADOQuery2.Active:=False;
ADOQuery2.SQL.Clear;
ADOQuery2.SQL.Text:='select * from tabel_beli';
ADOQuery2.Active:=True;
Image2.Picture.Loadfromfile('C:\CodeFighter\Delphi7\Masker Delphi 7\Gambar\Preview Image@2x.jpg');
end;

procedure TForm4.DBGrid2CellClick(Column: TColumn);
begin
label15.Caption := Adoquery2.FieldByName('ID').AsString;
Edit6.text := Adoquery2.FieldByName('Kode_Transaksi').AsString;
Edit7.text := Adoquery2.FieldByName('Kode Masker').AsString;
Edit8.text := Adoquery2.FieldByName('Nama Masker').AsString;
Edit9.text := Adoquery2.FieldByName('Tipe Masker').AsString;
Edit10.Text := Adoquery2.FieldByName('Harga Masker').AsString;
Edit5.Text := Adoquery2.FieldByName('Unit').AsString;
Edit13.Text := Adoquery2.FieldByName('Total Bayar').AsString;
DateTimePicker1.Date := Adoquery2.FieldByName('Tanggal Transaksi').AsDateTime;

Jpeg := TJpegImage.Create;
Stream := TMemoryStream.Create;
TBlobField(Adoquery2.Fieldbyname('Foto Masker')).SaveToStream(stream);
stream.Position:=0;
Jpeg.LoadFromStream(stream);
Image2.Picture.Graphic:=Jpeg;

end;


procedure TForm4.Button9Click(Sender: TObject);
begin
with ADOQuery2 do
begin
Active:=false;
SQL.Text:='select * from tabel_beli where Kode_Transaksi ='+QuotedStr(Edit12.Text);
Active:=True;
end;
if Adoquery2.RecordCount = 0 then
begin
MessageDlg('Data Transaksi Pembelian Tidak Di Temukan!',mtInformation,[mbok],0);
edit12.clear;
ADOQuery2.Active:=False;
ADOQuery2.SQL.Clear;
ADOQuery2.SQL.Text:='select * from tabel_beli';
ADOQuery2.Active:=True;
end
else
begin
DBGrid2.SetFocus;
end;
label15.Caption := Adoquery2.FieldByName('ID').AsString;
Edit6.text := Adoquery2.FieldByName('Kode_Transaksi').AsString;
Edit7.text := Adoquery2.FieldByName('Kode Masker').AsString;
Edit8.text := Adoquery2.FieldByName('Nama Masker').AsString;
Edit9.text := Adoquery2.FieldByName('Tipe Masker').AsString;
Edit10.Text := Adoquery2.FieldByName('Harga Masker').AsString;
Edit5.Text := Adoquery2.FieldByName('Unit').AsString;
Edit13.Text := Adoquery2.FieldByName('Total Bayar').AsString;
DateTimePicker1.Date := Adoquery2.FieldByName('Tanggal Transaksi').AsDateTime;

Jpeg := TJpegImage.Create;
Stream := TMemoryStream.Create;
TBlobField(Adoquery2.Fieldbyname('Foto Masker')).SaveToStream(stream);
stream.Position:=0;
Jpeg.LoadFromStream(stream);
Image2.Picture.Graphic:=Jpeg;
end;


procedure TForm4.Edit12Enter(Sender: TObject);
begin
with ADOQuery2 do
begin
Active:=false;
SQL.Text:='select * from tabel_beli where Kode_Transaksi ='+QuotedStr(Edit12.Text);
Active:=True;
end;
if Adoquery2.RecordCount = 0 then
begin
MessageDlg('Data Transaksi Pembelian Tidak Di Temukan!',mtInformation,[mbok],0);
ADOQuery2.Active:=False;
ADOQuery2.SQL.Clear;
ADOQuery2.SQL.Text:='select * from tabel_beli';
ADOQuery2.Active:=True;
end
else
begin
DBGrid2.SetFocus;
end;
label15.Caption := Adoquery2.FieldByName('ID').AsString;
Edit6.text := Adoquery2.FieldByName('Kode_Transaksi').AsString;
Edit7.text := Adoquery2.FieldByName('Kode Masker').AsString;
Edit8.text := Adoquery2.FieldByName('Nama Masker').AsString;
Edit9.text := Adoquery2.FieldByName('Tipe Masker').AsString;
Edit10.Text := Adoquery2.FieldByName('Harga Masker').AsString;
Edit5.Text := Adoquery2.FieldByName('Unit').AsString;
Edit13.Text := Adoquery2.FieldByName('Total Bayar').AsString;
DateTimePicker1.Date := Adoquery2.FieldByName('Tanggal Transaksi').AsDateTime;

Jpeg := TJpegImage.Create;
Stream := TMemoryStream.Create;
TBlobField(Adoquery2.Fieldbyname('Foto Masker')).SaveToStream(stream);
stream.Position:=0;
Jpeg.LoadFromStream(stream);
Image2.Picture.Graphic:=Jpeg;

end;


procedure TForm4.Button5Click(Sender: TObject);
begin
hrg:=StrToFloat(Edit10.text);
jmlh:=StrToFloat(Edit5.Text);
byar:=(hrg*jmlh);
pjk:= (byar*0.10);
totbay:=byar+pjk;
Edit13.Text:=FloatToStr(totbay);
end;

procedure TForm4.DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
begin
label15.Caption := Adoquery2.FieldByName('ID').AsString;
Edit6.text := Adoquery2.FieldByName('Kode_Transaksi').AsString;
Edit7.text := Adoquery2.FieldByName('Kode Masker').AsString;
Edit8.text := Adoquery2.FieldByName('Nama Masker').AsString;
Edit9.text := Adoquery2.FieldByName('Tipe Masker').AsString;
Edit10.Text := Adoquery2.FieldByName('Harga Masker').AsString;
Edit5.Text := Adoquery2.FieldByName('Unit').AsString;
Edit13.Text := Adoquery2.FieldByName('Total Bayar').AsString;
DateTimePicker1.Date := Adoquery2.FieldByName('Tanggal Transaksi').AsDateTime;

Jpeg := TJpegImage.Create;
Stream := TMemoryStream.Create;
TBlobField(Adoquery2.Fieldbyname('Foto Masker')).SaveToStream(stream);
stream.Position:=0;
Jpeg.LoadFromStream(stream);
Image2.Picture.Graphic:=Jpeg;

end;

procedure TForm4.Button1Click(Sender: TObject);
begin
form4.Hide;
form1.show;
end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
label9.Caption := Adoquery3.FieldByName('ID').AsString;
Edit7.text := Adoquery3.FieldByName('Kode_Masker').AsString;
Edit8.text := Adoquery3.FieldByName('Nama Masker').AsString;
Edit9.text := Adoquery3.FieldByName('Tipe Masker').AsString;
Edit10.Text := Adoquery3.FieldByName('Harga Masker').AsString;

Jpeg := TJpegImage.Create;
Stream := TMemoryStream.Create;
TBlobField(Adoquery3.Fieldbyname('Foto Masker')).SaveToStream(stream);
stream.Position:=0;
Jpeg.LoadFromStream(stream);
Image2.Picture.Graphic:=Jpeg;
end;

end.
