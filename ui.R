
shinyUI(pageWithSidebar(
          headerPanel(" Assesoring your work out prescription from a YOYO test") ,
          
          sidebarPanel(
                    selectInput("dataset", "The data you import should look like this:", 
                                choices = c("YoYo_Data")),
                    
                    downloadButton('downloadData', 'Download'),
                    
                    numericInput ("vo2max","Your max heart rate is :", 90 ,min =30,max =2000),
                    
                    numericInput ("metros","the total distance covered (meters) is :", 1000 ,min =0 ,max =20000),
                    
                    submitButton("Submit"),
                    
          #################################################################
          
          fileInput('file1', 'Choose CSV File',
                    accept=c('text/csv', 
                             'text/comma-separated-values,text/plain', 
                             '.csv')),
          tags$hr(),
          checkboxInput('header', 'Header', TRUE),
          radioButtons('sep', 'Separator',
                       c(Comma=',',
                         Semicolon=';',
                         Tab='\t'),
                       ','),
          radioButtons('quote', 'Quote',
                       c(None='',
                         'Double Quote'='"',
                         'Single Quote'="'"),
                       '"')
                    
          ),
          mainPanel(
                    plotOutput( outputId = "main_plot", height = "300px"),
                    
                    h4 ("This is your Vo2 maximun (ml/min)"),
                    
                    verbatimTextOutput("prediction1"),
                    
                    h4 ("This is your Vo2 anaerobic THRESHOLD (ml/min)"),
                    
                    verbatimTextOutput("prediction2"),
                    
                    h4 ("This is your Hr anaerobic THRESHOLD(lat/min)"),
                    verbatimTextOutput("prediction3"),
                    h4 ("Here it is the maximun heart rate of the data you imported"),
                    verbatimTextOutput ("prediction4"),
                    h4("Your data looks like this:"),
                    tableOutput('contents')
          )
)
)

