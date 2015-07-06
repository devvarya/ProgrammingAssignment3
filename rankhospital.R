#outcome <- read.csv(paste("rprogass3","outcome-of-care-measures.csv",sep="/"),colClasses="character")
#outcome[,11] <- as.numeric(outcome[,11])
#hist(outcome[,11])

rankhospital <- function(state,outcome,num)
{
  out <- read.csv(paste("rprogass3","outcome-of-care-measures.csv",sep="/"),colClasses="character")
  
  if(!state %in% out$State) stop("invalid state")
  
  if(!outcome %in% c("heart attack","pneumonia","heart failure")) stop("invalid outcome")
  
  if(outcome=="heart attack")
  {
    out <- out[out$State==state,]
    out[,11] <- suppressWarnings(as.numeric(out[,11]))
    out <- out[order(out[2]),]
    out <- out[order(out[11],na.last=NA),]
    if(!num>nrow(out)&!num %in% c("best","worst"))
    {
     return(out[[num,2]])
    }
    if(num=="best")
    {
      return(out[[1,2]])
    }
    if(num=="worst")
    {
      return(out[[nrow(out),2]])
    }
    if(num>nrow(out))
    {
      return(NA)
    }  
  }  
  if(outcome=="heart failure")
  {
      out <- out[out$State==state,]
      out[,17] <- suppressWarnings(as.numeric(out[,17]))
      out <- out[order(out[2]),]
      out <- out[order(out[17],na.last=NA),]
      if(!num>nrow(out)&!num %in% c("best","worst"))
      {
        return(out[[num,2]])
      }
      if(num=="best")
      {
        return(out[[1,2]])
      }
      if(num=="worst")
      {
        return(out[[nrow(out),2]])
      }
      if(num>nrow(out))
      {
        return(NA)
      }  
  }  
  if(outcome=="pneumonia")
  {
      out <- out[out$State==state,]
      out[,23] <- suppressWarnings(as.numeric(out[,23]))
      out <- out[order(out[2]),]
      out <- out[order(out[23],na.last=NA),]
      if(!num>nrow(out)&!num %in% c("best","worst"))
      {
        return(out[[num,2]])
      }
      if(num=="best")
      {
        return(out[[1,2]])
      }
      if(num=="worst")
      {
        return(out[[nrow(out),2]])
      }
      if(num>nrow(out))
      {
        return(NA)
      }  
  }  
}
