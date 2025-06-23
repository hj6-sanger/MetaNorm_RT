#R code to generate Figure 1c and 3a
ggplot(t1, aes(x=type, y=mean)) + geom_pointrange(aes(ymin=mean-std, ymax=mean+std)) + scale_y_log10()  
+ theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

#R code to compare the retrotransposition counts between case and control,
#we used a negative binomial mixed-effects model with a binary indicator variable (case and control group). 
#The group indicator variable (case and control) and donor ID were set as fixed and random effects, respectively, while adjusting for age and sequencing coverage. 
#The fold-change of retrotransposition counts for each comparison was estimated by exponentiating the coefficient of the indicator variable.
#"group_var" indicates whether each entry is a case or a control and the fold-change was computed by exponentiating the coefficient of "group_var". 

t1=read.table('2NUM_FINAL_tissue-sample-FAP.txt',sep='\t',header=TRUE)
lmm.sbs.age <- glm.nb(count~ age+group_var +cov+ (1|donor), data = t1)
summary(lmm.sbs.age)


