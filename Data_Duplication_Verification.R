#The following code will read in data from an Excel file and search for duplicate data values between columns of data.
#This code assumes the 'xlsx' library has been already been installed using the 'install.packages("xlsx")' command.

#Set the working directory to the directory that contains the Excel data file.
setwd("~/R projects")

#Load the 'xlsx' library for working with spreadsheet files.
library("xlsx")

#read in all the data into a list, until the final row and column.  There are no headers in the spreadsheet
#so the header value is set to false.
ss1 <- read.xlsx("datalist2.xlsx", sheetIndex = 1, rowIndex = NULL, colIndex = NULL, header = FALSE)

#In the list, if a spreadsheet cell was blank, it was by default filled with NA, or 'not applicable'
#values.  We don't want to use these NA values for anything and they need to be ignored.    
#This line shows an example of calculating the mean of the first column of the list of data
#, while at the same time ignoring the NA entries in the column when no data is present.
mean_example <- mean(ss1[,1], na.rm = TRUE)

#Print out this mean value to be sure it is being calculated properly.
message("Mean of the first column: ",mean_example)

#Also print what kind of object ss1 is.
message("Data list object type: ", typeof(ss1))

#The spreadsheet data is read into the ss1 variable as a data frame using the previous command.  To make
#it easier to work with, convert the data into an array and unlist it for easier manipulation not requiring
#row or column labels.
dataset <- array(unlist(ss1))

#Now remove all duplicates from the dataset.
dataset <- dataset[!duplicated(dataset)]

#Finally, remove all 'not applicable'(NA) values from the dataset.
dataset <- dataset[!is.na(dataset)]

#The resulting output will be an array with less elements than the matrix that was originally left in
#since all duplicates and blank entries have been removed.  In this case, the orginal matrix size
#was 80,016 elements, and the resulting array without duplicates had a size of 76,485 elements.  
#Therefore, after duplicate entry removal, the new array was reduced in size by about 4%.











