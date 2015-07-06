#outcome <- read.csv(paste("rprogass3","outcome-of-care-measures.csv",sep="/"),colClasses="character")
#outcome[,11] <- as.numeric(outcome[,11])
#hist(outcome[,11])

rankall<- function(outcome,num="best")
{
  out <- read.csv(paste("rprogass3","outcome-of-care-measures.csv",sep="/"),colClasses="character")
  out <- out[order(out[7]),]
  x <- unique(out$State)
  h <- character()
  
  if(!outcome %in% c("heart attack","pneumonia","heart failure")) stop("invalid outcome")
  
  if(outcome=="heart attack")
  {
    for(i in 1:length(x))
    {
    outnew <- out[out$State==x[[i]],]
    outnew[,11] <- suppressWarnings(as.numeric(outnew[,11]))
    outnew <- outnew[order(outnew[2]),]
    outnew <- outnew[order(outnew[11],na.last=NA),]
    if(!num>nrow(outnew)&!num %in% c("best","worst"))
    {
      h <- c(h, outnew[[num,2]])
    }else if(num=="best")
    {
      h <- c(h, outnew[[1,2]])
    } else if(num=="worst")
    {
      h <- c(h, outnew[[nrow(outnew),2]])
    } else if(num>nrow(outnew))
    {
      h <- c(h, NA)
    }  
    }
    return(data.frame(hospital=h,state=x,row.names=x))
  }  
  if(outcome=="heart failure")
  {
    for(i in 1:length(x))
    {  
      outnew <- out[out$State==x[[i]],]
      outnew[,17] <- suppressWarnings(as.numeric(outnew[,17]))
      outnew <- outnew[order(outnew[2]),]
      outnew <- outnew[order(outnew[17],na.last=NA),]
      if(!num>nrow(outnew)&!num %in% c("best","worst"))
      {
        h <- c(h, outnew[[num,2]])
      }else if(num=="best")
      {
        h <- c(h, outnew[[1,2]])
      } else if(num=="worst")
      {
        h <- c(h, outnew[[nrow(outnew),2]])
      } else if(num>nrow(outnew))
      {
        h <- c(h, NA)
      }  
    }
    return(data.frame(hospital=h,state=x,row.names=x))
  } 
  if(outcome=="pneumonia")
  {
    for(i in 1:length(x))
    {  
      outnew <- out[out$State==x[[i]],]
      outnew[,23] <- suppressWarnings(as.numeric(outnew[,23]))
      outnew <- outnew[order(outnew[2]),]
      outnew <- outnew[order(outnew[23],na.last=NA),]
      if(!num>nrow(outnew)&!num %in% c("best","worst"))
      {
        h <- c(h, outnew[[num,2]])
      }else if(num=="best")
      {
        h <- c(h, outnew[[1,2]])
      } else if(num=="worst")
      {
        h <- c(h, outnew[[nrow(outnew),2]])
      } else if(num>nrow(outnew))
      {
        h <- c(h, NA)
      }  
    }
    return(data.frame(hospital=h,state=x,row.names=x))
  } 
}
