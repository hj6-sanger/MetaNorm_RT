
#R code to generate Figure 1
#Input is a text file with three columns, where the columns "X" and "Y" represent tissue type and the number of samples affected 
#according to the count category (the column "type"),repectively. 
t1=read.table("input.txt",header=TRUE)
ggplot(t1, aes(fill=factor(type), y=Y, x=X)) + geom_bar(position="fill", stat="identity")+
scale_fill_manual(values=c("#CCCCCC","#FFCC00","#FF6633", "#CC3333","#660033"))+theme_bw() + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

#R code to generate Figure 2
#Input is a text file with three columns, where the columns "age" and "count" represent samples' age and sample' count, respectively. 
ggplot(t1, aes(x=age, y=count)) + geom_point() + geom_smooth(method=lm) +scale_y_log10()  +
theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

#R code to assess an association between age and the number of retrotranspositions
#Age (in years) and donor ID were set as fixed and random effects, respectively, while adjusting for sequencing coverage
t1=read.table('age_coverage.txt',sep='\t',header=TRUE)
lmm.sbs.age <- glm.nb(count~ age+cov + (1|donor), data = t1)
summary(lmm.sbs.age)

