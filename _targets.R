library(targets)
source("config.R")
tar_source()

tar_option_set(
  packages =
    c("targets",
      "data.table",
      "lubridate",
      "pdftools"
    )
)

list(
  ### LOAD DATA ####
  
  ### Social Protection ####
  
  ### Basic  ####
  #### RMA CRAS 2022 ####
  tar_target(
    dat_rma_cras,
    load_cras(
      file.path(
        rootdir,
        "data_derived/RMA_2022/RMA_CRAS_Criterios_2022_divulgação_27_03_23(1).csv"
      )
    )
  )
  ,
  ### Special ####
  #### RMA CREAS 2022 ####
  tar_target(
    dat_rma_creas,
    load_creas(
      file.path(
        rootdir,
        "data_derived/RMA_2022/RMA_CREAS_criterios_2022_divulgação_24_03_23(3).csv"
      )
    )
  )
  ,
  # #### RMA Centro POP 2022 ####
  # tar_target(
  #   dat_rma_centro_pop,
  #   load_centro_pop(
  #     file.path(
  #       rootdir,
  #       "data_derived/RMA_2022/RMA_Centro_POP_Criterios_2022_divulgação_24_03_23(1).csv"
  #     )
  #   )
  # )
  # ,
  ### FNAS Municipalities ####
  ### Load FNAS ####
  tar_target(
    dat_fnas,
    load_fnas(
      dir
      )
    )
  ,
  ### Clean FNAS ####
  tar_target(
    dat_fnas_clean,
    do_prep_fnas(
      dat_fnas
    )
  )
)

