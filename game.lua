local criarpersonagem=require ("personagem")
local criarrefinadora=require("refinadora")
local abilidades=require("abilidades")
local jogadores={}
local inimigos={}

jogadores[1]=criarpersonagem:novo("humano","Avelino","senha")
local teste={"humano","elfo","anao"}

while #inimigos<10 do
	local especie=teste[math.random(1,#teste)]
	local nome=math.random(9999)
	local senha=math.random(9999)
	local c=criarpersonagem:novo(especie,nome,senha)
    table.insert(inimigos,c)
end
print(#inimigos)
