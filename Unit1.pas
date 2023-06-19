unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ADODB, Grids, DBGrids, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    cht1: TChart;
    brsrsSeries1: TBarSeries;
    dbgrd1: TDBGrid;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    con1: TADOConnection;
    qry1: TADOQuery;
    ds1: TDataSource;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    frxdbdtst2: TfrxDBDataset;
    frxrprt2: TfrxReport;
    qry2: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
 