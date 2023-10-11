unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, winprocs, StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TCache_3 = class(TForm)
    Label1: TLabel;
    StringGrid2: TStringGrid;
    StringGrid1: TStringGrid;
    StringGrid7: TStringGrid;
    StringGrid4: TStringGrid;
    Label9: TLabel;
    Edit1: TEdit;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    StringGrid3: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid7DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid5DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid6DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid4DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cache_3: TCache_3;
  col_1, row_1, col_2, row_2, col_3, row_3: Integer;

implementation

{$R *.dfm}

const
  digit: string[16] = '0123456789ABCDEF';

function Pow(base, exponent: Integer): Integer;
var // возведение в степень
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

procedure TCache_3.FormCreate(Sender: TObject);
var
  s: string;
begin
  // размеры
  for var i := 1 to 2 do
  begin
    StringGrid2.ColWidths[i] := 30;
    StringGrid1.ColWidths[i] := 30;
    StringGrid3.ColWidths[i] := 30;
  end;
  StringGrid2.ColWidths[0] := 70;
  StringGrid1.ColWidths[0] := 70;
  StringGrid3.ColWidths[0] := 70;
  StringGrid7.RowHeights[0] := 40;
  // заполнение
  StringGrid7.cells[0, 0] := '‘лаги' + #13 + 'обращени€';
  StringGrid2.cells[0, 0] := '“эги';
  StringGrid2.cells[1, 0] := 'V';
  StringGrid2.cells[2, 0] := 'M';
  StringGrid1.cells[0, 0] := '“эги';
  StringGrid1.cells[1, 0] := 'V';
  StringGrid1.cells[2, 0] := 'M';
  StringGrid3.cells[0, 0] := '“эги';
  StringGrid3.cells[1, 0] := 'V';
  StringGrid3.cells[2, 0] := 'M';
  for var i := 1 to 9 do
  begin
    StringGrid7.cells[0, i] := '0';
    StringGrid1.cells[1, i] := '1';
    StringGrid1.cells[2, i] := IntToStr(random(2));
    StringGrid1.cells[0, i] := IntToStr(random(78));
    StringGrid2.cells[1, i] := '1';
    StringGrid2.cells[2, i] := IntToStr(random(2));
    StringGrid2.cells[0, i] := IntToStr(random(78));
    StringGrid3.cells[1, i] := '1';
    StringGrid3.cells[2, i] := IntToStr(random(2));
    StringGrid3.cells[0, i] := IntToStr(random(78));
    // значени€ банков
    StringGrid4.cells[0, i] := StringGrid1.cells[0, i];
    StringGrid5.cells[0, i] := StringGrid2.cells[0, i];
    StringGrid6.cells[0, i] := StringGrid3.cells[0, i];
    StringGrid4.cells[0, 0] := 'Ѕанк 0';
    StringGrid5.cells[0, 0] := 'Ѕанк 1';
    StringGrid6.cells[0, 0] := 'Ѕанк 2';

  end;

end;

procedure TCache_3.Image2Click(Sender: TObject);
var
  r, b: Integer;
  s, s1, x: string;
  br, prov_1, prov_2, prov_3: boolean;
begin
  br := True;
  for var i := 1 to Length(Edit1.text) do
  begin
    // обработка ошибок
    x := Edit1.text[i];
    if not'0123456789ABCDEFabcdef'.Contains(x) then
    begin
      MessageDlg('јдрес должен быть в 16-тиричной системе счислени€', mtError,
        [mbOk], 0);
      br := false;
      break
    end;
  end;
  if (Length(Edit1.text) > 8) and (Length(Edit1.text) < 2) then
  begin
    MessageDlg('Ќедопустимый адрес.' + #13 +
      'јдресс должен быть не менее 1 байта и не более 4 байт', mtError,
      [mbOk], 0);
    Edit1.text := '';
    br := false
  end;
  if br = True then
  begin
    prov_3 := True;
    prov_1 := True;
    prov_2 := True;
    Label10.Visible := True;
    Label6.Visible := True;
    Label7.Visible := True;
    Label8.Visible := True;
    s := HexToBin(Edit1.text);
    while Length(s) < 32 do
      s := '0' + s;
    s1 := s;
    b := 5;
    while Length(s1) < 39 do
    begin
      insert(' ', s1, b);
      b := b + 5;
    end;
    // заполнение надписей данными
    Label2.Caption := s1 + 'b';
    Label5.Caption := RightStr(s1, 4) + 'b(' + BinToHex(RightStr(s, 4)) + 'h)';
    Label4.Caption := RightStr(LeftStr(s1, 34), 24) + 'b(' +
      BinToHex(RightStr(LeftStr(s, 28), 20)) + 'h)';
    Label3.Caption := LeftStr(s1, 9) + 'b(' + BinToHex(LeftStr(s, 8)) + 'h)';
    for var i := 1 to 9 do
    begin
      if ((BinToHex(LeftStr(s, 8)) = StringGrid1.cells[0, i])) then
      begin // проверка значени€ в 1 таблице
        col_1 := 0; // присваивание значений дл€ цвета
        row_1 := i;
        StringGrid1.invalidate;
        prov_1 := false;
        prov_2 := false;
        prov_3 := false;
        StringGrid7.cells[0, i] := '1';
        Label13.Caption := 'Cache Hit';
        Label13.Font.Color := clgreen;
        break
      end
      else
      begin
        row_1 := 0;
        StringGrid7.cells[0, i] := '0';
      end;
      StringGrid1.invalidate;
    end;
    if prov_1 = True then // если в 1 не было нужного
    begin // проверка значени€ во 2 таблице
      for var i := 1 to 9 do
      begin
        if ((BinToHex(LeftStr(s, 8)) = StringGrid2.cells[0, i])) then
        begin
          col_2 := 0; // присваивание значений дл€ цвета
          row_2 := i;
          StringGrid7.cells[0, i] := '1';
          StringGrid2.invalidate;
          prov_1 := false;
          prov_2 := false;
          prov_3 := false;
          Label13.Caption := 'Cache Hit';
          Label13.Font.Color := clgreen;
          break;
        end
        else
        begin
          row_2 := 0;
          StringGrid7.cells[0, i] := '0';
        end;
        StringGrid2.invalidate;
      end;

    end;
    if prov_2 = True then // если в 1 во 2 таблице не было нужного значени€
    begin // проверка значени€ в 3 таблице
      for var i := 1 to 9 do
      begin
        if ((BinToHex(LeftStr(s, 8)) = StringGrid3.cells[0, i])) then
        begin
          col_3 := 0;
          row_3 := i; // присваивание значений дл€ цвета
          StringGrid3.invalidate;
          StringGrid7.cells[0, i] := '1';
          Label13.Caption := 'Cache Hit';
          Label13.Font.Color := clgreen;
          prov_1 := false;
          prov_2 := false;
          prov_3 := false;
          break;
        end
        else
        begin
          row_3 := 0;
          StringGrid7.cells[0, i] := '0';
        end;
        StringGrid3.invalidate;
      end;
    end;
    StringGrid4.invalidate; // обновление таблиц
    StringGrid5.invalidate;
    StringGrid6.invalidate;
  end;
  if (prov_1 = True) and (prov_2 = True) and (prov_3 = True) then
  begin // не было подход€щей €чейки
    Label13.Caption := 'Cache Miss';
    Label13.Font.Color := clred;
  end;

end;

procedure TCache_3.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  if ARow <> 0 then
  begin // если €чейка подходит - закрашиваем
    if (ACol = 0) and (ARow = row_1) then
      StringGrid1.Canvas.Brush.Color := clmoneygreen
  end
  else
    StringGrid1.Canvas.Brush.Color := clwindow;
  // выравнивание и заполнение текста
  StringGrid1.Canvas.FillRect(Rect);
  StrPCopy(c, StringGrid1.cells[ACol, ARow]);
  winprocs.DrawText(StringGrid1.Canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);
end;

procedure TCache_3.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  if ARow <> 0 then
  begin // если €чейка подходит - закрашиваем
    if (ACol = 0) and (ARow = row_2) then
      StringGrid2.Canvas.Brush.Color := clmoneygreen
  end
  else
    StringGrid2.Canvas.Brush.Color := clwindow;
  // выравнивание и заполнение текста
  StringGrid2.Canvas.FillRect(Rect);
  StrPCopy(c, StringGrid2.cells[ACol, ARow]);
  winprocs.DrawText(StringGrid2.Canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);
end;

procedure TCache_3.StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  if ARow <> 0 then
  begin // если €чейка подходит - закрашиваем
    if (ACol = 0) and (ARow = row_3) then
      StringGrid3.Canvas.Brush.Color := clmoneygreen
  end
  else
    StringGrid3.Canvas.Brush.Color := clwindow;
  // выравнивание и заполнение текста
  StringGrid3.Canvas.FillRect(Rect);
  StrPCopy(c, StringGrid3.cells[ACol, ARow]);
  winprocs.DrawText(StringGrid3.Canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);
end;

procedure TCache_3.StringGrid4DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  if ARow <> 0 then
  begin // если €чейка подходит - закрашиваем
    if (ACol = col_1) and (ARow = row_1) then
      StringGrid4.Canvas.Brush.Color := clmoneygreen
  end
  else
    StringGrid4.Canvas.Brush.Color := clwindow;
  // выравнивание и заполнение текста
  StringGrid4.Canvas.FillRect(Rect);
  StrPCopy(c, StringGrid4.cells[ACol, ARow]);
  winprocs.DrawText(StringGrid4.Canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);
end;

procedure TCache_3.StringGrid5DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  if ARow <> 0 then
  begin // если €чейка подходит - закрашиваем
    if (ACol = col_2) and (ARow = row_2) then
      StringGrid5.Canvas.Brush.Color := clmoneygreen
  end
  else
    StringGrid5.Canvas.Brush.Color := clwindow;
  // выравнивание и заполнение текста
  StringGrid5.Canvas.FillRect(Rect);
  StrPCopy(c, StringGrid5.cells[ACol, ARow]);
  winprocs.DrawText(StringGrid5.Canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);
end;

procedure TCache_3.StringGrid6DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  if ARow <> 0 then
  begin // если €чейа подходит - закрашиваем
    if (ACol = col_3) and (ARow = row_3) then
      StringGrid6.Canvas.Brush.Color := clmoneygreen
  end
  else
    StringGrid6.Canvas.Brush.Color := clwindow;
  // выравнивание и заполнение текста
  StringGrid6.Canvas.FillRect(Rect);
  StrPCopy(c, StringGrid6.cells[ACol, ARow]);
  winprocs.DrawText(StringGrid6.Canvas.Handle, c, StrLen(c), Rect,
    DT_Center or DT_VCenter or DT_Singleline);
end;

procedure TCache_3.StringGrid7DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  format: word;
  c: array [0 .. 255] of char;
begin
  StringGrid7.Canvas.Brush.Color := clwindow;
  // выравнивание и заполнение текста
  StringGrid7.Canvas.FillRect(Rect);
  StrPCopy(c, StringGrid7.cells[ACol, ARow]);
  if ARow = 0 then
    winprocs.DrawText(StringGrid7.Canvas.Handle, c, StrLen(c), Rect,
      DT_Center or DT_VCenter)
  else
    winprocs.DrawText(StringGrid7.Canvas.Handle, c, StrLen(c), Rect,
      DT_Center or DT_VCenter or DT_Singleline);

end;

end.
