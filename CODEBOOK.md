---
title: "CodeBook"
author: "iseter"
date: "7/15/2020"
output: html_document
---




**This document describes how to make the Human Activity Recognition Using Smartphones Dataset clean and tidy.**

First we read the both train and test data sets by features (X) , activities/labels (y) and feature names (features)
```R
Xtest = read.table('./data/X_test.txt')
ytest = read.table('./data/y_test.txt')
Xtrain = read.table('./data/X_train.txt')
ytrain = read.table('./data/y_train.txt')
features = read.table('./data/features.txt')[,2] # We just need the 2nd column
```
According to `features_info.txt` file the activity factors are as follow.
```R
labs= c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')
names(labs) = 1:6
```
Now it is time to merge both train and test datasets together.
```R
X = rbind(Xtrain,Xtest)
y = rbind(ytrain,ytest)[,1] # We nees only the 1st column
```
I don't like parenthesis in column names let remove them and then assign the feature names to columns.
```r
names(X) = gsub('\\(\\)','',features)
```
Now as we are asked let's keep only columns of means ans stds and drop the rest.
```r
df = X[grep('-mean|-std',features)]
```
Its time to convert activity indexes to descriptive names.
```r
df$Activity = labs[y]
```
Our first tidy dataset (df) is ready let save it as `tidydata.txt`.
```r
write.table(df,'tidydata.txt',row.name=FALSE)
```
We are also asked to calculate means of each feature for each activity. For this purpose we use `aggregate` function and then save the second tidy dataset (df2) as `tidydata2.txt`
```r
df2 = aggregate(df[,-ncol(df)],by=list(df$Activity),mean)
write.table(df2,'tidydata2.txt',row.name=FALSE)
```