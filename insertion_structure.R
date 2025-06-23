#R code to generate the fraction of full-length L1 insertion (Figure 4a)
ggplot(t1, aes(fill=factor(type), y=y,x=tissue)) + 
geom_bar(position="fill", stat="identity") +scale_fill_manual(values=c("#6699CC","#f45763")) + theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

#R code to generate the number of events per branch for each activated source element (Figure 4b)
ggplot(t1, aes(x=X, y=Y, fill=factor(X))) +geom_bar(stat="identity") + facet_wrap(vars(type))+theme_bw() 
+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
