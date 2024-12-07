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
  safe:{((count d) = sum (abs d) within 1 3) and 1=count distinct signum d:1_ deltas x}
  0N!"Part One: ",string sum safe each  f;
  0N!"Part Two: ",string sum {max safe each {x where each  not (til count x)=/:-1,til count x} x } each  f;
 }

day_3:{[input]
 }

day_4:{[input]
 }

day_5:{[input]
 }

day_6:{[input]
 }

day_7:{[input]
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