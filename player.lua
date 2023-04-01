local especie = require('/especies')

local player={}

function player:novo(raca,nome,senha)
   local base=especie[raca]
    base.nome=nome
    base.senha=senha
    base.mochila={}
    base.pontos=10
	base.nivel=0
	base.xp={atual=0;max=20}
    function base:mochilaadd(item ,quantidade)
        if self.mochila[item] then
            self.mochila[item]=self.mochila[item]+quantidade
            print("o item ja existe e foi criado mais um!")
        else
            self.mochila[item]=quantidade
            print("o item nao existe e foi criado um novo")
        end
    end
	function base:mochilarmv(item, quantidade)
		if self.mochila[item] >= quantidade then
			self.mochila[item] = self.mochila[item] - quantidade
            return self.mochila[item]
		else
            return ("exede a quantidade de itens em " .. (self.mochila[item] - quantidade)*-1 .. " e nao foi retirado nem um item")
		end
	end
    function base:atualizarnivel()
        while self.xp.atual >= self.xp.max do
            self.nivel=self.nivel+1
            self.xp.atual=self.xp.atual-self.xp.max
            local a=self.nivel%2
            if a == 0 then
                self.pontos=self.pontos+5
            end
            self.xp.max=self.xp.max*1.5
            print("seu nivel atual e: ".. self.nivel)
        end
    end
    function base:ganharxp(exp)
        self.xp.atual=self.xp.atual+exp
        self:atualizarnivel()        
    end
    return base
end

local jogador=player:novo("humano","Avelino",1825)
jogador:mochilaadd("Maconha",1)
jogador:mochilaadd("Maconha",1)
print(jogador.mochila.Maconha)
jogador:mochilaadd("Maconha",1)
print(jogador.mochila.Maconha)
print("-------------")
print(jogador:mochilarmv("Maconha",2))
print(jogador:mochilarmv("Maconha",2))
jogador:ganharxp(60)
return player
