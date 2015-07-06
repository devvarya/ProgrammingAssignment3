#outcome <- read.csv(paste("rprogass3","outcome-of-care-measures.csv",sep="/"),colClasses="character")
#outcome[,11] <- as.numeric(outcome[,11])
#hist(outcome[,11])

best <- function(state,outcome)
{
  out <- read.csv(paste("rprogass3","outcome-of-care-measures.csv",sep="/"),colClasses="character")

  if(!state %in% out$State) stop("invalid state")
  
  if(!outcome %in% c("heart attack","pneumonia","heart failure")) stop("invalid outcome")
  
  if(outcome=="heart attack")
  {
    out <- out[out$State==state,]
    out[,11] <- suppressWarnings(as.numeric(out[,11]))
    out <- out[order(out[2]),]
    out <- out[order(out[11]),]
    return(out[[1,2]])
  }
  if(outcome=="heart failure")
  {
    out <- out[out$State==state,]
    out[,17] <- suppressWarnings(as.numeric(out[,17]))
    out <- out[order(out[2]),]
    out <- out[order(out[17]),]
    return(out[[1,2]])
  }
  if(outcome=="pneumonia")
  {
    out <- out[out$State==state,]
    out[,23] <- suppressWarnings(as.numeric(out[,23]))
    out <- out[order(out[2]),]
    out <- out[order(out[23]),]
    return(out[[1,2]])
  }
}
