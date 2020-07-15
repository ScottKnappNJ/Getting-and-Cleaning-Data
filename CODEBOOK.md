---
title: "CodeBook"
author: "iseter"
date: "7/15/2020"
---


`Xtest` Features from `./data/X_test.txt`
`ytest`  Lables from `./data/y_test.txt`
`Xtrain` Features from `./data/X_train.txt`
`ytrain` Lables from `./data/y_train.txt`
`features` Descriptive lables from `./data/features.txt`

`labs` Are `['WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING']` and indexes `[1,2,3,4,5,6]`

`X` Merge of `Xtrain` and `Xtest`
`y` Merge of `ytrain` and `ytest`

`df` The primary data frame

`df2` The secondary dataframe made of means of features for each activity
