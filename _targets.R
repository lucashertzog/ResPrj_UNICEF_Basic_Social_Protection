library(targets)
source("config.R")
tar_source()

tar_option_set(
  packages =
    c("targets",
      "data.table",
      "lubridate",
      "pdftools",
      "ggplot2",
      "ggpattern"
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
  #### Censo SUAS CRAS####
  #### Censo CRAS RH ####
  tar_target(
    dat_censo_cras_rh,
    load_censo_cras_rh(
      file.path(
        rootdir,
        "data_provided/Censo_SUAS_2022/1_CRAS/Censo_SUAS_2022_CRAS_RH_LH.csv"
      )
    )
  )
  ,
  #### Censo CRAS ####
  tar_target(
    dat_censo_cras,
    load_censo_cras(
      file.path(
        rootdir,
        "data_provided/Censo_SUAS_2022/1_CRAS/Censo_SUAS_2022_CRAS_Dados_Gerais_Divulgação_LH.csv"
      )
    )
  )
  ,
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
  ,
  # ### Merge ####
  # tar_target(
  #   dat_mrg,
  #   do_mrg(
  #     dat_fnas_clean,
  #     dat_rma_cras,
  #     dat_censo_cras_rh,
  #     dat_censo_cras
  #   )
  # )
  # ,
  ### PLOTS ####
  #### plot_rh ####
  tar_target(
    plot_rh,
    plot_rh(
      dat_censo_cras_rh
    )
  )
  ,
  #### plot_rh ####
  tar_target(
    plot_rh_cost,
    plot_rh_cost(
      dat_fnas_clean
    )
  )
  # ### Special ####
  # #### RMA CREAS 2022 ####
  # tar_target(
  #   dat_rma_creas,
  #   load_creas(
  #     file.path(
  #       rootdir,
  #       "data_derived/RMA_2022/RMA_CREAS_criterios_2022_divulgação_24_03_23(3).csv"
  #     )
  #   )
  # )
  # ,
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
)

