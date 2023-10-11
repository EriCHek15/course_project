unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, unit5, unit6, unit8, ShellApi, unit7, Vcl.Menus,
  Vcl.Imaging.jpeg;

type
  TMyMenu = class(TForm)
    Label1: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MyMenu: TMyMenu;

implementation

{$R *.dfm}

procedure TMyMenu.Image2Click(Sender: TObject);
begin // открытие формы с теорией
  MyMenu.close();
  Teory.Show()
end;

procedure TMyMenu.Image3Click(Sender: TObject);
begin // открытие формы с визуализацией
  MyMenu.close();
  Vizualization.Show
end;

procedure TMyMenu.Image4Click(Sender: TObject);
begin // открытие формы с тестами
  MyMenu.close();
  Tests.Show
end;

procedure TMyMenu.Image5Click(Sender: TObject);
begin // закрытие программы
  Splash_screen.close();
  MyMenu.close()
end;

procedure TMyMenu.N1Click(Sender: TObject);
begin // закрытие программы
  Splash_screen.close();
  MyMenu.close()
end;

procedure TMyMenu.N2Click(Sender: TObject);
begin // справка
  ShellExecute(0, PChar('Open'), PChar('help.chm'), nil, nil, SW_SHOW);
end;

end.
