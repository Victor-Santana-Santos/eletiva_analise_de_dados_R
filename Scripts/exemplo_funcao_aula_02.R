#Função
centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
}

centralizacao(GSS$authoritarianism)

centroTeste <- centralizacao(GSS$authoritarianism)
