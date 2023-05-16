library(survival)
library(survminer)
a <- read.table('168.group',header=TRUE)
fit <- survfit(Surv(a$Days,a$Status) ~ a$Sex, data = a)
print(fit)

surv_diff <- survdiff(Surv(a$Days,a$Status) ~ a$Sex, data = a)
surv_diff
p.value <- 1 - pchisq(surv_diff$chisq, length(surv_diff$n) -1)
#或1-pchisq(surv_diff$chisq,df=1)

res.cox <- coxph(Surv(a$Days,a$Status) ~ a$Sex, data = a)
summary(res.cox)

surv_diff <- survdiff(Surv(a$Days,a$Status) ~ a$Fre, data = a)
surv_diff

res.cox <- coxph(Surv(a$Days,a$Status) ~ a$Fre, data = a)
summary(res.cox)


#风险预测曲线(单变量年龄)
cox_age <- coxph(Surv(a$Days,a$Status) ~ a$Age, data = a)
a$risk_age <- predict(cox_age, type = 'risk')
head(a$risk_age)
 
ggplot(a, aes(Age, risk_age, color = Age, shape = factor(Status))) +
geom_point() +
scale_color_gradientn(colors = c('green', 'yellow', 'red')) +
scale_shape_manual(values = c(1, 16), limits = c('0', '1')) +
theme(panel.background = element_rect(fill = 'transparent', color = 'black'),
    panel.grid = element_blank())
#风险预测曲线(多变量年龄+性别)
cox2 <- coxph(Surv(a$Days,a$Status) ~ a$Age+a$Sex, data = a)

a$risk_sex_age <- predict(cox2, type = 'risk')
head(a$risk_sex_age)
 
ggplot(a, aes(Age, risk_sex_age, color = factor(Sex), shape = factor(Status))) +
geom_point() +
scale_color_manual(values = c('blue', 'red'), limits = c('1', '2')) +
scale_shape_manual(values = c(1, 16), limits = c('0', '1')) +
theme(panel.background = element_rect(fill = 'transparent', color = 'black'),
    panel.grid = element_blank())

	
	

ggsurvplot(fit) 

ggsurvplot(fit,
          pval = TRUE, conf.int = TRUE,
          risk.table = TRUE, # Add risk table
          risk.table.col = "strata", # Change risk table color by groups
          linetype = "strata", # Change line type by groups
          surv.median.line = "hv", # Specify median survival
          ggtheme = theme_bw(), # Change ggplot2 theme
          palette = c("#E7B800", "#2E9FDF"))

#using this plot	  
ggsurvplot(
   fit,                     # survfit object with calculated statistics.
   pval = TRUE,             # show p-value of log-rank test.
   conf.int = TRUE,         # show confidence intervals for 
                            # point estimaes of survival curves.
   conf.int.style = "step",  # customize style of confidence intervals
   xlab = "Time in days",   # customize X axis label.
   break.time.by = 50,     # break X axis in time intervals by 200.
   ggtheme = theme_light(), # customize plot and risk table with a theme.
   risk.table = "abs_pct",  # absolute number and percentage at risk.
  risk.table.y.text.col = T,# colour risk table text annotations.
  risk.table.y.text = FALSE,# show bars instead of names in text annotations
                            # in legend of risk table.
  ncensor.plot = TRUE,      # plot the number of censored subjects at time t
  surv.median.line = "hv",  # add the median survival pointer.
  legend.labs = 
    c("Male", "Female"),    # change legend labels.
  palette = 
    c("#E7B800", "#2E9FDF") # custom color palettes.
)		  