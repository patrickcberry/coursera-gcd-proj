# Course Project

Course project for "Getting and Cleaning Data". Completed April 2015 for submission on 27th April 2015.

## General

This project required,
* A number of supplied data files to be loaded
* The data files to be merged
* A tidy data set to be produced included only specified columns (means and standard deviations)
* A tidy data set to be output gouped by Activity and Subject

## Data

The supplied data came from the "Human Activity Recognition Using Smartphones Dataset" produced by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto.

For details of the study see the [CodeBook](CodeBook.md)

## Data Location

The data is assumed to have been 'unzipped' in the current working directory. The current working directory should include a folder 'UCI HAR Dataset'. 

The script will attempt to open the following files,

```
UCI HAR Dataset
  |--- activity_labels.txt
  |--- features.txt
  |--- test
  |       |--- subject_test.txt
  |       |--- X_test.txt
  |       |--- y_test.txt
  |--- train
  |       |--- subject_train.txt
  |       |--- X_train.txt
  |       |--- y_train.txt
```

## Script
A single script, *run_analysis.R* contains all of the code to load the data and produce the tidy data set.

### Running the script
Run the script with the following command,

```
source("run_analysis.R")
```
### Dependencies

The script is dependent on the following libraries,
* dplyr

### Output

The final tidy data set is written to *tidy_data_set.txt* in the current working directory.

## Script Operation







