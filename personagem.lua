local especie = require('especies')
local inventario= require('Inventarios')
local personagem={}

function personagem:novo(raca,nome,senha)
   local base=especie[raca]
    base.nome=nome
    base.senha=senha
    base.mochila=inventario:novo(15)
    base.pontos=10
	base.nivel=0
	base.xp={atual=0;max=20}
    
    function base:atualizarnivel() -- atualiza o nivel do personagem
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
    function base:ganharxp(exp) -- Adiciona experiencia ao personagem
        self.xp.atual=self.xp.atual+exp
        self:atualizarnivel()
    end
    return base
end

return personagem
