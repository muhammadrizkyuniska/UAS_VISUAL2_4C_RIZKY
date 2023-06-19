unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    cbb1: TComboBox;
    dtp1: TDateTimePicker;
    edt5: TEdit;
    edt6: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    qry1: TADOQuery;
    con1: TADOConnection;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm9.kumpul;
begin
  Form9.qry1.SQL.Clear;
  Form9.qry1.SQL.Add('select * from jadwal_table');
  Form9.qry1.Open;


  dbgrd1.Columns[0].Width:=20;
  dbgrd1.Columns[1].Width:=60;
  dbgrd1.Columns[2].Width:=60;
  dbgrd1.Columns[3].Width:=90;
  dbgrd1.Columns[4].Width:=90;
  dbgrd1.Columns[5].Width:=60;
  dbgrd1.Columns[6].Width:=110;
  dbgrd1.Columns[7].Width:=80;

    btn3.Enabled := False;
    btn4.Enabled := False;
    btn2.Enabled := False;
    btn1.Enabled := True;

end;


procedure TForm2.btn1Click(Sender: TObject);
var
  i : string;
begin
  if MessageDlg('APAKAH ANDA INGIN MENAMBAH DATA BARU?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with Form9.qry1 do
    begin
      SQL.Clear;
      SQL.Add('select count(*) from jadwal_table');
      Open;
      i := IntToStr(Fields[0].AsInteger + 1);

      SQL.Clear;
      SQL.Add('insert into jadwal_table values("'+i+'","'+edt3.Text+'","'+edt4.Text+'","'+cbb1.Text+'","'+FormatDateTime('yyyy-mm-dd',dtp1.Date)+'","'+edt5.Text+'","'+edt2.Text+'","'+edt1.Text+'","'+edt6.Text+'")');
      ExecSQL;

      kumpul;
    end;
  end
  else
  begin
    ShowMessage('DATA BARU BATAL DITAMBAH');
  end;
  
  edt1.Text:='';
  edt2.Text:='';
  edt3.Text:='';
  edt4.Text:='';
  edt5.Text:='';
  edt6.Text:='';
  cbb1.Text:='';
  dtp1.Date:=Now;
end;

procedure TForm2.btn2Click(Sender: TObject);
var
  I : string;
begin
  if MessageDlg('APAKAH ANDA INGIN MENYIMPAN DATA INI?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with Form9.qry1 do
    begin
      SQL.Clear;
      SQL.Add('select count(*) from jadwal_table');
      Open;
      i := IntToStr(Fields[0].AsInteger + 1);

      SQL.Clear;
      SQL.Add('insert into jadwal_table values("'+i+'","'+edt3.Text+'","'+edt4.Text+'","'+cbb1.Text+'","'+FormatDateTime('yyyy-mm-dd',dtp1.Date)+'","'+edt5.Text+'","'+edt2.Text+'","'+edt1.Text+'","'+edt6.Text+'")');
      ExecSQL;

      kumpul;
    end;
  end
  else
  begin
    ShowMessage('DATA BATAL DISIMPAN');
  end;
  edt1.Text:='';
  edt2.Text:='';
  edt3.Text:='';
  edt4.Text:='';
  edt5.Text:='';
  edt6.Text:='';
  cbb1.Text:='';
  dtp1.Date:=Now;

  kumpul;
end;

procedure TForm2.btn3Click(Sender: TObject);
var
  i : string;
begin
  i := qry1.FieldByName('id').AsString;

  with qry1 do
  begin
    SQL.Text := 'UPDATE jadwal_table SET jam_mulai = :jamMulai, jam_akhir = :jamAkhir, hari = :Hari, tanggal = :Tanggal, ruang = :Ruang, matkul = :Matkul, kelas = :Kelas, kehadiran_total = :kehadiranTotal WHERE id = :id';
    Parameters.ParamByName('jamMulai').Value := edt3.Text;
    Parameters.ParamByName('jamAkhir').Value := edt4.Text;
    Parameters.ParamByName('Hari').Value := cbb1.Text;
    Parameters.ParamByName('Tanggal').Value := FormatDateTime('yyyy-mm-dd',dtp1.Date);
    Parameters.ParamByName('Ruang').Value := edt5.Text;
    Parameters.ParamByName('Matkul').Value := edt2.Text;
    Parameters.ParamByName('Kelas').Value := edt1.Text;
    Parameters.ParamByName('kehadiranTotal').Value := edt6.Text;
    Parameters.ParamByName('id').Value := i;
    ExecSQL;

    kumpul;
  end;
end;

procedure TForm2.btn4Click(Sender: TObject);
var
  i : string;
begin
  if MessageDlg('APAKAH ANDA INGIN MENGHAPUS DATA INI?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    i := qry1.FieldByName('id').AsString;

    qry1.SQL.Text := 'DELETE FROM jadwal_table WHERE id = :id';
    qry1.Parameters.ParamByName('id').Value := i;
    qry1.ExecSQL;

    kumpul;
  end
  else
  begin
    ShowMessage('DATA BATAL DIHAPUS');
  end;
end;

procedure TForm2.dbgrd1CellClick(Column: TColumn);
var
  i : Integer;
begin
  try
  i := Form9.qry1.Fields[0].AsInteger;
  edt3.Text:=Form9.qry1.Fields[1].AsString;
  edt4.Text:=Form9.qry1.Fields[2].AsString;
  cbb1.Text:=Form9.qry1.Fields[3].AsString;
  dtp1.Date:=Form9.qry1.Fields[4].AsDateTime;
  edt5.Text:=Form9.qry1.Fields[5].AsString;
  edt2.Text:=Form9.qry1.Fields[6].AsString;
  edt1.Text:=Form9.qry1.Fields[7].AsString;
  edt6.Text:=Form9.qry1.Fields[8].AsString;
  except
  end;

    btn3.Enabled := True;
    btn4.Enabled := True;
    btn2.Enabled := True;
    btn1.Enabled := False;
end;

procedure TForm2.btn5Click(Sender: TObject);
begin
  close;
end;

end.
