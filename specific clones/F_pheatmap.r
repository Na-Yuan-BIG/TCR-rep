library("pheatmap")
args<-commandArgs(TRUE)

df<-read.table(args[1],head=T,row.names=1,stringsAsFactors=F,sep="\t")
pdf(file=paste(args[2],".pdf",sep=""))
ann_col=data.frame(Group=factor(rep(c("Control","Moderate","Severe","Critical"),c(81,73,66,53))))
row.names(ann_col)=colnames(df)
ann_color=list(Group=c(Control='#43CD80',Moderate='#EEA2AD',Severe='#CD4F39',Critical='#8B0000'))
#png(filename=args[2],height=4000,width=3000,res=500,units="px")
#annotation_legend = F
#"#43CD80", "#EEA2AD", "#CD4F39","#8B0000"

#raw

pheatmap(df,fontsize=10,fontsize_row=8,annotation_col=ann_col,annotation_colors=ann_color)
#pheatmap(df,scale="none",cluster_col=F,fontsize=10,fontsize_row=8,annotation_col=ann_col,annotation_colors=ann_color)
#pheatmap(df,scale="column",cluster_col=F,show_colnames=F,fontsize=10,fontsize_row=8,annotation_col=ann_col,annotation_colors=ann_color)
dev.off()