load_fnas <- function(dir) {
  
  # Set the folder path
  dir <- "data_provided/FNAS_municipalities_2022"
  
  # Get the list of PDF files in the folder
  pdf_files <- list.files(dir, pattern = "\\.pdf$", full.names = TRUE)
  
  # Define the function to process a single PDF file
  process_pdf <- function(file_path) {
    # Read the PDF file
    pdf_text <- pdf_text(file_path)
    
    # Extract text from the first page to get the city, UF, level, and size information
    first_page_text <- pdf_text[1]
    
    # Split the first page text into lines
    first_page_lines <- strsplit(first_page_text, "\n")[[1]]
    
    # Initialize variables to store the city, UF, level, and size
    city <- NA
    uf <- NA
    level <- NA
    size <- NA
    
    # Extract city, UF, level, and size information
    for (line in first_page_lines) {
      if (grepl("Cidade:", line)) {
        city <- trimws(sub("Cidade:", "", line))
      }
      if (grepl("UF:", line)) {
        uf <- trimws(sub("UF:", "", line))
      }
      if (grepl("Nível de gestão:", line)) {
        level <- trimws(sub("Nível de gestão:", "", line))
      }
      if (grepl("Porte:", line)) {
        size <- trimws(sub("Porte:", "", line))
      }
    }
    
    # Print the extracted city, UF, level, and size for verification
    print(paste("Processing file:", file_path))
    print(paste("City:", city))
    print(paste("UF:", uf))
    print(paste("Level:", level))
    print(paste("Size:", size))
    
    # Initialize variables to store the results
    descriptions <- c()
    values <- c()
    
    # Find the page with "Resumo Executívo" and process all lines until "COMENTÁRIO DO GESTOR"
    relevant_lines <- c()
    inside_section <- FALSE
    
    for (page_text in pdf_text) {
      lines <- strsplit(page_text, "\n")[[1]]
      for (line in lines) {
        if (grepl("Resumo Executívo", line)) {
          inside_section <- TRUE
        }
        if (grepl("COMENTÁRIO DO GESTOR", line)) {
          inside_section <- FALSE
        }
        if (inside_section) {
          relevant_lines <- c(relevant_lines, line)
        }
      }
    }
    
    # Print relevant lines for troubleshooting
    print("Relevant lines:")
    print(relevant_lines)
    
    # Process the relevant lines to extract descriptions and values
    for (line in relevant_lines) {
      if (grepl("R\\$", line)) {
        # Extract description and value
        parts <- strsplit(line, "R\\$")[[1]]
        description <- trimws(parts[1])
        value <- trimws(parts[2])
        
        # Append to the lists
        descriptions <- c(descriptions, description)
        values <- c(values, value)
      }
    }
    
    # Create a data table
    dt <- data.table(city = city, uf = uf, level = level, size = size, description = descriptions, value = values)
    
    # Correctly convert dt$value to numeric by handling thousand and decimal separators
    dt[, value := as.numeric(gsub(",", ".", gsub("\\.", "", gsub("R\\$", "", value))))]
    
    # Format value with standard separators (e.g., 1,000,000.00)
    dt[, value := format(value, big.mark = ",", decimal.mark = ".", scientific = FALSE)]
    
    return(dt)
  }
  
  # Process each PDF file and combine the results
  all_data <- rbindlist(lapply(pdf_files, process_pdf), use.names = TRUE, fill = TRUE)
  
  return(all_data)
}

