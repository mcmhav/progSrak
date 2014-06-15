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

	    