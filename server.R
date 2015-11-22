library(caret)
library(shiny)

data(iris)
set.seed(121)
modFit <- train(Species ~ ., method = "rpart", data = iris)

spec <- function(SL, SW, PL, PW) {
  input <- data.frame(Sepal.Length = SL, Sepal.Width = SW, Petal.Length = PL, Petal.Width = PW)
  output <- predict(modFit, input)
  output
}

shinyServer(
  function(input, output) {
    output$oSL <- renderPrint({input$SL})
    output$oSW<- renderPrint({input$SW})
    output$oPL <- renderPrint({input$PL})
    output$oPW <- renderPrint({input$PW})
    output$opred <- renderPrint({
      input$goButton
      isolate(spec(input$SL, input$SW, input$PL, input$PW))
    })
  }
)