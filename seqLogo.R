a <- c(3,2,25,0,25,3,4)
u <- c(11,5,0,25,0,15,13)
c <- c(3,14,0,0,0,3,5)
g <- c(8,4,0,0,0,4,3)

df <- data.frame(a,c,g,u)
df

#define function that divides the frequency by the row sum i.e. proportions
proportion <- function(x){
  rs <- sum(x);
  return(x / rs);
}

#create position weight matrix
mef2 <- apply(df, 1, proportion)
mef2 <- makePWM(mef2)
seqLogo(mef2)
