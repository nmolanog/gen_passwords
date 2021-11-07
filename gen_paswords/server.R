#######################
###generate passwords
#######################
library(tidyverse)
library(shiny)

function(input, output, session){
  
  res_react<-reactive({
    input$excute
    isolate({
      my_symbols<-input$add_symb
      if(length(my_symbols)<1){
        "Select at least one symbol"
      }else{
        my_letters<-c(LETTERS,letters)
        n_sym<-sample(1:4,1)
        n_num<-sample(1:4,1)
        slc_symb<-sample(my_symbols,n_sym,replace = T)
        slc_numb<-sample(0:9,n_num,replace = T)
        c(slc_symb,slc_numb,sample(my_letters,input$n_ch-n_sym-n_num,replace = T) ) %>%
          {sample(.,input$n_ch,replace = F)} %>% paste0(collapse = "")
      }
    })
  })
  
  output$p1 <- renderText({
    res_react()
  })
}