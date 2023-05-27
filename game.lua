---@diagnostic disable: lowercase-global
local criarpersonagem=require ("personagem")
local criarrefinadora=require("refinadora")
local abilidades=require("abilidades")
local jogadores={}
local inimigos={}
local tst={"humano","elfo","anao"}
local function criarjogador()
	local Nome=io.read(print("Coloque um nome para o seu personagem:"))
	print("Coloque uma raca entre")
	print("Coloque uma raça entre")
	for _,v in pairs(tst) do print(_ .. " : " .. v) end
	local d=false
	while d==false do
		local tes=tonumber(io.read())
		if type(tes) == "number" and tes <= #tst and tes>=1 then
			raca=tst[tes]
			d=true
		else
			print("Você colocou uma raca invalida")
		end
	end
	local senha=io.read(print("Coloque uma senha"))
	table.insert(jogadores,criarpersonagem:novo(raca,Nome,senha))
end


while #inimigos<10 do
	local especie=tst[math.random(1,#tst)]
	local nome=math.random(9999)
	local senha=math.random(9999)
	local c=criarpersonagem:novo(especie,nome,senha)
    table.insert(inimigos,c)
end
print(#inimigos)
criarjogador()

print(jogadores[1].mochila:add("flor",1))
