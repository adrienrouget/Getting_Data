#create data frame with features names
features<-read.table('features.txt')

#Create X_train data frame with features names as labels
train<-read.table('X_train.txt', col.names = features[,2])

#Create X_test data frame with features names as labels
test<-read.table('X_test.txt', col.names = features[,2])

#Merge the two dataframes
X_all<-rbind(train,test)

#Create Y_train data frame with activity as label
label_train<-read.table('Y_train.txt', col.names=c('Activity'))

#Create Y_test data frame with activity as label
label_test<-read.table('Y_test.txt', col.names=c('Activity'))

#Merge the two dataframes
Y_all<-rbind(label_train,label_test)

#Read training and test set subject tables
subject_train<-read.table('subject_train.txt',col.names=c('Subject'))
subject_test<-read.table('subject_test.txt',col.names=c('Subject'))

#Merge the two dataframes
subjects<-rbind(subject_train,subject_test)

#Use descriptive activity names to name the activities
act_labels<-read.table('activity_labels.txt')
Y_all$Activity<-factor(Y_all$Activity,levels = act_labels[,1], labels=act_labels[,2])

#Create a logical vector (TRUE=variable name contains mean or std excluding meanFrequency)
indx<-grepl('mean',features[,2])
indx2<-grepl('std',features[,2])
indx3<-grepl('meanF',features[,2])
indx<-xor(indx,indx3)
indx<-indx|indx2

#Extracts only the mean and std measurements
X_all<-cbind(X_all[,indx])

#Give the variables descriptive activity names
names(X_all)<-gsub("^t","time",names(X_all))
names(X_all)<-gsub("^f","frequency",names(X_all))
names(X_all)<-gsub("Acc","Acceleration",names(X_all))
names(X_all)<-gsub("Gyro","Gyroscopic",names(X_all))
names(X_all)<-gsub("Mag","Magnitude",names(X_all))

#Merge the three dataframes
df<-cbind(subjects,Y_all,X_all)

#Extract ta tidy data set with average of each variable by subject and activity
tidy_df<-aggregate(df[,3:68],by=list(df$Subject,df$Activity),FUN=mean)
names(tidy_df)[1:2]<-c('Subject','Activity')

#Save tidy_df as a text file
write.table(tidy_df,file="tidy_data.txt",row.names = FALSE)



