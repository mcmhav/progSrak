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


{Browse {ApplyMoves state(main:[a b] trackA:nil trackB:nil) [trackA(1) trackB(1) trackA(~1)]}}