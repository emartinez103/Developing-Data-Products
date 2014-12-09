  
shinyUI(pageWithSidebar(
headerPanel(" Assesoring your work out prescription from a YOYO test") ,
          
sidebarPanel(
                              selectInput("dataset", "Download the example data here:", 
                                          choices = c("YoYo_Data")),
                              
                              downloadButton('downloadData', 'Download'),
                              
                              numericInput ("vo2max","Your max heart rate is :", 90 ,min =30,max =2000),
                              
                              numericInput ("metros","the total distance covered (meters) is :", 1000 ,min =0 ,max =20000),
                              
                              submitButton("Submit")
                              
                    
                    ),
mainPanel(
          plotOutput( outputId = "main_plot", height = "300px"),
          
          h4 ("This is your Vo2 maximun (ml/min)"),
          
          verbatimTextOutput("prediction1"),
          
          h4 ("This is your Vo2 anaerobic THRESHOLD (ml/min)"),
          
          verbatimTextOutput("prediction2"),
          
          h4 ("This is your Hr anaerobic THRESHOLD(lat/min)"),
          verbatimTextOutput("prediction3")
)
)
)
                  
