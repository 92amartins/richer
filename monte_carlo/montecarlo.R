run_montecarlo <- function(period, sims, initial_price, return, sd){
  total_sim <- matrix(0, nrow = period, ncol = sims)
  for(j in 1:sims){
    aux <- 2
    p <- initial_price #Preco inicial
    preco <- c(p) #Vetor para acumular os precos ao longo do tempo
    dist <- rnorm(period-1,0,1) #Distribuicao normal, 255 valores, com media 0 e desvio p. 1
    for(i in dist)
    {
      daily_return = return / (period-1)
      simulation_error = sd / sqrt(period-1) * i

      P = p + p * (daily_return + simulation_error)
      preco[aux] <- P
      p = P
      aux = aux + 1
    }
    total_sim[,j] <- preco
  }
  total_sim
}
