# ui.R

shinyUI(fluidPage(
  titlePanel("Edmonton Count of Trapped Mosquitos 2012 - 2015"),
  sidebarLayout(
    sidebarPanel(h3("Step 1: Select a Region"),
                 radioButtons(inputId="regions",  #checkboxGroupInput
                                    label="City Regions:",
                                    choices=colnames(dataf[,6:17]), selected=NULL, inline=FALSE),
                 h3("Step 2: Push Button to View"),
                 actionButton("show_trend","View Plot for Selected Region"),
                 h3("Step 3: Adjust Mosquito Count"),
                 sliderInput("slider", "Maximum y-value:", 
                             min=0, max=16000, value=9000)
                 ),
    mainPanel(
      h3("Edmonton Moquito Trap Contents"),
      img(src="edm_skyline.png", align="center"),
      p("The following graph allows you to visualize the mosquito count found in the 
        traps of Edmonton's 11 regions. The graph will also overlay a trendline to help visulize
        changes in trap contents between 2012 and 2015. Please use the sidebar to begin."),
      p("The original data was downloaded on September 23, 2015 from: https://data.edmonton.ca/Environmental-Services/Mosquitoes-Trap-Data/5zeu-wkpv"),
      br(),
      p("To view the resulting plot, click \"Show Trend for Selected Regions\"-button."),
      p("Currently Selected:"),
      verbatimTextOutput("value"),
      p("Here is the resulting plot:"),
      plotOutput("distPlot")
    )
  )
))