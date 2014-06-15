\insert 'List.oz'

declare
fun {Find X Y}
   case Y of nil then
      nil
   [] H|R then Hs Ts in
      Hs#Ts = {SplitTrain X H}
      trackA({Length Ts}+1)|
      trackB({Length Hs})|
      trackA(~({Length Ts}+1))|
      trackB(~({Length Hs}))|
      {Find {Append Ts Hs} R}
   end
end

fun {SplitTrain X Y}
   Hs = {Take X {Position X Y}-1}
   Ts = {Drop X {Position X Y}-1}
in
   Hs#Ts
end
