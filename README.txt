This repository contains : 
- a README.txt file
- a run_analysis.R file with the code to obtain the tidy dataset
- a tidy_data.txt file which is the output of the run_analysis.R code
- a codebook.txt file that lists the variables contained in the tidy_data.txt file
- a WD folder that contains the original data sets. 

How the run_analysis.R code works : 
- reads and merges original datasets X_train and X_test and adds variable names
- reads and merges original datasets Y_train and Y_test and adds variable names
- reads and merges original datasets subject_train and subject_test and adds variable names
- adds activity names to the Y_train and test merged dataset
- extracts from the X_train and test merged dataset only the mean and std variables and gives these variables descriptive names
- merges the subjects, Y and X data frames
- extracts a tidy data set with the average of each variable grouped by subject and activity
- saves the tidy data set to a .txt file