unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ShellApi,
  Vcl.Controls, Vcl.Forms, StrUtils, Vcl.Dialogs, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.Menus, Vcl.ComCtrls;

type
  TTests = class(TForm)
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    ProgressBar1: TProgressBar;
    procedure RadioGroup1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tests: TTests;
  f: text;
  s: string;
  Nvern, ball: integer;

implementation

{$R *.dfm}

uses unit4, unit8;

procedure TTests.Image4Click(Sender: TObject);
var
  n: integer;
begin
  if (RadioGroup2.ItemIndex > -1) and (not Eof(f)) then
  begin
    if RadioGroup2.ItemIndex = Nvern - 1 then
      ball := ball + 1;
    // Если выбранный вариант соответствует номеру верного ответа то балл прибавляется
    RadioGroup2.Items.Clear; // и очищается поле для следующего вопроса
    Repeat
      if (s[1] = '-') then
      begin
        delete(s, 1, 1);
        for var i := 70 to Length(s) do
        begin // заполнение строки с вопросом
          if s[i] = ' ' then
          begin // разделяя ее на две
            s := LeftStr(s, i) + #13#10 + RightStr(s, Length(s) - i);
            break
          end;
        end;
        Label2.Caption := s
      end
      else if s[1] = '*' then // правильный вариант ответа
      begin
        delete(s, 1, 1);
        Nvern := StrToInt(s);
      end
      else
        RadioGroup2.Items.Add(s); // добавление вариантов ответа
      readln(f, s);
      Label1.Caption := s;
    until (s[1] = '-') or (Eof(f));
  end
  // Если конец файла достигнут, значит вопросы закончились
  Else if Eof(f) then
  begin
    delete(s, 1, 1);
    Nvern := StrToInt(s);
    if RadioGroup2.ItemIndex = Nvern - 1 then
      ball := ball + 1;
    Label1.Visible := true;
    n := ball;
    Label1.Caption := 'Ваш результат : ' + IntToStr(n) + '/6';
    // Вывод количества баллов
    CloseFile(f);
    Label2.Caption := '';
    Image1.Visible := false;
    Image2.Visible := false;
    ProgressBar1.Position := round(ball * 16.6666666667);
    // заполнение прогрессбара
    ProgressBar1.Visible := true;
    RadioGroup2.Items.Clear; // очистка вариантов ответа
    RadioGroup1.Enabled := true; // выбор варианта активен снова
    RadioGroup2.Enabled := false;
    Image4.Enabled := false;
    // кнопка становится недоступной в завершении проекта
  end;
end;

procedure TTests.N1Click(Sender: TObject);
begin
  Mymenu.show;
  Tests.Close; // переход в меню
end;

procedure TTests.N2Click(Sender: TObject); // открытие справки
begin
  ShellExecute(0, PChar('Open'), PChar('help.chm'), nil, nil, SW_SHOW);
end;

procedure TTests.N3Click(Sender: TObject);
begin
  Splash_screen.Close; // выход из программы
  Tests.Close
end;

procedure TTests.RadioGroup1Click(Sender: TObject);
begin
  RadioGroup1.Enabled := false; // Выбор варианта становится недоступен
  RadioGroup2.Visible := true;
  RadioGroup2.Enabled := true; // Доступным становится поле с вопросом
  Image4.Enabled := true;
  ProgressBar1.Visible := false;
  Image4.Visible := true; // Кнопка Далее
  case RadioGroup1.ItemIndex of
    // В зависимости от выбранного варианта переменная f
    0:
      begin
        Label1.Visible := false;
        Image1.Visible := true;
        Image2.Visible := false;
        AssignFile(f, ExtractFilePath(paramStr(0)) + 'Tests\variant1.txt');
      end;
    // связывается с разными файлами
    1:
      begin
        Label1.Visible := false;
        Image2.Visible := true;
        Image1.Visible := false;
        AssignFile(f, ExtractFilePath(paramStr(0)) + 'Tests\variant2.txt');
      end;
  end;
  reset(f); // Открываем файл для чтения
  readln(f, s); // Считываем первую строку из файла
  ball := 0; // изначально количество баллов 0
  repeat
    if (s[1] = '-') then
    begin // Если первый символ строки ‘-‘ значит это вопрос
      delete(s, 1, 1);
      for var i := 70 to Length(s) do
      begin
        if s[i] = ' ' then
        begin
          s := LeftStr(s, i) + #13#10 + RightStr(s, Length(s) - i);
          break
        end;
      end;
      Label2.Caption := s
    end
    else if s[1] = '*' then
    begin // Если перв символ ‘*’ значит это номер верного ответа
      delete(s, 1, 1);
      Nvern := StrToInt(s);
    end
    else
      RadioGroup2.Items.Add(s); // Иначе это вариант ответа
    readln(f, s); // Считываем следующую строку из файла
  until (s[1] = '-') or (Eof(f));
end;

end.
