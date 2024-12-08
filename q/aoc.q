\e 1
\c 50 200
\l santas_helpers.q

day_1:{[input]
  f:"J"$flip "   " vs/: read0 hsym `$input;
  sorted_f:asc each f;
  0N!"Part One: ",string sum abs (-). sorted_f;
  0N!"Part Two: ",string sum sorted_f[0] * sum each sorted_f[0]=\: sorted_f[1];  
 }


day_2:{[input]
  f:"J"$" " vs/: read0 hsym `$input;
  safe:{((count d) = sum (abs d) within 1 3) and 1=count distinct signum d:1_ deltas x};
  0N!"Part One: ",string sum safe each f;
  0N!"Part Two: ",string sum {[safe;x] max safe each {x where each  not (til count x)=/:-1,til count x} x }[safe;] each f;
 }

day_3:{[input]
  f:read0 hsym `$input;
  total:{
    pp:2#/:"," vs/: (t where (t:"mul(" vs x) like "[0-9]*");
    sum (*)./:{("J"$first x;"J"$first ")" vs x[1])}each pp where ((last flip pp) like "*[0-9])*") & ((last flip pp) like "[0-9]*")
  } each f;
  0N!"Part One: ",string sum total;
  total2:{
    filtered:raze (enlist a[0]), raze 1_/: "do()" vs/: 1_ a:"don't" vs x;
    pp:2#/:"," vs/: (t where (t:"mul(" vs filtered) like "[0-9]*");
    sum (*)./:{("J"$first x;"J"$first ")" vs x[1])}each pp where ((last flip pp) like "*[0-9])*") & ((last flip pp) like "[0-9]*")
  } each f;
  0N!"X-Part Two: ",string sum total2;
 }

day_4:{[input]
  f:read0 hsym `$input;
  xp: p where "X"=f ./: p:.sh.all_pos f;
  mpd: p where "M"=f ./: last flip p:raze {flip (til count ad;ad:.sh.nsewd .\: x)}each xp;
  apd: p where "A"=f ./: last flip p:{(x[0];(.sh.nsewd .\: x[1])x[0])}each mpd;
  spd: p where "S"=f ./: last flip p:{(x[0];(.sh.nsewd .\: x[1])x[0])}each apd;
  0N!"Part One: ",string count spd;
  pp:({(x-1;y-1)};{(x+1;y-1)};{(x+1;y+1)};{(x-1;y+1)});
  ap:p where "A"=f ./: p:.sh.all_pos f;
  mp:count where (`$f ./:/: pp .\:/: ap) in `MMSS`MSSM`SSMM`SMMS;
  0N!"Part Two: ",string mp;
 }

day_5:{[input]
  /f:read0 hsym `$input;
  0N!"Part One: ";
  0N!"Part Two: ";
 }

day_6:{[input]
  /f:read0 hsym `$input;
  0N!"Part One: ";
  0N!"Part Two: ";
 }

day_7:{[input]
 }

day_8:{[input]
 }

day_9:{[input]
 }

day_10:{[input]
 }



"*************************************************************"
"******************** advent of code 2024 ********************"
"*************************************************************"

TODAY:1+.z.D - 2024.12.01;
SKIP:();
run:{
 0N!(x#"*")," Day ",sx:string x;
 $[x in SKIP;
   0N!"UNDER CONSTRUCTION!!";
   eval parse raze "0N!\"Day ",sx," time space (ms|bytes): \", \"|\" sv string system \"ts day_",sx,"[\\\"../input/day_",sx,".txt\\\"]\""];
 }

run each 1+til TODAY;
\\