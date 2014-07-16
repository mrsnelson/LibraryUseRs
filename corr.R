## Coursera R Programming, Assignment 1, Part 3
corr <- function(directory, threshold=0) {
    file.names <- list.files(directory)
    complete <- function(directory, id=1:332) {
        my.df <- data.frame(id=rep(0,length(id)), nobs=rep(0,length(id)))
        for(i in 1:length(id)) {
            temp.data <- read.csv(paste(directory, file.names[id[i]], sep="/"))
            my.df[i,"id"] <- temp.data$ID[1]
            my.df[i,"nobs"] <- length(which(complete.cases(temp.data)==TRUE))
        }
        return(my.df)
    }
    my.df <- complete(directory, id=1:332)
    threshold.files <- which(my.df$nobs >= threshold)
    if(length(threshold.files) == 0) (my.corrs <- vector("numeric", length=0))
    if(length(threshold.files) > 0) {
        my.corrs <- vector("numeric",length=length(threshold.files))
        for(i in 1:length(threshold.files)) {
            temp.data <- read.csv(paste(directory, file.names[threshold.files[i]], sep="/"))
            my.corrs[i] <- cor(temp.data[,"sulfate"], temp.data[,"nitrate"], use="pairwise.complete.obs")
            ## my.corrs <- signif(my.corrs, digits=4)
        }
    }
    return(my.corrs)
}