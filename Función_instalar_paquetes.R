library(styler)

# validar si un conjunto de paquetes se encuentra instalado actualmente en R:

c("DBI", "dbplyr", "tidyverse", "RMySQL", "arrow") %in%
  installed.packages()[, 1]

# función para validar si algunos paquetes de mi interés se encuentran
# instalados, y, si no es así, que los instale.

installar_paquetes <- function(paquetes) {
  if (class(paquetes) != "character") {
    "Error: proporcione un vector de caracteres"
  } else {
    n <- length(paquetes)
    i <- 1
    paquetes_instalados <- vector("character", n)
    
    for (paquete in paquetes) {
      if (paquete %in% installed.packages()[, 1] == FALSE) {
        install.packages(paquete)
        if(paquete %in% installed.packages()[, 1] == FALSE){
          paquetes_instalados[i] <- paste(
            "el paquete", paquete, 
            "no fue instalado, verifique que el nombre sea válido"
          )
        } else {
          paquetes_instalados[i] <- paste(
            "se instaló el paquete",
            paquete
          ) 
        }
      } else {
        paquetes_instalados[i] <- paste(
          "el paquete", paquete,
          "fue instalado antes de ejecutar esta función"
        )
      }
      i <- i + 1
      if (i == n + 1) {
        print(paquetes_instalados)
      }
    }
  }
}

paquetes <- c("DBI", "dbplyr", "tidyverse", "RMySQL", "arrow", "patchwork",
              "RPostgres", "x")

installar_paquetes(paquetes)
