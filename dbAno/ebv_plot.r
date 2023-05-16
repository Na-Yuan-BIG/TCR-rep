library(ggpubr)
args<-commandArgs(TRUE)
pdf(file=paste(args[2],".pdf",sep=""))
df=read.table(args[1],head=T)
df$Status<-factor(df$Status,levels=c("Control","Moderate","Severe","Critical"))
compaired <- list(c("Control", "Moderate"),c("Control","Severe"),c("Control","Critical"),c("Moderate","Severe"),c("Moderate","Critical"),c("Severe","Critical"))
p<-ggplot(df, aes(x=Status, y=log(Fre,10))) + 
  geom_violin(trim=TRUE,width = 1,adjust = 0.5,color="white",aes(fill = Status)) + 
  geom_boxplot(width=0.1,size=0.2,position=position_dodge(0.8), outlier.colour="black",outlier.fill="black", outlier.shape=21,outlier.size = 0.5,show.legend = FALSE)+
 xlab("") +labs(title = "Pathogens", subtitle = "EBV")+
 theme_bw()+
  scale_fill_manual(values=c("#43CD80", "#EEA2AD", "#CD4F39","#8B0000"))+
  scale_x_discrete(limits=c("Control","Moderate","Severe","Critical"))+
  stat_summary(fun = "mean", geom = "point", size = 1, fill="black",shape=23)+
  geom_signif(comparisons = compaired,step_increase = 0.05,tip_length = 0, map_signif_level = T,test = wilcox.test)

#如t.test、wilcox.test、aov()、anova()、kruskal.test() 等



 p
 dev.off()