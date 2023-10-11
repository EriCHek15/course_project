unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ComCtrls, Vcl.Samples.Gauges, Vcl.Imaging.pngimage;

type
  TSplash_screen = class(TForm)
    Label1: TLabel;
    Gauge1: TGauge;
    Timer1: TTimer;
    Label2: TLabel;
    Timer2: TTimer;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Splash_screen: TSplash_screen;

implementation

uses unit4;
{$R *.dfm}

procedure TSplash_screen.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := true; // таймер активен
end;

procedure TSplash_screen.Timer1Timer(Sender: TObject);
begin
  if Timer1.Enabled = true then
    Gauge1.Progress := Gauge1.Progress + 1; // даижение строки загрузки
  if Gauge1.Progress = 100 then
  Begin
    MyMenu.Show; // когда строка загрузки заполнена,
    Splash_screen.hide; // открываетс€ главна€ форма
    Timer1.Interval := 0;
  End;
end;

procedure TSplash_screen.Timer2Timer(Sender: TObject);
begin
  if length(Label2.Caption) = 11 then // анимаци€ надписи '«агрузка'
    Label2.Caption := '«агрузка'
  else
    Label2.Caption := Label2.Caption + '.'
end;

end.
