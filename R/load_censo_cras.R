load_censo_cras <- function(
    dir
){
  
  foo <- fread(file.path(rootdir, "data_provided/Censo_SUAS_2022/1_CRAS/Censo_SUAS_2022_CRAS_Dados_Gerais_Divulgação_LH.csv"))
  
  
  cras <- foo[Município == "Brasiléia"]
  
  return(cras)
}