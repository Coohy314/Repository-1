program palindrom;


procedure posun_znaku(var c: char);
begin

    if (ord(c) = 32)  or (ord(c) = 46) then
    else if ord(c) < 122 then
      c:= chr(ord(c) +1)
    else
      c:= chr(ord(c) - 25);

end;

procedure posun_vsechny_znaky(var s: string);
var i: longword;
var o:longword;

begin
  for i:=1 to Length(s) do
    posun_znaku(s[i]);

end;

procedure na_mala_pismena(var s: string);
var i: longword;
begin
   for i:=1 to Length(s) do
     if(s[i] >= 'A') and (s[i] <= 'Z') then
       s[i] := chr(ord(s[i]) + 32);
end;


var slovo: string;
var i: integer;

begin

  readln(slovo);
  na_mala_pismena(slovo);

  for i:=1 to 30 do begin
    posun_vsechny_znaky(slovo);
    writeln(slovo);
    writeln;
  end;


  readln;

end.

