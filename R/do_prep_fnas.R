# tar_load(dat_fnas)

do_prep_fnas <- function(
    dat_fnas
){
  
# Create a lookup table with old and new descriptions
lookup_table <- data.table(
  old_description = c("1.1 Receitas totais de serviços",
                      "1.1.1 Bloco da Proteção Social Especial",
                      "1.1.2 Bloco da Proteção Social Básica",
                      "1.2 Receitas totais de programas",
                      "1.2.1.1 AÇÕES SOCIOASSISTENCIAIS AO CONTINGENTE DE",
                      "1.2.1.2 PISO VARIÁVEL DE ALTA COMPLEXIDADE - PVAC",
                      "1.2.1.3 BPC NA ESCOLA - QUESTIONÁRIO A SER APLICADO",
                      "1.2.1.4 PROGRAMA NACIONAL DE PROMOÇÃO DO ACESSO",
                      "1.2.1.5 PROGRAMA PRIMEIRA INFANCIA NO SUAS",
                      "1.3 Receitas totais decorrentes da Portaria nº 369/2020",
                      "1.3.1.1 AÇÕES DO COVID NO SUAS PARA EPI - PORTARIA",
                      "1.3.1.2 AÇÕES DO COVID NO SUAS - PARA ACOLHIMENTO -",
                      "1.4 Receitas totais decorrentes da Portaria nº 378/2020",
                      "1.4.1 Bloco da Proteção Social Especial",
                      "1.4.2 Bloco da Proteção Social Básica",
                      "1.6 Receitas totais das transferências fundo a fundo - SIGTV, à título",
                      "2.1 Despesas totais de serviços",
                      "2.1.1 Bloco da Proteção Social Especial",
                      "2.1.2 Bloco da Proteção Social Básica",
                      "2.2 Despesas totais de programas",
                      "2.2.1.1 AÇÕES SOCIOASSISTENCIAIS AO CONTINGENTE DE",
                      "2.2.1.2 PISO VARIÁVEL DE ALTA COMPLEXIDADE - PVAC",
                      "2.2.1.3 BPC NA ESCOLA - QUESTIONÁRIO A SER APLICADO",
                      "2.2.1.4 PROGRAMA NACIONAL DE PROMOÇÃO DO ACESSO",
                      "2.2.1.5 PROGRAMA PRIMEIRA INFANCIA NO SUAS",
                      "2.3 Despesas totais decorrentes da Portaria nº 369/2020",
                      "2.3.1.1 AÇÕES DO COVID NO SUAS PARA EPI - PORTARIA",
                      "2.3.1.2 AÇÕES DO COVID NO SUAS - PARA ACOLHIMENTO -",
                      "2.4 Despesas totais decorrentes da Portaria nº 378/2020",
                      "2.4.1 Bloco da Proteção Social Especial",
                      "2.4.2 Bloco da Proteção Social Básica",
                      "2.6 Despesas totais das transferências fundo a fundo - SIGTV, à título",
                      "4.1 Recursos financeiros próprios executados nos serviços/programas",
                      "4.1.1 Recursos próprios executados na Proteção Social Básica",
                      "4.1.1.1 Com pessoal concursado que compõem as equipes de",
                      "4.1.1.2 Com pessoal contratado (pessoa física) para ofertar os",
                      "4.1.1.3 Com conservação, manutenção e adaptação de imóveis",
                      "4.1.1.4 Valores destinados a parcerias com entidades e",
                      "4.1.1.5 Gastos com a aquisição de equipamentos, materiais",
                      "4.1.1.6 Demais gastos vinculados a execução dos serviços da",
                      "4.1.2 Recursos próprios executados na Proteção Social Especial",
                      "4.1.2.1 Com pessoal concursado que compõem as equipes de",
                      "4.1.2.2 Com pessoal contratado (pessoa física) para ofertar os",
                      "4.1.2.3 Com conservação, manutenção e adaptação de imóveis",
                      "4.1.2.4 Valores destinados a parcerias com entidades e",
                      "4.1.2.5 Gastos com a aquisição de equipamentos, materiais",
                      "4.1.2.6 Demais gastos vinculados a execução dos serviços da",
                      "4.1.3 Recursos próprios executados nos Programas Federais",
                      "4.2 Recursos transferidos pelo Fundo Estadual de Assistência Social -"),
  new_description = c("fed_in_serv_total",
                      "fed_in_serv_sp_special",
                      "fed_in_serv_sp_basic",
                      "fed_in_progr_total",
                      "fed_in_progr_ven",
                      "fed_in_progr_pvac",
                      "fed_in_progr_bpc",
                      "fed_in_progr_work",
                      "fed_in_progr_child",
                      "fed_in_progr_covid_tot",
                      "fed_in_progr_covid_ppe",
                      "fed_in_progr_covid_aco",
                      "fed_in_progr_covid_sp_tot",
                      "fed_in_progr_covid_sp_special",
                      "fed_in_progr_covid_sp_basic",
                      "fed_in_progr_sigtv",
                      "fed_out_serv_total",
                      "fed_out_serv_sp_special",
                      "fed_out_serv_sp_basic",
                      "fed_out_progr_total",
                      "fed_out_progr_ven",
                      "fed_out_progr_pvac",
                      "fed_out_progr_bpc",
                      "fed_out_progr_work",
                      "fed_out_progr_child",
                      "fed_out_progr_covid_tot",
                      "fed_out_progr_covid_ppe",
                      "fed_out_progr_covid_aco",
                      "fed_out_progr_covid_sp_tot",
                      "fed_out_progr_covid_sp_special",
                      "fed_out_progr_covid_sp_basic",
                      "fed_out_progr_sigtv",
                      "mun_out_srpr_total",
                      "mun_out_srpr_sp_basic",
                      "mun_out_srpr_sp_basic_hr",
                      "mun_out_srpr_sp_basic_hrb",
                      "mun_out_srpr_sp_basic_propr",
                      "mun_out_srpr_sp_basic_ngo",
                      "mun_out_srpr_sp_basic_assets",
                      "mun_out_srpr_sp_basic_other",
                      "mun_out_srpr_sp_special",
                      "mun_out_srpr_sp_special_hr",
                      "mun_out_srpr_sp_special_hrb",
                      "mun_out_srpr_sp_special_propr",
                      "mun_out_srpr_sp_special_ngo",
                      "mun_out_srpr_sp_special_assets",
                      "mun_out_srpr_sp_special_other",
                      "mun_out_srpr_fed",
                      "state_out_srpr")
)

# Set the key for fast lookup
setkey(lookup_table, old_description)
fnas <- dat_fnas
# Rename the description values in dat_fnas
fnas[, description := lookup_table[description, new_description]]

fnas <- fnas[!is.na(description)]
fnas[, value := as.numeric(gsub(",", "", gsub("\\s+", "", value)))]
fnas[, value := format(value, big.mark = ",", decimal.mark = ".", scientific = FALSE)]

# wide
fnas_wide <- dcast(fnas, city + uf + level + size ~ description, value.var = "value")

return(fnas_wide)
}