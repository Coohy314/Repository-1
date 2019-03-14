program hodina_3_1;

type Uk = ^Uzel;

     Uzel = record
              zavazi: double;
              levaDelka, pravaDelka: double;
              levyPotomek, pravyPotomek: Uk;
            end;

     function vytvorVnitrni(hmotnostTyce,
                            delkaLevehoRamene, delkaPravehoRamene: double;
                            zavesenyLevyPotomek, zavesenyPravyPotomek: Uk
                            ): Uk;
 var vrchol: Uk;
 begin
   new(vrchol);
   with vrchol^ do
   begin
     zavazi := hmotnostTyce;
     levaDelka := delkaLevehoRamene;
     pravaDelka := delkaPravehoRamene;
     levyPotomek := zavesenyLevyPotomek;
     pravyPotomek := zavesenyPravyPotomek;
   end;
   vytvorVnitrni := vrchol;
 end;


function vytvorList(hmotnostZavazi: double): Uk;
var vrchol: Uk;
begin
  new(vrchol);
  with vrchol^ do
  begin
    zavazi := hmotnostZavazi;
    levaDelka := 0;
    pravaDelka := 0;
    levyPotomek := nil;
    pravyPotomek := nil;
  end;
  vytvorList := vrchol;
end;

function podstromvRovnovaze(strom: Uk): longint;
var hmotnost_vpravo, hmotnost_vlevo, c: double;


  if strom^.pravypotomek <> nil then
    c:=podstromvRovnovaze(strom^.pravypotomek;
    if c >0 then
      hmotnost_vpravo:= strom^.pravypotomek^.zavazi + podstromvRovnovaze(strom^.pravypotomek);
    else exit;

  if strom^.levypotomek <> nil then begin
   c:=podstromvRovnovaze(strom^.levypotomek);
   if c>0 then
     hmotnost_vlevo:= strom^.levypotomek^.zavazi + podstromvRovnovaze(strom^.levypotomek);
   else exit;


   if(strom^.pravaDelka*hmotnost_vpravo) <> (strom^.levaDelka*hmotnost_vlevo)  then begin
     podstromvRovnovaze:= -1(hmotnost_vlevo + hmotnost_vpravo);
     exit;
   end;

    podstromvRovnovaze:= hmotnost_vlevo + hmotnost_vpravo;

  end;


function vRovnovaze(strom: Uk): boolean;
var hmotnost_vpravo, hmotnost_vlevo: double;
begin
  // TODO : urcete, zda je strom zavazi v rovnovaze - ve vsech uzlech plati momentova veta

  vRovnovaze:= true;




  writeln('hmotnost_vpravo ', hmotnost_vpravo:0, ' hmotnost_vlevo ', hmotnost_vlevo:0);

 if(strom^.pravaDelka*hmotnost_vpravo) <> (strom^.levaDelka*hmotnost_vlevo)  then begin
    vRovnovaze:= false;
    exit;
  end;



end;


var a, b, c, d, e, f, g, h, i, j, k: Uk;

begin

  k := vytvorList(1);
  j := vytvorList(1);
  i := vytvorList(1);
  h := vytvorList(1);
  g := vytvorVnitrni(0, 1, 1, j, k);
  f := vytvorVnitrni(0, 9, 9, h, i);
  e := vytvorVnitrni(1, 1, 1, f, g);
  d := vytvorList(10);
  c := vytvorVnitrni(5, 1, 2, d, e);
  b := vytvorList(30);
  a := vytvorVnitrni(7, 2, 3, b, c);



  if vRovnovaze(a) then
    writeln('Zaves je v rovnovaze.')
  else
    writeln('Zaves neni v rovnovaze.');
  readln;

end.
