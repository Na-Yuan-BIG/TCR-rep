ggscatter(a,
          x = "Fre", 
          y = "il1",
          add = "reg.line",
          conf.int = TRUE,
          cor.coef = TRUE, 
          cor.method = "pearson",
          xlab = "specific COVID-19 clones abandunce in the sample", 
          ylab = "IL-1")+xlim(0,0.002)


ggscatter(a,
          x = "Fre", 
          y = "il2",
          add = "reg.line",
          conf.int = TRUE,
          cor.coef = TRUE, 
          cor.method = "pearson", font.label = c(18, "plain"),
          xlab = "specific COVID-19 clones abandunce in the sample", 
          ylab = "IL-2")+xlim(0,0.002)


ggscatter(a,
          x = "Fre", 
          y = "il6",
          add = "reg.line",
          conf.int = TRUE,
          cor.coef = TRUE, 
          cor.method = "pearson",
          xlab = "specific COVID-19 clones abandunce in the sample", 
          ylab = "IL-6")+xlim(0,0.002)
		  
cor(a$Fre, a$thn,  method = "pearson", use = "complete.obs")
