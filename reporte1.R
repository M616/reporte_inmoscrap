#Generar un reporte para la base inmoscrap que permita ver por 
#plataforma y por ditrito el nivel de completitud de las variables.
#Este reporte va a correr con una pre corrida del escraper, 
#alrededor del 20 de cada
#mes.
library(tidyverse)
library(DataExplorer)

library(readr)
inmo <- read_csv("~/GitHub/inmoscrap_marcos/data/inmo_2024-07-01_09-55-34.csv")
inmo |> count(district) |> nrow()

library(Rinmoscrap)
inmo_ <- Rinmoscrap::spatial_join_arba(inmo, include_crown = TRUE)
p <- inmo_ |> count(nombre_arba) 


names(inmo)
table(inmo$`_validation`, useNA = 'always')

DataExplorer::create_report(inmo)

library(summarytools)
