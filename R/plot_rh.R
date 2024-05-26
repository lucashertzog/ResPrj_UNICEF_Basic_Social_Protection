# tar_load(dat_censo_cras_rh)

plot_rh <- function(
    dat_censo_cras_rh
){
  

# Assuming dat_censo_cras_rh$q70_11 is already defined in your environment

# Convert the data to a data frame
dat <- as.data.frame(table(dat_censo_cras_rh$d70_11))

# Rename the columns for clarity
colnames(dat) <- c("Employment_type", "Count")

# Calculate the total number of employees
total_employees <- sum(dat$Count)

# Calculate the percentages
dat$Percentage <- dat$Count / total_employees * 100

# Define the colors
colors <- c("#19647E", "#4B3F72", "#119DA4", "#FFC857")

# Create the donut chart
p <- ggplot(dat, aes(x = 2, y = Count, fill = Employment_type)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar(theta = "y") +
  xlim(0.5, 2.5) +
  theme_void() +
  theme(legend.position = "right") +
  scale_fill_manual(values = colors) +
  labs(fill = "Tipo de vínculo") + 
  geom_text(aes(label = paste0(round(Percentage, 1), "%")), 
            position = position_stack(vjust = 0.5), 
            color = "white", 
            size = 10) +  # Adjust the size as needed
  annotate("text", x = 0.6, y = 0, label = paste("Total:", total_employees), size = 6, color = "black")

return(p)
# Save the plot to a PNG file
# ggsave("figures_and_tables/rh_brasileia.png", width = 8, height = 6)
}