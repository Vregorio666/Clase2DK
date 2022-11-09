## INVESTIGACION REPRODUCIBLE
#La investigación reproducible (IR) no es lo mismo que la investigación replicable
#La IR implica que desde los mismos datos y/o el mismo código 
#se generaránlos mismos resultados.

# PUBLICACION + CODIGO + DATOS = REPRODUCCION/REPLICA COMPLETA
library(tidyverse)
library(knitr)
library(kableExtra)

# 3 pasos para crear un REPOSITORIO
#Git add: Agregar los archivos que va a guardar al repositorio
# Add con la A en pestaña GI

#Git commit: Guardar en repositorio local ( MI PC)
# Sirve para ver versiones anteriores
# Se guarda señalando un mensaje claro y relevante sobre el cambio


#Git push : Guardar en la nube

# REPRODUCIBILIDAD EN R
# Se utiliza codigo de R para generar docuemntos en HTML, PDF, WORD, SLIDE
#1 Carpeta con TODO:- datos crudos (CSV, xls, html, etc..)
#                   -  Codigo y texto (Rmd, shiny)
#                   -  Resultados (Manuscrito, Pagina web, APP)  

# Read_CSV para importar bases de datos csv
plants <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv")
actions <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/actions.csv")
threats <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/threats.csv")

##PARTES DE UN RMD

#Texto,
#Chunk (incluye codigo que hace algo),
#Inline code (Incluye codigo en el texto),
#Cheat Sheet RMD (Muestra sintaxis en R y en documento de Resultados),
#Boton KNIT.

## Introduccion 
### Origen de los datos
#Estos datos vienen de la **IUCN** y se obtuvieron 
#[via GitHub](https://github.com/derek-corcoran-barrios) 

#Inline code permite entrelazar codigo con el texto, actualizar medias, maximos, minimos, valores p, diferencias estadisticas, etc... Trabaja VECTORES no TABLAS

# TABLAS
data("msleep")
Tabla <-msleep %>% group_by(vore) %>% summarise_at("sleep_total", .funs= list(Mean = mean, SD = sd)) %>% filter(!is.na(vore)) %>%    arrange(desc(Mean)) 

Tabla2 <- msleep %>%  group_by(order) %>%  summarise_at("sleep_total", .funs = list(Media = mean, DS = sd)) %>% filter(!is.na(order)) %>% arrange(desc(Media)) %>% 