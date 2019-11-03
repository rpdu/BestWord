# pduchesne 02-11-2019
# Best Word - Coursera Capstone Project
# server.R
library(shiny);
library(data.table);

kiss.bestW <- function(input.txt){
        #clean input.txt
        input.txt<-tolower(input.txt)
        input.txt<-trimws(input.txt)
        input.txt<-gsub("[\\-]"," ",input.txt)
        input.txt<-gsub("[^a-zA-Z\' ]","",input.txt)
        W1<-word(input.txt,-4);W2<-word(input.txt,-3);W3<-word(input.txt,-2);W4<-word(input.txt,-1)
        W1.4<-word(input.txt,-4,-1);W2.4<-word(input.txt,-3,-1);W3.4<-word(input.txt,-2,-1);W4.4<-word(input.txt,-1)
        recd<-function(wx.4,ngx)
        {
                top.freq<-max(DT[V1==wx.4 & ng==ngx,frequency]);
                if (top.freq!=-Inf) {
                        top.recd<-DT[V1==wx.4 & ng==ngx & frequency==top.freq, mult="first"]
                        top.word<-top.recd[1,V2];
                        output<-top.word;
                } else {
                        output<-NA;
                }
                return(output)
                
        }
        x<-recd(W1.4,5)
        
        if (!is.na(x[1])) 
        {
                return(x);
        } else {  
                x<-recd(W2.4,4);
                
                if (!is.na(x[1]))
                {
                        return(x);
                } else { 
                        x<-recd(W3.4,3); 
                        if (!is.na(x[1]))
                        {
                                return(x);
                        } else { 
                                x<-recd(W4.4,2); 
                                if (!is.na(x[1]))
                                {
                                        return(x);
                                } else {
                                        x<-"time";
                                        return(x);
                                        
                                }  
                        }
                } 
                
        } 
        
}   

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
            
        # Define a reactive expression

        observeEvent(input$submit,input$text)

        df <- eventReactive(input$submit, {
                 input$text
        })
        bw <- eventReactive(input$submit, { 
                input.text<-input$text
                kiss.bestW(input.text)
        })
        output$value <- renderText({
                df()
        })
        output$Word <- renderText({
                bw()
        })
        
})
