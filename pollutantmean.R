## Coursera R Programming, Assignment 1, Part 1
pollutantmean <- function(directory, pollutant, id=1:332) {
    file.names <- list.files(directory)
    my.data <- read.csv(paste(directory, file.names[id[1]], sep="/"))
    if (length(id) > 1) {
        for(i in 2:length(id)) {
            temp.data <- read.csv(paste(directory, file.names[id[i]], sep="/"))
            my.data <- rbind(my.data, temp.data)
        }
    }
    signif(mean(my.data[,pollutant], na.rm=TRUE), digits=4)
}