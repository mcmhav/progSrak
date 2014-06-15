declare Key Op Tokenize in
Key = ["local" "in" "if" "then" "else" "end"]
Op = ["+" "-" "*" "/" "=" "=="]

fun {Tokenize L} Tok in

    case L of H|R then
        if {Member H Key} then
            Tok = key(H)
        elseif {Member H Op} then
            Tok = op(H)
        else
           case H of First|_ then
              if First >= &a andthen First =< &z then
             Tok = atom(H)
              elseif First >= &A andthen First =< &Z then
             Tok = id(H)
              end
           end

        end in
           Tok|{Tokenize R}
        else
           nil
    end
end

{Browse {Tokenize ["local" "X" "in" "if" "x" "then"]}}

% gir meg strengene som charlister, men siden de er
% ekvivalente antar jeg det er en simpel konvertering,
% men som ikke stod dokumentert i OZ tutorial.
