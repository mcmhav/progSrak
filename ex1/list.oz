declare
fun {Length X}
    case X of H|T then
        1 + {Length T}
    else
        0
    end
end

declare
fun {Take X N}
    if N < 1 then
        nil
    else
        case X of H|T then
            H|{Take T N-1}
        end
    end
end

declare
fun {Drop X N}
    if N < 1 then
        X
    else
        case X of H|T then
            {Drop T N-1}
        end
    end
end

declare
fun {Append X Y}
    case X of nil then
        Y
    else
        case X of H|T then
            H|{Append X Y}
        end
    end
end

declare
fun {Member X Y}
    case X of nil then
        false
    else
        case X of H|T then
            if H == Y then
                true
            else
                {Member T Y}
            end
        end
    end
end

declare
fun {Position X Y}
    case X of H|T then
        if H == Y then
            1
        else
            1 + {Position T Y}
        end
    end
end
