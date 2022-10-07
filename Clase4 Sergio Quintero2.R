

# ID SCRIPT ---------------------------------------------------------------



## LENGUAJES DE PROGRAMACION ESTADISTICA
## PROFESOR:cHRISTIAN SUCUZHANAY AREVALO
## ALUMNO: SERGIO QUINTERO, EXP:22042257
## HANDS ON 01




# INGEST FUNCTION ---------------------------------------------------------



# SHORCUTS ----------------------------------------------------------------

## ctrl + l = clean console
## crtl + shift + r = new section



# GIT COMMANDS ------------------------------------------------------------

git status
git init 
git add .
git commit -m "message"
git push -u origin main
git branch Sergio
git merge
git remote add origin https\\....
git clone https\\...
git pull
git fetch


# TERMINAL COMANDS --------------------------------------------------------
ls
cd
pwd 
cd ..
mkdir
touch
nano
less 
cat
where
which




# LOADING LIBS ------------------------------------------------------------
install.packages("janitor")
install.packages("tidyverse")
install.packages("pacman")
install.packages ("httr")
install.packages("generics", type="binary")
library(httr)
library(tidyverse)
library(janitor)
library(pacman)

# BASIC OPERATORS ---------------------------------------------------------
sergio <- 20
clase_lep <- c("marta","emilia","pablo")
%>% --> control + shift + M = pipe



# GETTING DATA FROM INTERNET ----------------------------------------------

url_ <-"https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
Employee <- httr::GET("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")

xml2::read_xml(Employee$content)



# # READING AND WRITTING (FILES) ------------------------------------------


f_raw <- jsonlite::fromJSON(url_)
df_source <- f_raw$ListaEESSPrecio %>% glimpse()

df_source %>% janitor::clean_names() %>% glimpse()
df_source %>% janitor::clean_names() %>% type_convert(local=locale(decimal_mark=",")) %>% glimpse() #Cambiar los decimales para que se pongan con punto en vez de con coma
final <- df_source %>% janitor::clean_names() %>% type_convert(local=locale(decimal_mark=","))
locale()


type.convert(df_source,locale = )


glimpse(Employee)
glimpse(val_stats)
glimpse (pga_datos)



# CREATING A NEW VARIABLES ------------------------------------------------

##Clasificamos por gasolineras baratas y no baratas, como lo hacemos?
final %>% view()
final %>% mutate(expensive = rotulo %in% c("CEPSA","REPSOL","BP","SHELL")) %>% view()#Ver las caras
final %>% mutate(expensive = !rotulo %in% c("CEPSA","REPSOL","BP","SHELL")) %>% view() # VEr las baratas
df <-final %>% mutate(expensive = !rotulo %in% c("CEPSA","REPSOL","BP","SHELL"))

##Cual precio medio del gasoleo en las CCAA

ds22042257 %>% select(precio_gasoleo_a,idccaa, rotulo, expensive) %>% drop_na() %>% group_by(idccaa, expensive) %>% summarise(mean(precio_gasoleo_a)) %>% view()
#Identificar numero comunidad autonoma
df$ccaa<-ifelse(df$idccaa=='01', 'Andalucia',
            ifelse(df$idccaa=='02','Aragon',
            ifelse(df$idccaa=='03','Asturias',
            ifelse(df$idccaa=='04','Baleares',
            ifelse(df$idccaa=='05','Canarias',
            ifelse(df$idccaa=='06','Cantabria',
            ifelse(df$idccaa=='07','CastillaYLeon',
            ifelse(df$idccaa=='08','CastillaLaMancha',
            ifelse(df$idccaa=='09','Cataluña',
            ifelse(df$idccaa=='10','Valencia',
            ifelse(df$idccaa=='11','Extremadura',
            ifelse(df$idccaa=='12','Galicia',
            ifelse(df$idccaa=='13','Madrid',
            ifelse(df$idccaa=='14','Murcia',
            ifelse(df$idccaa=='15','Navarra',
            ifelse(df$idccaa=='16','PaisVasco',
            ifelse(df$idccaa=='17','LaRioja',
            ifelse(df$idccaa=='18','Ceuta',
            ifelse(df$idccaa=='19','Melilla',
            
                 ifelse(df$idccaa=='',NA,00))))))))))))))))))))
df %>% view()
ds22042257<-df
ds22042257 %>% view()
##Llamar al ultimo ds22042257 y commitearlo







