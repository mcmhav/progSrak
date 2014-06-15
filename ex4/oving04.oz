% Task 2:
declare
fun lazy {StreamMap S F}
   case S of nil then
      nil
   [] SH|ST then
      {F SH}|{StreamMap ST F}
   end
end


% Task 3:

fun lazy {StreamZip S1 S2 F}
   case S1 of S1H|S1T then
      case S2 of S2H|S2T then
	 {F S1H S2H}|{StreamZip S1T S2T F}
      else
	 nil
      end
   else
      nil
   end
end


% Task 4:

fun lazy {StreamScale SF Factor}
   case SF of nil then
      nil
   [] SH|ST then
      SH*Factor|{StreamScale ST Factor}
   end
end


% Task 5:

fun lazy {StreamAdd SF1 SF2}
     case SF1 of S1H|S1T then
      case SF2 of S2H|S2T then
	 S1H+S2H|{StreamAdd S1T S2T}
      else
	 nil
      end
   else
      nil
     end
end


% Task 6:


fun lazy {StreamIntegrate SF InitValue Dt} Tale in
   Tale = {StreamAdd {StreamScale SF Dt} InitValue|Tale}
   InitValue|Tale
end


% Task 7:

fun {MakeRC R C Dt}
   fun {$ SF V0}
      {StreamAdd {StreamIntegrate {StreamScale SF 1.0/C} V0 Dt} {StreamScale SF R}}
   end
end
   
fun lazy {MakeOnes}
   1.0 | {MakeOnes}
end

RC = {MakeRC 5.0 1.0 0.2}
Vs = {RC {MakeOnes} 2.0}
{Nth Vs 5 _}
{Browse Vs}


local
   Streams = streams(streamMap: StreamMap
		  streamZip: StreamZip
		  streamScale: StreamScale
		  streamIntegrate: StreamIntegrate
		  streamAdd: StreamAdd
		     makeRC: MakeRC)
   Test = {Module.link ['SimGraph.ozf']}.1.make
in
   {Test Streams}
end
