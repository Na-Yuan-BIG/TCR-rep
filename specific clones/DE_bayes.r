library(naivebayes)
library(caret)
library(dplyr)

#a=read.table("DE_t.p",head=T)
#seldata <- subset(a,p_of_mat < 0.01)

#df<-read.table("DE.data1",head=T)
#dfg<-select(df,DE,seldata$n_of_mat)
#write.table(file="de_dfg_p001",dfg,sep="\t",quote=F,row.name=F)

dfg=read.table("de_dfg_p001",head=T)




library(pROC)
library(ROCR)
fold <- createFolds(y = dfg$DE, k=10)


prob <- character()
obs <- character()
all_p_ran = data.frame(prob,obs)

for(j in 1:10){
	fold_test <- dfg[fold[[j]],]
    fold_train <- dfg[-fold[[j]],]
	
	#fold_fit <- glm(DE~.,data=fold_train,family = "binomial")
	#fold_pred <- predict(fold_fit,type='response',fold_test)
	#pred<-ifelse(fold_pred>=0.5,1,0)
	fold_fit <-naive_bayes(as.factor(DE)~.,data=fold_train)
	fold_pred <- predict(fold_fit,fold_test)
	obs_p_ran = data.frame(prob=fold_pred,obs=fold_test$DE)
	all_p_ran=rbind(all_p_ran,obs_p_ran)
	
}

ran_roc <- roc(as.numeric(all_p_ran$obs),as.numeric(all_p_ran$prob),print.auc=TRUE ,ci=TRUE )
c2<-round(ran_roc$ci[2], 4)
c1<-round(ran_roc$ci[1],4)
c3<-round(ran_roc$ci[3],4)

pdf(file=paste("DE_b",".pdf",sep=""))

plot(ran_roc,main="Deteriorate after 28 days",col="red")
text(0.7,0.2,paste0("AUC=",c2,";95%CI:",c1," - ",c3,""),adj=c(0,0))
dev.off()
