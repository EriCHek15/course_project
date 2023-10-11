unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.OleCtrls, ComObj, ShellApi, SHDocVw,
  Vcl.OleCtnrs, Vcl.Menus;

type
  TTeory = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    WebBrowser1: TWebBrowser;
    TabSheet2: TTabSheet;
    WebBrowser2: TWebBrowser;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    TabSheet3: TTabSheet;
    WebBrowser3: TWebBrowser;
    N5: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Teory: TTeory;

implementation

{$R *.dfm}

uses unit4, unit8;

procedure TTeory.FormCreate(Sender: TObject);
begin // загрузка информации в веббраузеры
  WebBrowser1.Navigate(ExtractfilePath(paramstr(0)) + 'Теория\_КЭШ.htm');
  WebBrowser2.Navigate(ExtractfilePath(paramstr(0)) + 'Теория\Кэш.htm');
  WebBrowser3.Navigate(ExtractfilePath(paramstr(0)) +
    'Теория\Задание теги_примеры.htm');
end;

procedure TTeory.N1Click(Sender: TObject);
begin
  Teory.Close();
  Splash_screen.Close(); // закрытие программы
end;

procedure TTeory.N2Click(Sender: TObject);
begin // открыте справки
  ShellExecute(0, PChar('Open'), PChar('help.chm'), nil, nil, SW_SHOW);
end;

procedure TTeory.N5Click(Sender: TObject);
begin // переход на главную формуb
  Teory.Close();
  MyMenu.show;
end;

end.
