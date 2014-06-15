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
