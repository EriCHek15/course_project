program Cache;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Cache_1},
  Unit2 in 'Unit2.pas' {Cache_2},
  Unit3 in 'Unit3.pas' {Cache_3},
  Unit4 in 'Unit4.pas' {MyMenu},
  Unit5 in 'Unit5.pas' {Teory},
  Unit6 in 'Unit6.pas' {Vizualization},
  Unit7 in 'Unit7.pas' {Tests},
  Unit8 in 'Unit8.pas' {Splash_screen};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := false;
  Application.CreateForm(TSplash_screen, Splash_screen);
  Application.CreateForm(TMyMenu, MyMenu);
  Application.CreateForm(TTests, Tests);
  Application.CreateForm(TCache_3, Cache_3);
  Application.CreateForm(TCache_2, Cache_2);
  Application.CreateForm(TCache_1, Cache_1);
  Application.CreateForm(TTeory, Teory);
  Application.CreateForm(TVizualization, Vizualization);
  Application.Run;
end.
