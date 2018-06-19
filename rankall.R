rankall <- function(outcome, num="best") {
    output <- NULL
    data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
    for(state in unique(data[,7])){
        output<-rbind(output,data.frame(hospital=best(state,outcome),state=state))
    }
    output
    
}