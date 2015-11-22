library(shiny)

shinyUI(
  pageWithSidebar(
  
    headerPanel("Iris Species Predicition App"),
  
    sidebarPanel(
      h2('Observation Data'),
      p('Input the measurements from the flower in question'),
      numericInput('SL', 'Sepal Length', 4, min = 4.0, max = 8.0, step = 0.1),
      numericInput('SW', 'Sepal Width', 2, min = 2.0, max = 5.0, step = 0.1),
      numericInput('PL', 'Petal Length', 1, min = 1.0, max = 7.0, step = 0.1),
      numericInput('PW', 'Petal Width', 0, min = 0.0, max = 3.0, step = 0.1),
      actionButton("goButton", "Submit")
    ),
  
    mainPanel(
      h2('Species Identification'),
      p('For the following data:'),
      p('Sepal Length'),
      verbatimTextOutput("oSL"),
      p('Sepal Width'),
      verbatimTextOutput("oSW"),
      p('Petal Length'),
      verbatimTextOutput("oPL"),
      p('Petal Width'),
      verbatimTextOutput("oPW"),
      p('The observed species is predicted to be:'),
      verbatimTextOutput("opred")
    )
  ))