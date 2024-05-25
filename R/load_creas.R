load_creas <- function(
    dir
){
  
  indat <- fread(file.path(rootdir, "data_provided/RMA_2022/RMA_CREAS_criterios_2022_divulgação_24_03_23(3).csv"))
  
  cols <- c("nome_unidade", "NU_IDENTIFICADOR", "endereco", "municipio", "uf")
  
  # Apply gsub to remove single quotes
  for (col in cols) {
    indat[[col]] <- gsub("^'|'$", "", indat[[col]])
  }
  
  creas <- indat[municipio == "BRASILEIA"]
  
  return(creas)
}

# Bloco I – Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos - PAEFI	
# Nome do campo	Campo (Banco)
# A. Volume de famílias em acompanhamento pelo PAEFI	
# A.1. Total de casos (famílias ou indivíduos) em acompanhamento pelo PAEFI	A1
# A.2. Novos casos (famílias ou indivíduos) inseridas no acompanhamento do PAEFI, durante o mês de referência	A2

# B. Perfil de famílias ou indivíduos inseridos no acompanhamento do PAEFI, no mês 	
# B.1. Famílias beneficiárias do Programa Bolsa Família 	B1
# B.2. Famílias com membros beneficiários do BPC 	B2
# B.3. Famílias com crianças ou adolescentes no PETI	B3
# B.4. Famílias com crianças ou adolescentes nos Serviços de Acolhimento	B4
# B.5. Famílias cuja situação de violência/violação esteja associada ao uso abusivo de substâncias psicoativa	B5
# B.7. Famílias com adolescentes em cumprimento de Medidas Socioeducativas em meio aberto	B7
# Quantidade e perfil das pessoas vitimas de violência ou violações de direitos que ingressaram no PAEFI, durante o mês de referência (apenas indivíduos inseridos no acompanhamento no mês de referência).	
# B.6.  Quantidade de pessoas vitimadas, que ingressaram no PAEFI, durante o mês de referência (apenas para novos casos)	B6
# Pessoas do sexo masculino de 0 a 12 anos 	B6a
# Pessoas do sexo masculino de 13 a 17 anos.	B6b
# Pessoas do sexo masculino de  18 a 59 anos.	B6c
# Pessoas do sexo masculino de  60 anos ou mais.	B6d
# Pessoas do sexo feminino de 0 a 12 anos.	B6e
# Pessoas do sexo feminino de 13 a 17 anos.	B6f
# Pessoas do sexo feminino de 18 a 59 anos.	B6g
# Pessoas do sexo feminino de 60 anos ou mais.	B6h

# C. Crianças ou adolescentes em situações de violência ou violações, que ingressaram no PAEFI durante o mês de referência	
# C.1. Crianças ou adolescentes vítimas de violência intrafamiliar (física ou psicológica) 	C1
# Crianças ou adolescentes do sexo masculino de 0 a 6 anos 	C1e
# Crianças ou adolescentes do sexo masculino de 7 a 12 anos 	C1g
# Crianças ou adolescentes do sexo masculino de 13 a 17 anos 	C1b
# Crianças ou adolescentes do sexo feminino de 0 a 6 anos 	C1f
# Crianças ou adolescentes do sexo feminino de 7 a 12 anos 	C1h
# Crianças ou adolescentes do sexo feminino de 13 a 17 anos 	C1d

# C.2. Crianças ou adolescentes vítimas de abuso sexual	C2
# Crianças ou adolescentes do sexo masculino de 0 a 6 anos 	C2e
# Crianças ou adolescentes do sexo masculino de 7 a 12 anos 	C2g
# Crianças ou adolescentes do sexo masculino de 13 a 17 anos 	C2b
# Crianças ou adolescentes do sexo feminino de 0 a 6 anos 	C2f
# Crianças ou adolescentes do sexo feminino de 7 a 12 anos 	C2h
# Crianças ou adolescentes do sexo feminino de 13 a 17 anos 	C2d

# C.3. Crianças ou adolescentes vítimas de exploração sexual	C3
# Crianças ou adolescentes do sexo masculino de 0 a 6 anos 	C3e
# Crianças ou adolescentes do sexo masculino de 7 a 12 anos 	C3g
# Crianças ou adolescentes do sexo masculino de 13 a 17 anos 	C3b
# Crianças ou adolescentes do sexo feminino de 0 a 6 anos 	C3f
# Crianças ou adolescentes do sexo feminino de 7 a 12 anos 	C3h
# Crianças ou adolescentes do sexo feminino de 13 a 17 anos 	C3d

# C.4. Crianças ou adolescentes vítimas de negligência ou abandono	C4
# Crianças ou adolescentes do sexo masculino de 0 a 6 anos 	C4e
# Crianças ou adolescentes do sexo masculino de 7 a 12 anos 	C4g
# Crianças ou adolescentes do sexo masculino de 13 a 17 anos 	C4b
# Crianças ou adolescentes do sexo feminino de 0 a 6 anos 	C4f
# Crianças ou adolescentes do sexo feminino de 7 a 12 anos 	C4h
# Crianças ou adolescentes do sexo feminino de 13 a 17 anos 	C4d
# C. Crianças ou adolescentes em em situação de Trabalho Infantil, que ingressaram no PAEFI durante o mês de referência	

# C.5. Crianças ou adolescentes em situação de trabalho infantil (até 15 anos)	C5
# Crianças ou adolescentes do sexo masculino de 0 a 12 anos 	C5a
# Crianças ou adolescentes do sexo masculino de 13 a 15 anos 	C5b
# Crianças ou adolescentes do sexo feminino de 0 a 12 anos 	C5c
# Crianças ou adolescentes do sexo feminino de 13 a 15 anos 	C5d

# D. Idosos - 60 anos ou mais - em situações de violência ou violações que ingressaram no PAEFI, durante o mês de referência	
# D.1. Pessoas idosas vítimas de violência intrafamiliar (fisica, psicológica ou sexual)	D1
# Pessoas idosas do sexo masculino de 60 anos ou mais 	D1a
# Pessoas idosas do sexo feminino de 60 anos ou mais 	D1b

# D.2. Pessoas idosas vítimas de negligência ou abandono	D2
# Pessoas idosas do sexo masculino de 60 anos ou mais 	D2a
# Pessoas idosas do sexo feminino de 60 anos ou mais 	D2b

# E. Pessoas com deficiência em situações de violência ou violações que ingressaram no PAEFI, durante o mês de referência	
# E.1. Pessoas com deficiência vítimas de violência intrafamiliar (fisica, psicológica ou sexual)	E1
# Pessoas com deficiência do sexo masculino de 0 a 12 anos 	E1a
# Pessoas com deficiência do sexo masculino de 13 a 17 anos 	E1b
# Pessoas com deficiência do sexo masculino de 18 a 59 anos 	E1c
# Pessoas com deficiência do sexo masculino de 60 anos  ou mais	E1d
# Pessoas com deficiência do sexo feminino de 0 a 12 anos 	E1e
# Pessoas com deficiência do sexo feminino de 13 a 17 anos 	E1f
# Pessoas com deficiência do sexo feminino de 18 a 59 anos 	E1g
# Pessoas com deficiência do sexo feminino de 60 anos  ou mais	E1h

# E.2. Pessoas com deficiência vítimas de negligência ou abandono	E2
# Pessoas com deficiência do sexo masculino de 0 a 12 anos 	E2a
# Pessoas com deficiência do sexo masculino de 13 a 17 anos 	E2b
# Pessoas com deficiência do sexo masculino de 18 a 59 anos 	E2c
# Pessoas com deficiência do sexo masculino de 60 anos  ou mais	E2d
# Pessoas com deficiência do sexo feminino de 0 a 12 anos 	E2e
# Pessoas com deficiência do sexo feminino de 13 a 17 anos 	E2f
# Pessoas com deficiência do sexo feminino de 18 a 59 anos 	E2g
# Pessoas com deficiência do sexo feminino de 60 anos  ou mais	E2h

# F. Mulheres adultas vítimas de violência intrafamiliar qure ingressaram no PAEFI, durante o mês de referência	
# F1. Mulheres adultas (18 a 59 anos) vítimas de violência intrafamiliar  (fisica, psicológica ou sexual)	F1

# G. Pessoas vítimas de tráficos de seres humanos que ingressaram no PAEFI, durante o mês de referência	

# G.1. Pessoas vítimas de tráficos de seres humanos 	G1
# Pessoas do sexo masculino de 0 a 12 anos 	G1a
# Pessoas do sexo masculino de 13 a 17 anos 	G1b
# Pessoas  do sexo masculino de 18 a 59 anos 	G1c
# Pessoas do sexo masculino de 60 anos  ou mais	G1d
# Pessoas do sexo feminino de 0 a 12 anos 	G1e
# Pessoas do sexo feminino de 13 a 17 anos 	G1f
# Pessoas do sexo feminino de 18 a 59 anos 	G1g
# Pessoas do sexo feminino de 60 anos  ou mais	G1h

#H. Pessoas vítimas de discriminação por orientação sexual que ingressaram no PAEFI, durante o mês de referência	
# H.1. Pessoas vítimas de discriminação por orientação sexual	H1

# I. Pessoas em situação de rua que ingressaram no PAEFI, durante o mês de referência	
# I.1. Pessoas em situação de rua	I1
# Pessoas  do sexo masculino de 0 a 12 anos 	I1a
# Pessoas  do sexo masculino de 13 a 17 anos 	I1b
# Pessoas do sexo masculino de 18 a 59 anos 	I1c
# Pessoas  do sexo masculino de 60 anos  ou mais	I1d
# Pessoas do sexo feminino de 0 a 12 anos 	I1e
# Pessoas  do sexo feminino de 13 a 17 anos 	I1f
# Pessoas do sexo feminino de 18 a 59 anos 	I1g
# Pessoas do sexo feminino de 60 anos  ou mais	I1h

# Bloco II – Atendimento realizados no CREAS	
# M. Atendimentos realizados no mês de referência	
# M.1. Total de atendimentos psicossociais particularizados realizados no mês de referência	M1
# M.2. Total de atendimentos psicossociais em grupo realizados no mês de referência	M2
# M.3. Famílias encaminhadas para o CRAS durante o mês de referência	M3
# M.4. Visitas domiciliares realizadas no mês de referência	M4

# Bloco III – Serviço de Proteção Social a Adolescentes em Cumprimento de Medida Socioeducativa (LA/PSC)	
# J. Volume de adolescentes em cumprimento de Medidas Socioeducativas	
# J.1. Total de adolescentes em cumprimento de Medidas Socioeducativas (LA e/ou PSC)	J1
# J.2. Quantidade de adolescentes em cumprimento de Liberdade Assistida - LA	J2
# J.3. Quantidade de adolescentes em cumprimento de Prestação de Serviços à Comunidade - PSC	J3
# Quantidade e perfil dos novos adolescentes inseridos no Serviço, no mês de referência	
# J.4. Total de novos adolescentes em cumprimento de Medidas Socioeducativas (LA e/ou PSC),  inseridos em acompanhamento, no mês de referência	J4
# Adolescentes  do sexo masculino 	J4a
# Adolescentes do sexo feminino 	J4b
# J.5. Novos adolescentes em cumprimento de LA,  inseridos em acompanhamento, no mês de referência	J5
# Adolescentes  do sexo masculino 	J5a
# Adolescentes do sexo feminino 	J5b
# J.6. Novos adolescentes em cumprimento de PSC,  inseridos em acompanhamento, no mês de referência	J6
# Adolescentes  do sexo masculino 	J6a
# Adolescentes do sexo feminino 	J6b

# Bloco IV – Serviço Especializado em Abordagem Social	
# K. Quantidade e perfil de pessoas abordadas pela equipe do Serviço de Abordagem, no mês de referência	
# K.1. Pessoas abordadas pelo Serviço de Abordagem Social, durante o mês de referência	K1
# Pessoas  abordadas do sexo masculino de 0 a 12 anos 	K1a
# Pessoas abordadas do sexo masculino de 13 a 17 anos 	K1b
# Pessoas abordadas do sexo masculino de 18 a 59 anos 	K1c
# Pessoas abordadas do sexo masculino de 60 anos  ou mais	K1d
# Pessoas abordadas do sexo feminino de 0 a 12 anos 	K1e
# Pessoas abordadas  do sexo feminino de 13 a 17 anos 	K1f
# Pessoas abordadas do sexo feminino de 18 a 59 anos 	K1g
# Pessoas abordadas do sexo feminino de 60 anos  ou mais	K1h
# Situações identificadas pelo Serviço Especializado em Abordagem Social, no mês de referência	
# K.2. Crianças ou adolescentes em situação de trabalho infantil (até 15 anos)	K2
# K.3. Crianças ou adolescentes em situação de exploração sexual	K3
# K.4. Crianças ou adolescentes usuárias de crack ou outras drogas	K4
# K.5. Pessoas adultas usuárias de crack ou outras drogas ilícitas	K5
# K.6. Migrantes	K6
# L. Volume de abordagens realizadas	
# L.1. Quantidade total de abordagens realizadas (compreendida como número de pessoas abordadas, multiplicado pelo número de vezes em que foram abordadas durante o mês)	L1

