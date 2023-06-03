local armazem={}
function armazem:novo(max)
    local inventario={max=max,qnt=0,itens={}}
function inventario:add(item ,quantidade) -- Adiciona um item na mochila ou almenta a quantidade de um existente
    if self.itens[item] then -- verifica se o item ja existente
        self.itens[item]=self.itens[item]+quantidade
        return ("o item ja existe e foi adicionado mais!")
    elseif self.max>self.qnt then -- verifica se a quantidade de itens nao exede o maximo da mochila/inventario
        self.itens[item]=quantidade
        self.qnt=self.qnt+1
        return ("o item nao existe e foi criado um novo")
    else
        return ("quantidade Maxima atiginda")
    end

end
function inventario:vrf()
    local t={}
    for l,v in pairs(self.itens) do
        if v == 0 then self.itens[l]=nil end
    end
    for l,v in pairs(self.itens) do
        table.insert(t,l)
    end
    return (t)
end
function inventario:rmv(item, quantidade) -- Diminui a quantidade de um item na mochila ou o remove
    if self.itens[item] >= quantidade then
        self.itens[item] = self.itens[item] - quantidade
        self:vrf()
        return self.itens[item] or "o item foi removido"
    else
        return ("exede a quantidade de itens em " .. (self.itens[item] - quantidade)*-1 .. " e nao foi retirado nem um item")
    end
end

return inventario
end

return armazem