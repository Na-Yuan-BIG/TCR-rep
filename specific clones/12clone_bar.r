
library(ggplot2)
args<-commandArgs(TRUE)


dat=read.table(args[1],head=T)
gg1<-ggplot(dat,aes(x=Sample,y=Pro,fill=Clonotype)) + geom_bar(stat="identity",position = "stack")+ labs(x="Sample", y = "Propotion",title="Clonotype tracking")+ theme_bw() +theme(panel.grid.major=element_line(),panel.grid.minor=element_line(),axis.text.x = element_text(angle=90, hjust=1, vjust=.5))
ggsave(gg1, file=paste(args[2],".pdf",sep=""),width=13,height=6)
ggsave(gg1, file=paste("t.pdf",sep=""),width=10,height=6)