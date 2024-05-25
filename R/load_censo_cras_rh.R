load_censo_cras_rh <- function(
    dir
){
  
  foo <- fread(file.path(rootdir, "data_provided/Censo_SUAS_2022/1_CRAS/Censo_SUAS_2022_CRAS_RH_LH.csv"))

  
  cras_hr <- foo[Município == "Brasiléia"]
  
  return(cras_hr)
}