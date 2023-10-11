unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, winprocs,
  Vcl.Mask, math, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TCache_2 = class(TForm)
    Stringgrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Stringgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Image2Click(Sender: TObject);

    { Private declarations }
  public
    { Public declarations }
  end;

const
  m = 5;
  n = 10;

var
  Cache_2: TCache_2;
  col_1, row_1: Integer;

implementation

const
  digit: string[16] = '0123456789ABCDEF';

function Pow(base, exponent: Integer): Integer;
var // функция возведения в степень
  res: Integer;
  i: Integer;
begin
  res := 1;
  for i := 1 to exponent do
    res := res * base;
  Pow := res;
end;

function HexToBin(const HexValue: string): string;
var // перевод из 16-ричной в 2-ичную с/сч
  DecimalValue: Integer;
begin
  DecimalValue := StrToInt('$' + HexValue);
  result := '';

  while DecimalValue > 0 do
  begin
    result := IntToStr(DecimalValue mod 2) + result;
    DecimalValue := DecimalValue div 2;
  end;

  if result = '' then
    result := '0';

  result := TrimLeft(result);
end;

function BinToInt(Value: string): Integer;
// перевод из 2-ой в 10-ную с/сч
var
  i, iValueSize: Integer;
begin
  result := 0;
  iValueSize := Length(Value);
  for i := iValueSize downto 1 do
    if Value[i] = '1' then
      result := result + (1 shl (iValueSize - i));
end;

function BinToHex(binaryValue: string): string;
var // перевод из 2-ой в 16-ричн с/сч
  DecimalValue: Integer;
  hexDigits: string;
  hexResult: string;
  i: Integer;
begin
  DecimalValue := 0;
  hexDigits := '0123456789ABCDEF';
  hexResult := '';

  try
    DecimalValue := BinToInt(binaryValue);
  except
    WriteLn('Недопустимое двоичное значение');
    Exit('');
  end;

  if DecimalValue = 0 then
    hexResult := '0'

  else
  begin
    while DecimalValue > 0 do
    begin
      hexResult := hexDigits[(DecimalValue mod 16) + 1] + hexResult;
      DecimalValue := DecimalValue div 16;
    end;
  end;

  result := hexResult;
end;

function FromDec(n: Integer): string;
begin // перевод из 10-ой в 16-рич с/сч1
  result := '';
  repeat
    result := digit[(n mod 16) + 1] + result;
    n := n div 16;
  until n = 0;
end;

procedure TCache_2.FormCreate(Sender: TObject);
var
  f: Integer;
begin
  // размеры  таблиц
  StringGrid3.ColWidths[0] := 100;
  StringGrid3.ColWidths[1] := 0;
  StringGrid2.ColWidths[0] := 70;
  for var i := 1 to 2 do
    StringGrid2.ColWidths[i] := 30;

  // заполнение значениямии
  StringGrid2.cells[0, 0] := 'Тэги';
  StringGrid2.cells[1, 0] := 'V';
  StringGrid2.cells[2, 0] := 'M';
  for var i := 1 to 9 do
  begin
    StringGrid2.cells[1, i] := '1';
    StringGrid2.cells[2, i] := IntToStr(random(2));
    for var j := 0 to 9 do
    begin
      Stringgrid1.cells[0, i] := IntToStr(i);
      Stringgrid1.cells[j, i] := FromDec(random(255));
      if Length(Stringgrid1.cells[j, i]) < 2 then
        Stringgrid1.cells[j, i] := '0' + Stringgrid1.cells[j, i];
      StringGrid3.cells[0, i] := FromDec(random(8));
      StringGrid2.cells[0, i] := StringGrid3.cells[0, i]
    end;
    Stringgrid1.cells[0, 0] := '№ строки';
    for var j := 1 to 9 do
      Stringgrid1.cells[j, 0] := 'Страница ' + FromDec(j - 1);

  end;
end;

procedure TCache_2.Image2Click(Sender: TObject);
var
  r, b: Integer;
  s, s1, x: string;
  br: boolean;
begin
  br := True;
  for var i := 1 to Length(Edit1.text) do
  begin
    // обработка ошибок
    x := Edit1.text[i];
    if not'0123456789ABCDEFabcdef'.Contains(x) then
    begin
      MessageDlg('Адрес должен быть в 16-тиричной системе счисления', mtError,
        [mbOk], 0);
      br := false;
      break
    end;
  end;
  if (Length(Edit1.text) > 8) and (Length(Edit1.text) < 2) then
  begin
    MessageDlg('Недопустимый адрес.' + #13 +
      'Адресс должен быть не менее 1 байта и не более 4 байт', mtError,
      [mbOk], 0);
    Edit1.text := '';
    br := false
  end;
  if br = True then
  begin
    // выводим и зополняем строки нужными данными
    Label10.Visible := True;
    Label6.Visible := True;
    Label7.Visible := True;
    Label8.Visible := True;
    s := HexToBin(Edit1.text);
    // заполныем нулями недостоющие символы
    while Length(s) < 32 do
      s := '0' + s;
    s1 := s;
    b := 5;
    // разделяем на тетрады числа
    while Length(s1) < 39 do
    begin
      insert(' ', s1, b);
      b := b + 5;
    end;
    Label2.Caption := s1 + 'b';
    Label5.Caption := RightStr(s1, 4) + 'b(' + BinToHex(RightStr(s, 4)) + 'h)';
    Label4.Caption := RightStr(LeftStr(s1, 34), 24) + 'b(' +
      BinToHex(RightStr(LeftStr(s, 28), 20)) + 'h)';
    Label3.Caption := LeftStr(s1, 9) + 'b(' + BinToHex(LeftStr(s, 8)) + 'h)';
    for var i := 1 to n - 1 do
    begin // выполняем проверку кэша
      if (BinToHex(LeftStr(s, 8)) = StringGrid3.cells[0, i]) and
        (BinToInt(RightStr(LeftStr(s, 28), 20)) = i) then
      begin
        r := StrToInt(StringGrid3.cells[0, i]);
        col_1 := r + 1;
        row_1 := i; // присваиваем значения для изменения цвета
        Label16.Font.Color := clgreen;
        Label16.Caption := 'Cache Hit';
        break
      end
      else
      begin
        col_1 := 0;
        row_1 := 0;
        Label16.Font.Color := clred;
        Label16.Caption := 'Cache Miss'
      end;
    end;
    StringGrid3.invalidate;
    Stringgrid1.invalidate;
  end;
end;

procedure TCache_2.Stringgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  if ACol <> 0 then
  begin // закрашиваем нужные ячейки
    if (ACol = col_1) and (ARow = row_1) then
      Stringgrid1.Canvas.Brush.Color := clmoneygreen
  end
  else
    Stringgrid1.Canvas.Brush.Color := clwindow;
  // выравнивание и заполнение текста
  Stringgrid1.Canvas.FillRect(Rect);
  StrPCopy(c, Stringgrid1.cells[ACol, ARow]);
  winprocs.DrawText(Stringgrid1.Canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);
end;

procedure TCache_2.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  // выравнивание и заполнение текста
  StringGrid2.Canvas.Brush.Color := clwindow;
  StringGrid2.Canvas.FillRect(Rect);
  StrPCopy(c, StringGrid2.cells[ACol, ARow]);
  winprocs.DrawText(StringGrid2.Canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);

end;

procedure TCache_2.StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin // окрашивание нужных ячеек
  if (ACol = 0) and (ARow = row_1) and (ARow <> 0) then
    StringGrid3.Canvas.Brush.Color := clGradientActiveCaption
  else
    StringGrid3.Canvas.Brush.Color := clwindow;
  // выравнивание и заполнение текста
  StringGrid3.Canvas.FillRect(Rect);
  StrPCopy(c, StringGrid3.cells[ACol, ARow]);
  winprocs.DrawText(StringGrid3.Canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);

end;

{$R *.dfm}

end.
