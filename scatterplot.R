library(shiny)
library(shinydashboard)
library(ggplot2)
library(readxl)
setwd("C:/Users/ratun/OneDrive - Universitas Airlangga/semester 3/UAS")
df=read.csv("dataratingtokpedd.csv")
head(df)
ui <- fluidPage(
  tags$style(
    "
    .tabel{
    width : 100%;
    height : 90vh;
    overflow : scroll;
    }
    .inthist{
    width: 100%;
    height: 75vh;
    overflow: scroll;
    }
    "
  ),
  dashboardPage(
    dashboardHeader(title = "Dashboard Kelompok K", titleWidth = 300),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Visualisasi", tabName = "Visualisasi", icon = icon("chart-simple", lib = "font-awesome")),
      )),
    dashboardBody(
        tabItem(tabName = "Visualisasi",
                h1("Visualisasi"),
                selectInput(inputId = "x", label = "X Axis", choices = names(df), selected = "kota"),
                selectInput(inputId = "y", label = "Y Axis", choices = names(df), selected = "rating"),
                fluidPage(
                  tags$h3("Scatterplot"),
                  plotOutput(outputId = "scatterPlot"))
      ))))
  
server <- function(input, output) { 
  output$scatterPlot <- renderPlot({
    ggplot(df, aes_string(x = input$x, y = input$y)) + 
      geom_point(aes(size = rating, color = factor(kota))) + 
      scale_color_manual(values = c("#D62B2A", "#E2E26A", "#A6E26A",
                                      "#2166AC", "#A66AE2", "#2E6ADE")) +
      theme_classic() + 
      theme(legend.position = "none")
  })
}
shinyApp(ui, server)
