MinhaTabela = {}
MinhaTabela.teste = 123
MinhaTabela.teste = nil

for k,v in pairs(MinhaTabela) do
  print(k,v)
end