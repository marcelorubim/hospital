best <- function(state, outcome, ranking="best") {
    data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
    data <- data[data$State == state,]
    if(nrow(data)==0){
        stop("invalid state")
    }
    column <- if(outcome == "heart attack"){
        11
    }else if(outcome == "heart failure"){
        17
    }else if(outcome == "pneumonia"){
        23
    }else{
        stop("invalid outcome")
    }
    data[, column] <- as.numeric(data[, column])
    data <- data[order(data[,column],data[,2], decreasing=FALSE),]
    if(ranking == "best"){
        head(data[,2],1)
    }else if(ranking == "worst"){
        tail(data[!is.na(data[,column]),2],1)
    }else{
        data[ranking,2]
    }
    
}