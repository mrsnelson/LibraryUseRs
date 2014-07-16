## Coursera R Programming, Assignment 1, Part 2
complete <- function(directory, id=1:332) {
    file.names <- list.files(directory)
    my.df <- data.frame(id=rep(0,length(id)), nobs=rep(0,length(id)))
    for(i in 1:length(id)) {
        temp.data <- read.csv(paste(directory, file.names[id[i]], sep="/"))
        my.df[i,"id"] <- temp.data$ID[1]
        my.df[i,"nobs"] <- length(which(complete.cases(temp.data)==TRUE))
    }
    return(my.df)
}