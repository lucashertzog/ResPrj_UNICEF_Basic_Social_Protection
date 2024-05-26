load_cras <- function(
    dir
){
  
indat <- fread(file.path(rootdir, "data_provided/RMA_2022/RMA_CRAS_Criterios_2022_divulgação_27_03_23(1).csv"))

cols <- c("nome_unidade", "NU_IDENTIFICADOR", "endereco", "municipio", "uf")

# Apply gsub to remove single quotes
for (col in cols) {
  indat[[col]] <- gsub("^'|'$", "", indat[[col]])
}

cras <- indat[municipio == "BRASILEIA"]

return(cras)
}