local abilidade={}

function abilidade:cura(quem,emquem,tipo)
    local valorc={media=50,grande=100,pequena=25,leve=15}
    if quem.statusbase.vida.atu + valorc[tipo] > quem.statusbase.vida.max then
        quem.statusbase.vida.atu=quem.statusbase.vida.max
    else
        quem.statusbase.vida.atu=quem.statusbase.vida.atu+valorc[tipo]
    end
end

function abilidade:slash(quem,emquem)

end

function abilidade:sprint(quem,emquem)

end
