# tar_load(dat_rma_cras)
do_prep_rma_cras <- function(
    dat_rma_cras
){
  

foo <- dat_rma_cras

familias_paif <- round(mean(foo$a1),0)
familias_paif_regulares <-  round(mean(foo$d1),0)

atendimentos <- sum(foo$c1, na.rm = TRUE)

visitas_domiciliares <- sum(foo$c6, na.rm = TRUE)

# d2 = 0-6anos
# d3 = 7-14
# d4 = 15-17
# d5 = idosos
# d8 = 18-59
scfv2 <- round(mean(foo$d2, na.rm = TRUE))
scfv3 <- round(mean(foo$d3, na.rm = TRUE))
scfv4 <- round(mean(foo$d4, na.rm = TRUE))
scfv5 <- round(mean(foo$d5, na.rm = TRUE))
scfv8 <- round(mean(foo$d8, na.rm = TRUE))

scfv <- round(mean(c(scfv2, scfv3, scfv4, scfv5, scfv8), na.rm = TRUE))
}
# Bloco I – Famílias em acompanhamento pelo PAIF
# Nome do campo
# A. Volume de famílias em acompanhamento pelo PAIF
# A.1. Total de famílias em acompanhamento pelo PAIF ####
# A.2. Novas famílias inseridas no acompanhamento do PAIF no mês de referência
# B. Perfil de famílias inseridas em acompanhamento no PAIF, no mês
# B.1. Famílias em situação de extrema pobreza
# B.2. Famílias beneficiárias do Programa Bolsa Família
# B.3. Famílias beneficiárias do Programa Bolsa Família, em descumprimento de condicionalidades
# B.4. Famílias com membros beneficiários do BPC
# B.5. Famílias com crianças/adolescentes em situação de trabalho infantil
# B.6. Famílias com crianças e adolescentes em Serviço de Acolhimento

# Bloco II – Atendimentos particularizados realizados no CRAS
# C. Volume de atendimentos particularizados realizados no CRAS no mês de referência
# C.1. Total de atendimentos particularizados realizados, no mês ####
# C.2. Famílias encaminhadas para inclusão no Cadastro Único
# C.3. Famílias encaminhadas para atualização cadastral no Cadastro Único
# C.4. Indivíduos encaminhados para acesso ao BPC
# C.5. Famílias encaminhadas para o CREAS
# C.6. Visitas domiciliares realizadas ####
# C.7. Total de auxilios-natalidade concedidos/entregues durante o mês de referência
# C.8. Total de auxilios-funeral concedidos/entregues durante o mês de referência
# C.9. Outros benefícios eventuais concedidos/entregues durante o mês de referência

# Bloco III - Atendimentos coletivos realizados no CRAS
# D. Volume de atendimentos coletivos realizados no CRAS durante o mês de referência
# D.1. Famílias participando regularmente de grupos no âmbito do PAIF ####
# D.2. Crianças de 0 a 6 anos em Serviços de Convivência e Fortalecimentos de Vínculos 
# D.3. Crianças/ adolescentes de 7 a 14 anos em Serv. de Convivência e Fortalecimento de Vínculos
# D.4. Adolescentes de 15 a 17 anos em Serviços de Convivência e Fortalecimentos de Vínculos
# D.8. Adultos entre 18 a 59 anos em Serviços de Convivência e Fortalecimentos de Vínculos
# D.5. Idosos em Serviços de Convivência e Fortalecimentos de Vínculos para idosos
# D.6. Pessoas que participaram de palestras, oficinas e outras atividades coletivas de caráter não continuado 
# D.7. Pessoas com deficiência, participando dos Serviços de Convivência ou dos grupos do PAIF
