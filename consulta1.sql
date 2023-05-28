select ifNull(codigo ,' ') As codigo,ifNull(cpf ,' ') As cpf,ifNull(cidade ,' ') As cidade,ifNull(nome ,' ') As nome,ifNull(endereco ,' ') As endereco,ifNull(bairro ,' ') As bairro,ifNull(qtpeds ,0 ) As qtpeds ,lPad(Date_Format(datanasc, '%d/%m/%Y'),10,' ')  As datanasc ,ifNull(acumulado ,0 ) As acumulado ,ifNull(status ,' ') As status,ifNull(maiorcompra ,0 ) As maiorcompra ,ifNull(ie ,' ') As ie from Clientes




Select * from dicionario where tabela = 'clientes' AND browse = 'S' ORDER by ordem