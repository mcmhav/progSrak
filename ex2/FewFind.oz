\insert 'List.oz'
\insert 'Find.oz'
declare
fun {FewFind X Y}
   case Y of nil then
      nil
   [] H|R then Xh|Xr = X in
      if H==Xh then
	 {FewFind Xr R}
      else Hs Ts in
	 Hs#Ts = {SplitTrain X H}
	 trackA({Length Ts}+1)|
	 trackB({Length Hs})|
	 trackA(~({Length Ts}+1))|
	 trackB(~({Length Hs}))|
	 {FewFind {Append Ts Hs} R}
      end
   end
end


	 
      