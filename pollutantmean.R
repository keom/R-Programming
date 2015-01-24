pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    # create directory to read from
    all_files <- list.files(directory, full.names = TRUE)
    
    # create empty data frame to initialize for loop
    dat <- data.frame()
    
    # start for loop to read all files in directory
    for(i in id) {
        
        # reading csv files from directory with combine all files including [i] for index from for loop
        dat <- rbind(dat, read.csv(all_files[i]))
        
        # complete case to remove NA from data/to clean out NA
        completed <- complete.cases(dat)
        
        # combine files or data with complete case to get clean data/get moved NA
        NewCleanFile <- dat[completed, ]
        
        # get pollutant/variable from columns 
        NewFilesWithColumn <- NewCleanFile[,pollutant]
        
    }
    
    # get return or print with the mean of pollutant (variable from columns)
    mean(NewFilesWithColumn)
    
}

# Example output from this function
# source("pollutantmean.R") 

pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064
pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706
pollutantmean("specdata", "nitrate", 23)
## [1] 1.281

###
