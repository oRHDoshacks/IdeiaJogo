local materiais=require("Minerios")
local refinadora={}


function refinadora:novo(dono,nivel,capacidade,tipo)
	local maquina={dono=dono,nivel=nivel,tag=tipo..nivel}
	maquina.inventario={espaco=capacidade}
	maquina.refinados={}

	function maquina:usado()
		local a=0
		for _,v in pairs(self.inventario) do
			a=a+1
		end
		return a-1
	end
	function maquina:total()
		return self.inventario.espaco
	end

	function maquina:existe(onde,qual)
		local a=(self[onde][qual]~=nil)
		return a
	end

	function maquina:adicionar(material,quant)
		if self:usado() == self:total() then
			print ("Nao e possivel adicionar")
		elseif materiais:existe('brutos',material) then
			if self:existe("inventario",material) then
				self.inventario[material]=self.inventario[material]+quant
				print("item adicionado")
			else
				self.inventario[material]=quant
				print("item criado")
			end
		end
	end
	function maquina:refinar(material)
		if materiais:existe("brutos",material) and materiais.brutos[material].resist<=self.nivel then
			local item=materiais.brutos[material].produto
			if self:existe("refinados",item) then
				self.refinados[item]=self.refinados[item]+3
				print("Produto refinado e adicionado")
			else
				self.refinados[item]=3
				print("Produto refinado e criado")
			end
		elseif materiais.brutos[material].resist > self.nivel then
			print("O nivel da maquina nao permite refinar")
		end
	end
	return maquina
end

return refinadora
