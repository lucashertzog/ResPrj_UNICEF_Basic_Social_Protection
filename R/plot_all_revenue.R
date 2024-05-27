# tar_load(dat_fnas_clean)
plot_all_revenue <- function(
    dat_fnas_clean
){
  
  foo <- dat_fnas_clean
  
  foo <- foo[, lapply(.SD, function(x) as.numeric(gsub(",", "", x))), 
             .SDcols = !c("city", "uf", "level", "size")]
  
  # fed mun and state
  foo$mun_out_srpr_total
  
  foo[, fed := rowSums(.SD, na.rm = TRUE), 
      .SDcols = c("fed_in_serv_total",
                  "fed_in_progr_total",
                  "fed_in_progr_covid_tot",
                  "fed_in_progr_covid_sp_tot",
                  "fed_in_progr_sigtv")]
  foo$fed
  
  foo$state_in_srpr

  # Create the new plot data
  foo_plot <- data.table(
    Federal = foo$fed,
    Municipal = foo$mun_out_srpr_total,
    Estadual = foo$state_in_srpr
  )
  
  # Melt the data for plotting
  foo_plot_melt <- melt(foo_plot, variable.name = "Investment_type", value.name = "Count")
  
  # Calculate the total investment
  total_investment <- sum(foo_plot_melt$Count)
  
  # Calculate the percentages
  foo_plot_melt$Percentage <- foo_plot_melt$Count / total_investment * 100
  
  # Define the colors
  colors <- c("#119DA4","#FFC857","#19647E" )
  
  # Create the donut chart
  # p <- 
    ggplot(foo_plot_melt, aes(x = 2, y = Count, fill = Investment_type)) +
    geom_bar(stat = "identity", width = 1, color = "white") +
    coord_polar(theta = "y") +
    xlim(0.5, 2.5) +
    theme_void() +
    theme(legend.position = "right") +
    scale_fill_manual(values = colors) +
    labs(fill = "Fonte") + 
    geom_text(aes(label = paste0(round(Percentage, 1), "%")), 
              position = position_stack(vjust = 0.5), 
              color = "white", 
              size = 10) +  # Adjust the size as needed
    annotate("text", x = 0, y = 0, label = paste("Total:", round(total_investment, 1)), size = 6, color = "black")
  
  # Print the plot
  return(p)
    # ggsave("figures_and_tables/revenue_all_brasileia.png", width = 8, height = 6)
}