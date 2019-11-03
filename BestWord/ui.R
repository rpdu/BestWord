# pduchesne 02-11-2019
# Best Word - Coursera Capstone Project
# ui.R
library(shiny);
library(shinyWidgets);

# Define UI for the application
#size = 450
fluidPage(theme = "clean-blog.min.css",
        titlePanel("Best Word Prediction"),
        h4("Coursera Data Science Capstone Project"),
        h5("Pierre Duchesne 02-11-2019"),
        setBackgroundImage( src = "./Blue_vector_Background.jpg"),
        sidebarLayout(
                sidebarPanel(
                        helpText("1. Submit a phrase drawn from Twitter, blog or news articles in English, leaving out the last word in the text box."),
                        helpText("2. Click Submit button."),        
        # Copy the line below to make a text input box
        textInput("text", label = h3("Input phrase"), value = "Enter text..."),
        actionButton("submit","Submit phrase"),
        
        hr()
        ),
        mainPanel(
        fluidRow(column(6, h4("Submitted Phrase")),
                 column(4, h4("Best Word"))),        
        fluidRow(column(6, verbatimTextOutput("value")),
                 column(4, verbatimTextOutput("Word")))
        
                
        ))
) 

