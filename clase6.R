## LENGUAJES DE PROGRAMACION ESTADISTICA
## PROFESOR:cHRISTIAN SUCUZHANAY AREVALO
## ALUMNO: SERGIO QUINTERO, EXP:22042257
## FELICIDAD
browseURL("https://github.com/SergioQui/LPE22042257/tree/sergio")

# INSTALL AND LOAD LIBRARIES ----------------------------------------------

if(!require("pacman"))install.packages("pacman")
pacman::p_load(pacman, magrittr, productplots, psych, RColorBrewer, tidyverse)

#PACMAN = LOAD AND UNLOAD
#magrittr = bidirecctional piping %<>% 
#productplots= graphic and vat var
#psych = statatistics

# LOAD AND PREPARE DATA ---------------------------------------------------

browseURL("http://j.mp/37Wxvv7")
que_tipo <- happy
df <- happy %>% as_tibble()
?happy

#Check happy levels
levels(df$happy)

#Reverser levels
df %<>% mutate(happy=fct_rev(happy)) #sin crear una columna Magrittr
#df %>% mutate(nueva_columna=fct_rev(happy)) #creando nueva columna


# OUTCOME VARIABLES: HAPPINESS --------------------------------------------

df %>%  ggplot()+geom_bar(aes(happy, fill=happy))+
  theme(axis.title.x = element_blank(),legend.position = "none") #crear grafico con la tabla happy
#Frequencies for happy
df %>%count(happy)
df %>% select(happy:health) %>% view()
df %<>% select(happy:health) %>% view() #modifica el dataset original, ahora 8 columnas
df %<>% filter(!is.na(happy)) #quitar nulos


# HAPPINESS AND GENDER ----------------------------------------------------

df %>%  ggplot(aes(sex, fill=happy))+geom_bar(position = "fill")
browseURL("https://rpubs.com/SergioQui/959694")


# HAPPINESS AND MARTIAL STATUS --------------------------------------------

df %>%  ggplot(aes(marital, fill=happy))+geom_bar(position = "fill")
browseURL("https://rpubs.com/SergioQui/959701")

# HAPPINESS AND EDUCATION LEVEL -------------------------------------------

df %>%  ggplot(aes(degree, fill=happy))+geom_bar(position = "fill")
browseURL("https://rpubs.com/SergioQui/959703")

# HAPPINESS AND MONEY -----------------------------------------------------

df %>%  ggplot(aes(finrela, fill=happy))+geom_bar(position = "fill")
browseURL("https://rpubs.com/SergioQui/959708")

# HAPPINESS AND HEALTH ----------------------------------------------------

df %>%  ggplot(aes(health, fill=happy))+geom_bar(position = "fill")
browseURL("https://rpubs.com/SergioQui/959710")

# DICHOTOMUS MARRIED/NOT VARIABLE -----------------------------------------

df %<>% mutate(married=if_else(marital=="married", "yes","no")) %>%
  mutate(married=as_factor(married)) %>% view()
#crear una nueva columna a partir de marital para que ponga si esta casado o no

