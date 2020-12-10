unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, jpeg, DB,
  ADODB, ExtDlgs;

type
  TForm3 = class(TForm)
    Label8: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Image3: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image20: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Button3: TButton;
    DateTimePicker2: TDateTimePicker;
    Button10: TButton;
    Button11: TButton;
    GroupBox3: TGroupBox;
    Label26: TLabel;
    Image19: TImage;
    DBGrid1: TDBGrid;
    Edit11: TEdit;
    Button8: TButton;
    DBNavigator1: TDBNavigator;
    Label9: TLabel;
    OpenPicturedialog1: TOpenPictureDialog;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button8Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Stream:TMemoryStream;
  Jpeg:TJpegImage;
  hrg,jmlh,byar,pjk,totbay:real;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
Stream:=TMemoryStream.create;
Image1.Picture.Graphic.SaveToStream(stream);
Stream.Position:=0;
Adoquery1.Append;
Adoquery1.FieldByName('Kode_Masker').AsString:=Edit1.Text;
Adoquery1.FieldByName('Nama Masker').AsString:=Edit2.Text;
Adoquery1.FieldByName('Tipe Masker').AsString:=ComboBox1.Text;
Adoquery1.FieldByName('Harga Masker').AsInteger:=StrToInt(Edit4.Text);
Adoquery1.FieldByName('Tanggal Jual').AsDateTime:=DateTimePicker2.Date;
Tblobfield(Adoquery1.FieldByName('Foto Masker')).LoadFromStream(stream);
Stream.Free;
Adoquery1.Post;

showMessage('Data Penjualan Masker Berhasil Ditambahkan!')
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
Stream:=TMemoryStream.create;
Image1.Picture.Graphic.SaveToStream(stream);
Stream.Position:=0;
Adoquery1.Edit;
Adoquery1.FieldByName('Kode_Masker').AsString:=Edit1.Text;
Adoquery1.FieldByName('Nama Masker').AsString:=Edit2.Text;
Adoquery1.FieldByName('Tipe Masker').AsString:=ComboBox1.Text;
Adoquery1.FieldByName('Harga Masker').AsString:=Edit4.Text;
Adoquery1.FieldByName('Tanggal Jual').AsDateTime:=DateTimePicker2.Date;
Tblobfield(Adoquery1.FieldByName('Foto Masker')).LoadFromStream(stream);
Stream.Free;
Adoquery1.Post;

showMessage('Data Penjualan Masker Berhasil Diperbarui!')
end;

procedure TForm3.Button10Click(Sender: TObject);
begin
if (application.MessageBox('Apakah Anda Yakin Ingin Menghapus Data Penjualan ini?','Peringatan!',mb_yesno or mb_iconquestion)=idyes)
then
Adoquery1.Delete;
Edit1.Clear;
Edit2.Clear;
ComboBox1.Text := 'Pilih Tipe Masker';
Edit4.Clear;
end;

procedure TForm3.Button11Click(Sender: TObject);
begin
Label7.Caption:='*otomatis terisi';
Edit1.Clear;
Edit2.Clear;
ComboBox1.Text := 'Pilih Tipe Masker';
Edit4.Clear;
Edit3.Text:=OpenPicturedialog1.FileName;
Image1.Picture.Loadfromfile('C:\CodeFighter\Delphi7\Masker Delphi 7\Gambar\Upload Image.jpg');
Edit11.Clear;
ADOQuery1.Active:=False;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Text:='select * from tabel_jual';
ADOQuery1.Active:=True;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
if openpicturedialog1.Execute then
begin
Edit3.Text:=OpenPicturedialog1.FileName;
Image1.Picture.Loadfromfile(edit3.text);
end;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
label7.Caption := Adoquery1.FieldByName('ID').AsString;
Edit1.text := Adoquery1.FieldByName('Kode_Masker').AsString;
Edit2.text := Adoquery1.FieldByName('Nama Masker').AsString;
ComboBox1.text := Adoquery1.FieldByName('Tipe Masker').AsString;
Edit4.Text := Adoquery1.FieldByName('Harga Masker').AsString;
DateTimePicker2.Date := Adoquery1.FieldByName('Tanggal Jual').AsDateTime;

Jpeg := TJpegImage.Create;
Stream := TMemoryStream.Create;
TBlobField(Adoquery1.Fieldbyname('Foto Masker')).SaveToStream(stream);
stream.Position:=0;
Jpeg.LoadFromStream(stream);
Image1.Picture.Graphic:=Jpeg;
end;

procedure TForm3.Button8Click(Sender: TObject);
begin
with ADOQuery1 do
begin
Active:=false;
SQL.Text:='select * from tabel_jual where Kode_Masker ='+QuotedStr(Edit11.Text);
Active:=True;
end;
if Adoquery1.RecordCount = 0 then
begin
MessageDlg('Data Penjualan Tidak Di Temukan!',mtInformation,[mbok],0);
edit11.clear;
ADOQuery1.Active:=False;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Text:='select * from tabel_jual';
ADOQuery1.Active:=True;
end
else
begin
DBGrid1.SetFocus;
end;
label7.Caption := Adoquery1.FieldByName('ID').AsString;
Edit1.text := Adoquery1.FieldByName('Kode_Masker').AsString;
Edit2.text := Adoquery1.FieldByName('Nama Masker').AsString;
ComboBox1.text := Adoquery1.FieldByName('Tipe Masker').AsString;
Edit4.Text := Adoquery1.FieldByName('Harga Masker').AsString;
DateTimePicker2.Date := Adoquery1.FieldByName('Tanggal Jual').AsDateTime;

Jpeg := TJpegImage.Create;
Stream := TMemoryStream.Create;
TBlobField(Adoquery1.Fieldbyname('Foto Masker')).SaveToStream(stream);
stream.Position:=0;
Jpeg.LoadFromStream(stream);
Image1.Picture.Graphic:=Jpeg;
end;


procedure TForm3.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
label7.Caption := Adoquery1.FieldByName('ID').AsString;
Edit1.text := Adoquery1.FieldByName('Kode_Masker').AsString;
Edit2.text := Adoquery1.FieldByName('Nama Masker').AsString;
ComboBox1.text := Adoquery1.FieldByName('Tipe Masker').AsString;
Edit4.Text := Adoquery1.FieldByName('Harga Masker').AsString;
DateTimePicker2.Date := Adoquery1.FieldByName('Tanggal Jual').AsDateTime;

Jpeg := TJpegImage.Create;
Stream := TMemoryStream.Create;
TBlobField(Adoquery1.Fieldbyname('Foto Masker')).SaveToStream(stream);
stream.Position:=0;
Jpeg.LoadFromStream(stream);
Image1.Picture.Graphic:=Jpeg;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
form3.Hide;
form1.show;
end;

end.
