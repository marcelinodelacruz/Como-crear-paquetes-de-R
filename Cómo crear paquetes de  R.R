## ----include=FALSE------------------------------------------------------------

knitr::opts_chunk$set(eval = FALSE)

# NOTA: Todos los chunks de c贸digo necesarios para seguir paso a paso 
# la construcci贸n del paquete tienen impl铆cito EVAL=TRUE. 
# En este chunk los reseteamos a EVAL=FALSE para que no se eval煤en durante 
# la compilaci贸n del documento, pero haciendo esto podr铆amos ejecutar:
#
# knitr::purl("C贸mo crear paquetes de  R.rmd")
# 
# lo que nos generar铆a el archivo "C贸mo crear paquetes de  R.R" con todo el 
# c贸digo necesario. Haciendo:
# 
# source("C贸mo crear paquetes de  R.R")
#
# creamos el paquete y corremos todos los ejemplos.



## ----knitcitations, echo=FALSE, cache = FALSE, eval=TRUE----------------------
library(knitcitations)
cleanbib()   
cite_options(citation_format = "pandoc")


## ---- eval=FALSE, echo=F------------------------------------------------------
## 
## 
## # CREAR DOCUMENTO:
## # library(rmarkdown)
## # render("C贸mo crear paquetes de  R.rmd")
## 
## 


## ---- eval=FALSE--------------------------------------------------------------
## install.packages("devtools", dependencies=TRUE)


## -----------------------------------------------------------------------------
dir.create("paqueteR")
setwd("./paqueteR")
cat(c("Package: paqueteR", "Version: 0.1", "encoding: UTF-8"), sep="\n", file="DESCRIPTION")


## -----------------------------------------------------------------------------
sqrtfun1 <- function(x) sqrt(x)
sqrtfun2 <- function(x) x^(1/2)


## -----------------------------------------------------------------------------
dir.create("R")
dump("sqrtfun1", file="./R/sqrtfun1.R")
dump("sqrtfun2", file="./R/sqrtfun2.R")


## ---- echo=FALSE--------------------------------------------------------------
# ESTO LO INCLUYO PARA TENER TODOS LOS PASOS EN R 
# NO SALE EN LA NOTA ECOINFORMATICA

cat("#' Ra韟 cuadrada 1
#'
#' Funci髇 para calcular la ra韟 cuadrada.
#'
#' @param x Un vector, o array, num閞ico o complejo
#'
#' @return Ra韟 cuadrada de x
#' @export
#'
#' @examples sqrt(10)
sqrtfun1 <- function(x) sqrt(x)",file="./R/sqrtfun1.R")

cat("#' Ra韟 cuadrada 2
#' 
#' Funci髇 para calcular la ra韟 cuadrada.
#' 
#' @param x Un vector, o array, num閞ico o complejo
#'
#' @return Ra韟 cuadrada de x
#' @export
#'
#' @examples sqrt(10)
sqrtfun2 <- function(x) x^(1/2)", file="./R/sqrtfun2.R")



## -----------------------------------------------------------------------------
devtools::document()


## -----------------------------------------------------------------------------
devtools::build()


## -----------------------------------------------------------------------------
devtools::install()


## -----------------------------------------------------------------------------
library(paqueteR)
sqrtfun1(25)
?sqrtfun1


## ----write_citations, cache=FALSE, include=FALSE, eval=TRUE-------------------
#write.bibtex(file = "knitcitations.bib")
write.bibtex(file = "references.bib", append=TRUE)


## ----Fig1, eval=FALSE, echo=FALSE, fig.cap="Figura 1. Explicaci贸n de la figura 1", cache=FALSE----
## # plot(dune.o, pch=19, col=2)

