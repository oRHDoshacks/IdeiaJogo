local materiais={}
materiais.brutos={
    pedregulho={peso=30,valo=1,produto="Pedra"};
    troncoarvore={peso=10,valo=1,produto="Tabua"};
    minerioferro={peso=10,valor=250,produto="Ferro"};
    mineriocobre={peso=5,valor=50,produto="Cobre"};
    minerioouro={peso=7,valor=1000,produto="Ouro"};
    minerioprata={peso=8,valor=500,produto="Prata"};
}
materiais.refinados={

}
for result,valor in pairs(materiais.brutos) do --Popula a tabela refinados com os produtos finais gerado da tabela brutos
	materiais.refinados[valor.produto]={peso=valor.peso/3,valor=valor.valor*10}
end

return materiais
