tar_load(dat_censo_cras)
# Load necessary libraries
library(leaflet)
library(data.table)

# Example data

dt <- data.table(
  familias_paif = familias_paif,
  familias_paif_regulares = familias_paif_regulares,
  atendimentos = atendimentos,
  visitas_domiciliares = visitas_domiciliares,
  scfv = scfv,
  participantes_palestras = participantes_palestras,
  pessoas_deficiencia = pessoas_deficiencia,
  custo_concursados = custo_concursados,
  custo_contratados = custo_contratados
)


# Define coordinates
lat <- -11.001712890415700
lon <- -68.75158309936520

# Create the popup content
popup_content <- paste(
  "<b>Name:</b> ", dat_censo_cras$q01, "<br>",
  "<b>City:</b> ", dat_censo_cras$q09, "<br>",
  "<b>Familias PAIF:</b> ", dt$familias_paif, "<br>",
  "<b>Familias PAIF Regulares:</b> ", dt$familias_paif_regulares, "<br>",
  "<b>Atendimentos:</b> ", dt$atendimentos, "<br>",
  "<b>Visitas Domiciliares:</b> ", dt$visitas_domiciliares, "<br>",
  "<b>SCFV:</b> ", dt$scfv, "<br>",
  "<b>Participantes Palestras:</b> ", dt$participantes_palestras, "<br>",
  "<b>Pessoas Deficiencia:</b> ", dt$pessoas_deficiencia, "<br>",
  "<b>Custo Concursados:</b> ", dt$custo_concursados, "<br>",
  "<b>Custo Contratados:</b> ", dt$custo_contratados
)

# Create the leaflet map
# Create the leaflet map
leaflet() %>%
  addTiles(group = "Base Map") %>%
  addProviderTiles(providers$OpenStreetMap, group = "OpenStreetMap") %>%
  addMarkers(lng = lon, lat = lat, popup = popup_content, group = "Marker") %>%
  addLayersControl(
    baseGroups = c("Base Map", "OpenStreetMap"),
    overlayGroups = c("Marker", "Porte: Pequeno I", "Porte: Pequeno II", "Porte: Médio", "Porte: Grande", "Porte: Metrópole",
                      "Razões de custo: RH", "Razões de custo: Instalações", "Razões de custo: Programas e Serviços"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  hideGroup(c("Porte: Pequeno I", "Porte: Pequeno II", "Porte: Médio", "Porte: Grande", "Porte: Metrópole",
              "Razões de custo: RH", "Razões de custo: Instalações", "Razões de custo: Programas e Serviços"))
