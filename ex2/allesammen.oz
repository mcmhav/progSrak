\insert 'List.oz'

declare
fun {ApplyMoves S L}

   case L of nil then
      [S]
   [] H|R then
      S1 = case H of trackA(N) then
	      if N>0 then
		 A = {Append {Drop S.main {Length S.main}-N} S.trackA}
		 M = {Take S.main {Length S.main}-N} in
		 state(main:M trackA:A trackB:S.trackB)
	      elseif N<0  then
		 M = {Append S.main {Take S.trackA ~N}}
		 A = {Drop S.trackA ~N} in
		 state(main:M trackA:A trackB:S.trackB)
	      else
		 S
	      end
	   [] trackB(N) then
	      if N>0 then
		 B = {Append {Drop S.main {Length S.main}-N} S.trackB}
		 M = {Take S.main {Length S.main}-N} in
		 state(main:M trackA:S.trackA trackB:B)
	      elseif N<0  then
		 M = {Append S.main {Take S.trackB ~N}}
		 B = {Drop S.trackB ~N} in
		 state(main:M trackA:S.trackA trackB:B)
	      else
		 S
	      end
	   end 
   in
      S|{ApplyMoves S1 R}
   end   
end

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


\insert 'List.oz'
\insert 'Find.oz'
\insert 'FewFind.oz'

declare
fun {Compress Ms}
   Ns={ApplyRules Ms}
in
   if Ns==Ms then
      Ms
   else
      {Compress Ns}
   end
end


fun {ApplyRules Ms}
   case Ms of nil then
      nil
   [] trackA(N)|trackB(M)|R then
      trackA(N+M)|{ApplyRules R}
   [] trackB(N)|trackB(M)|R then
      trackB(N+M)|{ApplyRules R}
   [] trackA(0)|R then
      {ApplyRules R}
   [] H|R then
      H|{ApplyRules R}
   end
end


\insert 'List.oz'
\insert 'Find.oz'

declare
fun {FewerFind M A B Y}
   case Y of nil then
      nil
   [] Yh|Yr then
      if {Member M Yh} then Mh|Mr = M in
	 if Yh==Mh then
	    {FewerFind Mr A B Yr}
	 else Hs Ts in
	    Hs#Ts = {SplitTrain M Yh}
	    trackA({Length Ts}+1)|
	    trackB({Length Hs})|
	    traclA(~1)|
	    {FewerFind nil {Append Ts A} {Append Hs B} Yr}
	 end
      elseif {Member A Yh} then Hs Ts in
	 Hs#Ts = {SplitTrain A Yh}
	 trackA(~{Length Hs})|
	 trackB({Length Hs})|
	 trackA(~1)|
	 {FewerFind nil Ts {Append Hs B} Yr}
      elseif {Member B Yh} then Hs Ts in
	 Hs#Ts = {SplitTrain B Yh}
	 trainB(~{Length Hs})|
	 trainA({Length Hs})|
	 trainB(~1)|
	 {FewerFind nil {Append Hs A} Ts Yr}
      end
   end
end

	    