All data files are located in working directory.

Retrieve column headers by reading in 'features.txt' file.  Convert to 561 by 2 matrix.
Column two is used to create a vector of column headers.

Retrieve testing data by reading data file 'X_test.txt', add column headings.

Retrieve activity data from 'y_test.txt', add column header 'actID'.

Add column of activities to testing data (new col 1).

Retrieve subjects data from 'subject_test.txt', add column header 'subjID'.

Add column of subjects to testing data (this is now new col 1).
At this point data file: testData is 2947 observations of 563 variables

Repeat steps for training data (substitute 'train' for 'test' in data file names).
At this point data file: trainData is 7352 observations of 563 variables

Combine data files by adding new rows (trainData) to bottom of testData .
Merged data file: mergeData is 10299 observations of 563 variables

Now select 'measurements' of mean, std for accelerometer & gyroscope data
  accelerometer is in two parts: body & gravity
  resulting columns: 1:8, 43:48, 268:273
Resulting data file: projData is 10299 observations of 20 variables

Order data by subject & activity columns.
 size unchanged.

Reshape data by first melting then casting.
Melted data: meltData is 185382 observations of 4 variables

Casted data file: castData file has average values for each variable for each activity for each subject
 castData has 3240 observations of 4 variables


Output castData for course project assignment submission.
