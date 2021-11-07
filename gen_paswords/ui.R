#######################
###generate passwords
#######################
library(tidyverse)
library(shiny)

fluidPage(
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