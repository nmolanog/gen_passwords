#######################
###generate passwords
#######################
rm(list=ls())
library(pacman)
p_load(tidyverse)
p_load(shiny)

##test locally
runApp("gen_paswords")
#deploy in shiny
rsconnect::setAccountInfo(name='nicolas-molano',
                          token='xxxx`',
                          secret='<SECRET>')

rsconnect::deployApp("gen_paswords")
