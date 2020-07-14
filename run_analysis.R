Xtest = read.table('./data/X_test.txt')
ytest = read.table('./data/y_test.txt')
Xtrain = read.table('./data/X_train.txt')
ytrain = read.table('./data/y_train.txt')
features = read.table('./data/features.txt')[,2]
labs= c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')
names(labs) = 1:6
X = rbind(Xtrain,Xtest)
y = rbind(ytrain,ytest)[,1]
names(X) = gsub('\\(\\)','',features)
df = X[grep('-mean|-std',features)]
df$Activity = labs[y]
write.table(df2,'tidydata2.txt',row.name=FALSE)
df2 = aggregate(df[,-ncol(df)],by=list(df$Activity),mean)
write.table(df,'tidydata.txt',row.name=FALSE)

