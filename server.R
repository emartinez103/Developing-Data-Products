shinyServer(function(input, output) {
          
          
          datasetInput <- reactive({
                    switch(input$dataset,
                           "pressure" = fc.maxim)
                    
          })
          #################################################################################################   
         
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
         
          endika <- function (file1) max (as.numeric(file1))
          output$inputValue4<-  renderPrint ({input$file1})
          output$prediction4 <- renderPrint({endika(input$file1)})
          
          #################################################################################################
          output$contents <- renderTable({
                    
                    # input$file1 will be NULL initially. After the user selects
                    # and uploads a file, it will be a data frame with 'name',
                    # 'size', 'type', and 'datapath' columns. The 'datapath'
                    # column will contain the local filenames where the data can
                    # be found.
                    
                    inFile <- input$file1
                    
                    if (is.null(inFile))
                              return(NULL)
                    
            read.csv(inFile$datapath, header=input$header, sep=input$sep, 
                             quote=input$quote)
          })
###########################################################################
output$main_plot <- renderPlot({
          
          plot(ts(runif(100, min = 90, max = 100)), main="This is a random time_serie", col = "red", ylab="Frc", xlab = "Test performance time")
          
})
})


