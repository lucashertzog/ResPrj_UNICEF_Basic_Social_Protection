plot_rh_cost <- function(
    dat_fnas_clean
){
  
dat_fnas_clean <- as.data.table(dat_fnas_clean)

plot_data <- data.table(
  Category = c(
    "Concursados (basica)", "Contrato (basica)"
  ),
  Investment = c(
    sum(dat_fnas_clean$mun_out_srpr_sp_basic_hr, dat_fnas_clean$fed_out_progr_child_hr, na.rm = TRUE),
    sum(dat_fnas_clean$mun_out_srpr_sp_basic_hrb, dat_fnas_clean$fed_out_serv_sp_basic_hrb, dat_fnas_clean$fed_out_progr_child_hrb, na.rm = TRUE)
  ),
  Type = factor(c(
    "Basic", "Basic"
  ), levels = c("Basic"))
)

plot_data$Type <- factor(plot_data$Type, levels = c(
  "Basic"))

plot_data$Category <- factor(plot_data$Category, levels = c("Contrato (basica)","Concursados (basica)"))

# Define the colors and patterns
base_colors <- c("Concursados (basica)" = "#FFC857", "Contrato (basica)" = "#119DA4")

# Custom fill colors for patterns
pattern_colors <- c("Concursados (basica)" = "#4B3F72", "Contrato (basica)" = "#19647E")

# Create the horizontal stacked bar plot with ggpattern
p <- ggplot(plot_data, aes(x = Category, y = Investment, fill = Category)) +
  geom_bar(stat = "identity", width = 0.6, position = position_dodge(width = 0.8)) +
  geom_bar_pattern(stat = "identity", width = 0.6, position = position_dodge(width = 0.8),
                   pattern = "stripe",
                   pattern_fill = pattern_colors,
                   pattern_density = 0.1,
                   pattern_angle = 60,
                   pattern_spacing = 0.2,
                   pattern_colour = NA) +
  scale_y_continuous(expand = c(0, 0), labels = scales::comma) +
  scale_fill_manual(values = base_colors) +
  theme(
    panel.background = element_rect(fill = "white"),
    panel.grid.major.x = element_line(color = "#A8BAC4", size = 0.3),
    axis.ticks.length = unit(0, "mm"),
    axis.title = element_blank(),
    axis.line.y.left = element_line(color = "black"),
    axis.text.y = element_blank(),
    axis.text.x = element_text(family = "Econ Sans Cnd", size = 14),
    legend.position = "none",
    plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "cm")
  ) + coord_flip()
return(p)
# ggsave("figures_and_tables/rh_costs_brasileia_basica.png", width = 10, height = 6)
}
