local materiais={}
materiais.brutos={
    pedregulho={peso=30,resist=2,preco=1,produto="Pedra"};
    troncoarvore={peso=10,resist=1,preco=1,produto="Tabua"};
    minerioferro={peso=10,resist=3,preco=250,produto="Ferro"};
    mineriocobre={peso=5,resist=2.5,preco=50,produto="Cobre"};
    minerioouro={peso=7,resist=4,preco=1000,produto="Ouro"};
    minerioprata={peso=8,resist=3.5,preco=500,produto="Prata"};
}
materiais.refinados={}

for result,valor in pairs(materiais.brutos) do --Popula a tabela refinados com os produtos finais gerado da tabela brutos

	materiais.refinados[valor.produto]={peso=valor.peso/3,resist=valor.resist*10,preco=valor.preco*10}

end

function materiais:existe(onde,qual)
	local a=(self[onde][qual]~=nil)
	return a
end

return materiais
