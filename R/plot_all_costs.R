# tar_load(dat_fnas_clean)
plot_all_costs <- function(
    dat_fnas_clean
){

foo <- dat_fnas_clean

# Calculate municipal and federal sums
foo[, municipal := rowSums(.SD, na.rm = TRUE), 
    .SDcols = c("mun_out_srpr_sp_basic_hr", "mun_out_srpr_sp_basic_hrb", 
                "mun_out_srpr_sp_basic_propr", "mun_out_srpr_sp_basic_other")]

foo[, federal := rowSums(.SD, na.rm = TRUE), 
    .SDcols = c("fed_out_serv_sp_basic_other",
                "fed_out_serv_sp_basic_hrb",
                "fed_out_progr_child_hr",
                "fed_out_progr_child_hrb",
                "fed_out_progr_child_other",
                "fed_out_progr_covid_sp_basic")]

# Create a data frame for plotting
plot_data <- data.table(
  Level = c("Federal", "Municipal"),
  Servicos = c(sum(foo$fed_out_serv_sp_basic_other,  na.rm = TRUE),
               foo$mun_out_srpr_sp_basic_other),
  Instalacoes = c(0, foo$mun_out_srpr_sp_basic_propr),
  RH = c(sum(foo$fed_out_progr_child_hr, foo$fed_out_progr_child_hrb,foo$fed_out_serv_sp_basic_hrb), 
         sum(foo$mun_out_srpr_sp_basic_hr, foo$mun_out_srpr_sp_basic_hrb, na.rm = TRUE)),
  Programas = c(sum(foo$fed_out_progr_child_other, 
                    foo$fed_out_progr_covid_sp_basic),0)
)

# Melt the data for plotting
plot_data <- melt(plot_data, id.vars = "Level", variable.name = "Category", value.name = "Investment")

plot_data$Investment <- round(plot_data$Investment)

total_investment <- sum(plot_data$Investment)

# Calculate the percentage for each category
plot_data[, Percentage := round((Investment / total_investment) * 100,0)]

# Define colors
base_colors <- c("#FFC857","#119DA4","#19647E","#4B3F72")

# Custom labeling function to remove decimals
no_decimal <- function(x) {
  sprintf("%.0f", x / 1000)
}

# Plot
p <- 
  ggplot(plot_data, aes(x = Level, y = Investment, fill = Category)) +
  geom_bar(stat = "identity", width = 0.6) +
  geom_text(aes(label = ifelse(Percentage > 0, paste0(round(Percentage, 1), "%"), "")), 
            position = position_stack(vjust = 0.5), 
            color = "white", 
            size = 10, 
            family = "Econ Sans Cnd") +
  scale_y_continuous(expand = c(0, 0), labels = no_decimal) +
  scale_fill_manual(values = base_colors) +
  theme(
    panel.background = element_rect(fill = "white"),
    panel.grid.major.y = element_line(color = "#A8BAC4", size = 0.3),
    axis.ticks.length = unit(0, "mm"),
    axis.title = element_blank(),
    axis.line.y.left = element_line(color = "black"),
    axis.text.y = element_text(family = "Econ Sans Cnd", size = 14),
    axis.text.x = element_text(family = "Econ Sans Cnd", size = 14),
    legend.position = "right",
    legend.title = element_blank(),
    plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "cm")
  )
return(p)
# ggsave("figures_and_tables/costs_brasileia_basica.png", width = 10, height = 6)
}