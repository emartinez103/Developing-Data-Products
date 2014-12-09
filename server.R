shinyServer(function(input, output) {
          
          
          datasetInput <- reactive({
                    switch(input$dataset,
                           "pressure" = fc.maxim)

          })
#################################################################################################
                    output$main_plot <- renderPlot({
                    
                    plot(time_series, main="Your cardiac frequence should look like this", col = "red", ylab="Frc", xlab = "Test performance time")

          })
#################################################################################################
          output$table <- renderTable({
                    datasetInput()
          })
          
          output$downloadData <- downloadHandler(
                    filename = function() { 
                              paste(input$dataset, '.csv', sep='') 
                    },
                    content = function(file) {
                              write.csv(datasetInput(), file)
                    }
          )
          datasetInput <- reactive({
                            switch(input$dataset,
                           "rock" = ploty,
                           "pressure" = fc.maxim)
          })
#################################################################################################
## Prediction algorithms

vo2max_calculation <- function(metros) metros * 0.0084 + 36.4
          output$inputValue <-  renderPrint ({input$metros})
          output$prediction1 <- renderPrint({vo2max_calculation(input$metros)})

vo2_umbral_anaerobico <- function(metros) (metros * 0.0084 + 36.4 )* 79 / 100
          output$inputValue2<-  renderPrint ({input$metros})
          output$prediction2 <- renderPrint({vo2_umbral_anaerobico(input$metros)})

fc_unbral_anaerobico <- function (vo2max) vo2max * 90 /100
          output$inputValue3<-  renderPrint ({input$vo2max})
          output$prediction3 <- renderPrint({fc_unbral_anaerobico(input$vo2max)})

#################################################################################################
          
})


