#######################
###generate passwords
#######################
rm(list=ls())
library(pacman)
p_load(tidyverse)
p_load(shiny)

###testing

my_symbols<-c("!","@","#","$","%","&","?")
my_letters<-c(LETTERS,letters)
n_length<-12
n_sym<-sample(1:5,1)
slc_symb<-sample(my_symbols,n_sym,replace = T)
complet_smbls<-c(my_letters,0:9)
c(slc_symb,sample(complet_smbls,n_length-n_sym,replace = T) ) %>% {sample(.,n_length,replace = F)}

###app
ui <- fluidPage(
  titlePanel("Password generator"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("add_symb","Select additional symbols",
                         c("!","@","#","$","%","&","?"),
                         selected=c("!","@","#","$","%","&","?")),
      numericInput("n_ch","Length of pasword",12,min=8,max=20,step=1),
      actionButton("excute","run!")
    ),
    mainPanel(
      textOutput("p1"))
  )
)

server <- function(input, output, session){
  
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
shinyApp(ui = ui, server = server)

