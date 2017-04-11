# server.R

source("helpers.R")
counties = readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      selection = switch(input$var,
                         "Percent White" = counties$white,
                         "Percent Black" = counties$black,
                         "Percent Hispanic" = counties$hispanic,
                         "Percent Asian" = counties$asian)
      
      percent_map(var = selection, "darkgreen", "census-app", max = input$range[2], min = input$range[1])
    })
      
  }
)
  
