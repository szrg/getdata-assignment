# Dataset archive location, file name and name of the contained folder.
zip.file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
zip.file <- 'getdata%2Fprojectfiles%2FUCI HAR Dataset.zip'
dataset.dir <- 'UCI HAR Dataset'
subdirs <- c('train', 'test')

# Download and uznip the dataset archive if it is not done already.
if (!file.exists(dataset.dir)) {
    if (!file.exists(zip.file)) {
        cat('downloading zip file from', zip.file.url)
        download.file(zip.file.url, zip.file, method = 'curl')
    }
    cat('unpacking zip file', zip.file)
    unzip(zip.file)
}

# Create list of dataset files: first goes the train dataset and 
# next goes the test dataset.
file.list <- lapply(subdirs, function(x) { 
    file.path(dataset.dir, x, paste0('X_', x, '.txt'))
})

# Read and bind data sets. This step takes a lot of time.
data <- do.call('rbind', lapply(file.list, function (x) { read.table(x, row.names = NULL) }))

# Read names of the features and set them as column names.
features <- read.table(file.path(dataset.dir, 'features.txt'), stringsAsFactors = F)$V2
colnames(data) <- features

# Keep only mean and std columns.
data <- data[,grep('-(mean|std)\\(\\)', features)]

# Read activity labels.
alabels.raw <- read.table(file.path(dataset.dir, 'activity_labels.txt'))
alabels <- alabels.raw[,2]

# Create list of activity files: first goes the train activities and 
# next goes the test activities.
file.list <- lapply(subdirs, function(x) { 
    file.path(dataset.dir, x, paste0('y_', x, '.txt'))
})

# Read activity numbers.
activities <- do.call('rbind', lapply(file.list, function (x) { 
    read.table(x, row.names = NULL) 
}))

# Convert activity numbers to names.
activities$V1 <- factor(activities$V1, labels=alabels)

# Add a descriptive name.
names(activities) <- c('activity')

# Create list of subject files: first goes the train subjects and 
# next goes the test subjects.
file.list <- lapply(subdirs, function(x) { 
    file.path(dataset.dir, x, paste0('subject_', x, '.txt'))
})

# Read subject numbers.
subjects <- do.call('rbind', lapply(file.list, function (x) { 
    read.table(x, row.names = NULL) 
}))

# Add a descriptive name
names(subjects) <- c('subject')

# Join all together
data <- cbind(subjects, activities, data)

# Create data set with averages for each subject and activity. Using dplyr here.
library(dplyr)
step5.data <- data %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# Save the resulting dataset.
write.table(step5.data, 'step5data.txt', row.name=FALSE)