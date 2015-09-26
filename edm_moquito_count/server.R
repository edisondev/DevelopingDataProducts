#library(manipulate)
library(shiny)
library(ggplot2)

shinyServer(
  function(input, output) {

    output$value <- renderPrint({ input$regions })
    
    output$distPlot=renderPlot({
      input$show_trend
      input$slider
      #Don't show plot on first start
      if (input$show_trend == 0)
        return()
      
      #Get regions (isolated for so that graph updated only when button pushed)
      reg<<-isolate(input$regions)
      
      p <- ggplot()+
        geom_point(data = dataf, 
                   aes(x = TRAP_DATE, y = get(reg[1]), color = reg[1]))+
        stat_smooth(data = dataf, method="lm",aes(x = TRAP_DATE, y = get(reg[1])))+
        coord_cartesian(ylim = c(0, input$slider))+
        ylab("Trapped Mosquito Count")+
        xlab("Year")+scale_colour_discrete(name = "Selected Region:")
      p
      
    })
  }
)