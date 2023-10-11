unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids, unit1, unit2,
  unit3,
  Vcl.StdCtrls, StrUtils, winprocs, ShellApi,
  Vcl.Mask, math, Vcl.ExtCtrls, Vcl.Menus;

type
  TVizualization = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Vizualization: TVizualization;
  Form1: TCache_1;
  Form2: TCache_2;
  Form3: TCache_3;

implementation

{$R *.dfm}

uses unit8, unit4;

procedure TVizualization.FormCreate(Sender: TObject);
begin
  // присвоение tabsheet'ам форм с визуализацией
  Form1 := TCache_1.Create(self);
  Form1.Parent := TabSheet1;
  Form1.BorderStyle := bsnone;
  Form1.Align := alclient;
  Form1.Show;
  Form2 := TCache_2.Create(self);
  Form2.Parent := TabSheet2;
  Form2.BorderStyle := bsnone;
  Form2.Align := alclient;
  Form2.Show;
  Form3 := TCache_3.Create(self);
  Form3.Parent := TabSheet3;
  Form3.BorderStyle := bsnone;
  Form3.Align := alclient;
  Form3.Show;

end;

procedure TVizualization.N1Click(Sender: TObject);
begin
  Splash_screen.close();
  Vizualization.close(); // закрытие программы
end;

procedure TVizualization.N2Click(Sender: TObject);
begin // открытие справки
  ShellExecute(0, PChar('Open'), PChar('help.chm'), nil, nil, SW_SHOW);
end;

procedure TVizualization.N3Click(Sender: TObject);
begin // возврат в меню
  MyMenu.Show();
  Vizualization.close()
end;

end.
