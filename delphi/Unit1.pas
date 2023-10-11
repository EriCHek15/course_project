unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, winprocs,
  Vcl.Mask, math, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TCache_1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Label1: TLabel;
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
    Image1: TImage;
    Image2: TImage;

    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  n = 16;
  m = 10;

var
  Cache_1: TCache_1;
  Row, Col, row_1, col_1: Integer;
  r, colo: boolean;

implementation

const
  digit: string[16] = '0123456789ABCDEF';

function Pow(base, exponent: Integer): Integer;
var
  res: Integer;
  i: Integer;
begin
  res := 1; // функци€ дл€ возведени€ в степень
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

var
  i, iValueSize: Integer;
begin // перевод из 2-ой в 10-ную с/сч
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
    WriteLn('Ќедопустимое двоичное значение');
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

procedure TCache_1.FormCreate(Sender: TObject);
begin
  colo := false;
  r := false;
  for var i := 0 to n - 2 do
  begin
    // заполнение €чеек стринггрид
    // тег
    StringGrid1.cells[1, i] := FromDec(random(100));
    if Length(StringGrid1.cells[1, i]) = 1 then
      StringGrid1.cells[1, i] := '0' + StringGrid1.cells[1, i];
    // нумераци€ строк
    StringGrid1.cells[0, i] := FromDec(i);
    // номера столбцов
    StringGrid1.cells[i + 2, n - 1] := IntToStr(i);
    // заполнение €чеек
    for var j := 2 to m - 1 do
    begin
      StringGrid1.cells[j, i] := FromDec(random(255));
      for var f := 0 to n - 2 do
      begin
        // если такой тег есть
        if StringGrid1.cells[1, f] = StringGrid1.cells[j, i] then
          StringGrid1.cells[j, i] := FromDec(random(100));
      end;
      if Length(StringGrid1.cells[j, i]) = 1 then
        StringGrid1.cells[j, i] := '0' + StringGrid1.cells[j, i]
    end;
  end;
  StringGrid1.cells[1, n - 1] := '“ег';
end;

procedure TCache_1.Image2Click(Sender: TObject);
var
  g, b: Integer;
  address, x, bin_val, hex_val, dd: string;
  br: boolean;
begin
  br := True;
  for var i := 1 to Length(Edit1.text) do
  begin
    x := Edit1.text[i];
    if not'0123456789ABCDEFabcdef'.Contains(x) then
    begin // проверка, €вл€етс€ ли число 16-рчиным
      MessageDlg('јдрес должен быть в 16-тиричной системе счислени€', mterror,
        [mbOk], 0);
      br := false;
      break
    end;
  end;
  if (Length(Edit1.text) > 6) or (Length(Edit1.text) < 2) then
  begin // проверка, на длинну адреса
    MessageDlg('Ќедопустимый адрес.' + #13 +
      'јдресс должен быть не менне 1 байта и не более 3 байт', mterror,
      [mbOk], 0);
    Edit1.text := '';
    br := false
  end;
  if br = True then
  begin
    // разделение адреса и перевод в другие с/сч
    // вывод этого в label'ы
    Label7.Caption := HexToBin(Edit1.text);
    address := HexToBin(Edit1.text);
    bin_val := LeftStr(address, Length(Label7.Caption) - 3);
    // заполение недостающих символов нул€ми
    while Length(bin_val) <> 20 do
      bin_val := '0' + bin_val;
    while Length(Label7.Caption) <> 24 do
      Label7.Caption := '0' + Label7.Caption;
    b := 5;
    dd := Label7.Caption;
    while Length(dd) <> 29 do
    begin
      insert(' ', dd, b);
      b := b + 5;
    end;
    // показ всех надписей
    Label7.Caption := dd + 'b';
    Label3.Visible := True;
    Label4.Visible := True;
    Label9.Visible := True;
    Label10.Caption := '16 мб';
    hex_val := BinToHex(bin_val);
    while Length(hex_val) < 2 do
      hex_val := '0' + hex_val;
    dd := bin_val;
    b := 5;
    while Length(dd) <> 24 do
    begin
      insert(' ', dd, b);
      b := b + 5;
    end;
    Label1.Caption := dd + '(' + hex_val + 'h)';
    Label2.Caption := RightStr(address, 3) + '(' +
      BinToHex(RightStr(address, 3)) + 'h)';

    for var i := 0 to n - 2 do
    begin
      if StringGrid1.cells[1, i] = hex_val then
      begin // если €чейка найдена, то высвечиваетс€ надпись cache hit
        Label6.font.Color := clgreen;
        Label6.Caption := 'cache hit';
        Row := i; // значение столбца и строки дл€ drawcells
        Col := StrToInt(BinToHex(RightStr(address, 3))) + 2;
        colo := True;
        Label12.Caption := StringGrid1.cells[Col, Row];
        Label11.Visible := True; // по€вл€ютс€ надписи с данными в цп
        Label12.Visible := True;
        StringGrid1.Invalidate; // обновление таблицы
        break
      end
      else
      begin // если нет подход€щей €чейки, то высвечиваетс€ надпись cache miss
        Label11.Visible := false; // и убираютс€ ненужные строки
        Label12.Visible := false;
        colo := false;
        Label6.font.Color := clred;
        Label6.Caption := 'cache miss';
      end;

    end;
  end;
  StringGrid1.Invalidate
end;

procedure TCache_1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  if colo = false then // если кэш не нашелс€, то цвет окна
    StringGrid1.canvas.brush.Color := clwindow
  else if ((ARow = Row) and (ACol = Col) and (Col <> 0)) then
    StringGrid1.canvas.brush.Color := clmoneygreen
    // нужна€ €чейка выдел€етс€ зеленым
  else if (ARow = Row) and (ACol <> Col) and (ACol <> 0) and (ACol <> 1) then
    StringGrid1.canvas.brush.Color := clmenu // нужна€ строка выдел€етс€ серым
  else if (ARow = Row) and (ACol = 1) then
    StringGrid1.canvas.brush.Color := clGradientActiveCaption
    // €чейка тега выдел€етс€ синим
  else
    StringGrid1.canvas.brush.Color := clwindow; // иначе цвет окна
  StringGrid1.canvas.FillRect(Rect);
  // копирование и вставка строки из €чейки в перекрашеную €чейку
  StrPCopy(c, StringGrid1.cells[ACol, ARow]);
  winprocs.DrawText(StringGrid1.canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);
end;

{$R *.dfm}

end.
