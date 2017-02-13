library(Rmisc)
library(matlab)
library(psych)
library(ppcor)
source("functions.R")
#data <- read.table("summary_data2.txt", header=T, sep="\t")
data <- read.table("summary_data3.txt", header=T, sep="\t")
data <- subset(data, data$ChooseA_ACC >= 0)

# We are interested only in Simon results
data <- data[c(1:10)]

# Reformat the dataframe

d <- data[1]
for (field in 2:10) {
  sub <- data[c(1, field)]
  sub$Measure <- names(data[field])
  d <- merge(d, sub, all=T)
}

# PSS

pss_data_1 <- data[c(1,2)]
pss_data_1$Condition <- "Choose"
names(pss_data_1)[2] <- "Accuracy"
pss_data_2 <- data[c(1,3)]
pss_data_2$Condition <- "Avoid"
names(pss_data_2)[2] <- "Accuracy"
pss_data <- merge(pss_data_1, pss_data_2, all=T)

# Classic lack of differences

t.test(Accuracy ~ Condition, pss_data, paired=T)
cor.test(data$ChooseB_ACC, data$ChooseA_ACC)


## SIMON

simon_data_1 <- data[c(1, 5, 8)]
simon_data_1$Condition <- "Incongruent"
names(simon_data_1)[2] <- "Latency"
names(simon_data_1)[3] <- "Accuracy"

simon_data_2 <- data[c(1, 6, 9)]
simon_data_2$Condition <- "Congruent"
names(simon_data_2)[2] <- "Latency"
names(simon_data_2)[3] <- "Accuracy"

simon_data <- merge(simon_data_1, simon_data_2, all=T)

# Descriptive stats 
tapply(simon_data$Accuracy, simon_data$Condition, mean)
tapply(simon_data$Accuracy, simon_data$Condition, sd)

tapply(simon_data$Latency, simon_data$Condition, mean)
tapply(simon_data$Latency, simon_data$Condition, sd)

# Significant Simon effects

t.test(Latency ~ Condition, simon_data, paired=T)
t.test(Accuracy ~ Condition, simon_data, paired=T)

t.test(asin(sqrt(Accuracy)) ~ Condition, simon_data, paired=T)


# The correlations

cor.test(data$ChooseB_ACC, data$Pre_Incongruent_SimonRT)
cor.test(data$ChooseB_ACC, data$Pre_Congruent_SimonRT)
cor.test(data$ChooseB_ACC, data$Pre_CongruencyEffect_SimonRT)

cor.test(data$ChooseA_ACC, data$Pre_Incongruent_SimonRT)
cor.test(data$ChooseA_ACC, data$Pre_Congruent_SimonRT)
cor.test(data$ChooseA_ACC, data$Pre_CongruencyEffect_SimonRT)


# load WM scores

wm <- read.table("wm.txt", header=T, sep="\t")

wm <- subset(wm, wm$Subject %in% data$Subject)
data <- merge(data, wm, all=T)

# No correlation of WM scores

cor.test(data$OS.Score, data$Pre_Incongruent_SimonRT)
cor.test(data$OS.Score, data$Pre_Congruent_SimonRT)
cor.test(data$OS.Score, data$Pre_CongruencyEffect_SimonRT)

cor.test(data$OS.Score, data$Pre_Incongruent_SimonACC)
cor.test(data$OS.Score, data$Pre_Congruent_SimonACC)


cor.test(data$OS.Score, data$ChooseB_ACC)
cor.test(data$OS.Score, data$ChooseA_ACC)



# Partial correlations

pcor.test(data$ChooseB_ACC, data$Pre_Incongruent_SimonRT, data$OS.Score)
pcor.test(data$ChooseB_ACC, data$Pre_Congruent_SimonRT, data$OS.Score)
pcor.test(data$ChooseB_ACC, data$Pre_CongruencyEffect_SimonRT, data$OS.Score)

pcor.test(data$ChooseA_ACC, data$Pre_Incongruent_SimonRT, data$OS.Score)
pcor.test(data$ChooseA_ACC, data$Pre_Congruent_SimonRT, data$OS.Score)
pcor.test(data$ChooseA_ACC, data$Pre_CongruencyEffect_SimonRT, data$OS.Score)


# Contrast of correlations

paired.r(xy=cor(data$ChooseB_ACC, data$Pre_Incongruent_SimonRT), 
         xz=cor(data$ChooseB_ACC, data$Pre_Congruent_SimonRT), n = 50)

paired.r(xy=cor(data$ChooseB_ACC, data$Pre_Incongruent_SimonRT), 
         xz=cor(data$ChooseA_ACC, data$Pre_Incongruent_SimonRT), n = 50)

paired.r(xy=cor(data$ChooseB_ACC, data$Pre_CongruencyEffect_SimonRT), 
         xz=cor(data$ChooseA_ACC, data$Pre_CongruencyEffect_SimonRT), n = 50)


plot.correlation <- function(thedata=data, xvar="ChooseA_ACC", yvar="Pre_Incongruent_SimonRT", 
                             xlab="", ylab="", corpos=c(0.2, 0.2), xlim=c(0, 1), ...) {
  #par(mar=c(4,4,3,2))
  attach(thedata)
  mod <- lm(as.formula(paste(yvar, xvar, sep="~")))
  
  range <- (xlim[2] - xlim[1])
  newx <- data.frame(X=seq(xlim[1] - 1/2 *range, xlim[2] + 1/2 * range, range/1000)) 
  names(newx) <- c(xvar)  # Rename to X variable in data frame	
  newy <- predict(mod, newdata=newx, interval="confidence", level=0.95) 	
  detach(thedata)
  plot(thedata[[xvar]], thedata[[yvar]], pch=21, bg="white", col="white", cex=1.5, fg="grey15", xlab="", ylab="", col.axis="grey15", col.lab="grey15", xlim=xlim, ...)
  p <- cor.test(thedata[[xvar]], thedata[[yvar]])$p.value
  if (p < 0.05) {
    line <- "red"
    shade <- "#FF222222"
  } else {
    line <- "black"
    shade <- "#22222222"
  }
  polygon(c(newx[[xvar]], rev(newx[[xvar]])), c(newy[,2], rev(newy[,3])), col=shade, border=F)
  points(thedata[[xvar]], thedata[[yvar]], pch=21, bg="#11111166", col="white", cex=1.5)
  abline(mod, col=line, lwd=2, lty=3)
  
  r <- round(cor(thedata[[xvar]], thedata[[yvar]]), 2)
  #detach(data)
  text(x=corpos[1], y=corpos[2], col=line, labels=substitute(italic(R) == x, list(x=r)))
  mtext(ylab, side=2, line=3, col="grey15")
  mtext(xlab, side=1, line=2, col="grey15")
}


supermega <- function() {
  par(mar=c(0,0,0,0))
  
  layout(mat = matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 6, 11, 12, 13, 14), nrow = 5, byrow=F),
         widths=c(1/5, 1, 1), heights=c(1/5, 1, 1, 1, 1/5))
  plot.new()
  plot.new()
  text("Congruent Trials\nResponse Times", 
       srt=90, x=1, y=0.5, adj=c(0.5,0))
  
  plot.new()
  text("Incongruent Trials\nResponse Times", 
       srt=90, x=1, y=0.5, adj=c(0.5,0))
  
  plot.new()
  text("Simon Effect (ms)\n(Incongruent - Congruent)", 
       srt=90, x=1, y=0.5, adj=c(0.5,0))
  
  plot.new()
  # Title
  plot.new()
  text("Correlations between PSS Task\nand Simon Task", x=0.5, y=0.5, cex=1.5)
  
  par(mar=c(2,3,2,1))
  
  plot.correlation(xvar="ChooseA_ACC", yvar="Pre_Congruent_SimonRT", 
                   corpos=c(0.15, 600), ylim=c(200, 700))
  plot.correlation(xvar="ChooseA_ACC", yvar="Pre_Incongruent_SimonRT", 
                   corpos=c(0.15, 700), ylim=c(300, 800))
  plot.correlation(xvar="ChooseA_ACC", yvar="Pre_CongruencyEffect_SimonRT", 
                   corpos=c(0.15, 150), ylim=c(-50, 250))
  abline(h=0, lwd=1, col="darkgrey")
  
  par(mar=c(0,3,1,1))
  plot.new()
  text("Choose Accuracy", x=0.5, y=1, adj=c(0.5,1))
  
  par(mar=c(2,3,2,1))
  
  plot.correlation(xvar="ChooseB_ACC", yvar="Pre_Congruent_SimonRT", 
                   corpos=c(0.85, 600), ylim=c(200, 700))
  plot.correlation(xvar="ChooseB_ACC", yvar="Pre_Incongruent_SimonRT", 
                   corpos=c(0.85, 700), ylim=c(300, 800))
  plot.correlation(xvar="ChooseB_ACC", yvar="Pre_CongruencyEffect_SimonRT", 
                   corpos=c(0.85, 150), ylim=c(-50, 250))
  abline(h=0, lwd=1, col="darkgrey")
  
  par(mar=c(0,3,1,1))
  plot.new()
  text("Avoid Accuracy", x=0.5, y=1, adj=c(0.5,1))
  
}

#tiff("figure4.tiff", width=7, height=5, res = 150, units="in")
ukulele <- function() {
  layout(mat = matrix(c(1, 1, 1, 2, 3, 3, 4, 5, 6), nrow = 3, byrow=T),
         widths=c(1, 1, 1), heights=c(1/10, 1/10, 1))
  par(mar=c(0,0,0,0))
  plot.new()
  text("Summary of Behavioral Measures", x=0.5, y=1, adj=c(0.5,1), cex=1.5)

  par(mar=c(0,3,1,1))
  plot.new()
  text("PSS Task", x=0.5, y=1, adj=c(0.5,1), cex=1.5)
  
  plot.new()
  text("Simon Task", x=0.5, y=1, adj=c(0.5,1), cex=1.5)
  
  par(mar=c(2,4,2,2))
  
  xs <- barplot(tapply(pss_data$Accuracy, pss_data$Condition, mean), 
                ylim=c(0, 1.1), ylab="Accuracy", col=c("grey75", "grey75"),
                border="grey75")
  ys <- tapply(pss_data$Accuracy, pss_data$Condition, mean)
  ses <- tapply(pss_data$Accuracy, pss_data$Condition, se)
  arrows(xs, ys, xs, ys +ses, length = 0.1, angle=90)
  arrows(xs, ys, xs, ys - ses, length = 0.1, angle=90)
  abline(h=0, col="black")
  title(main="(A)")
  
  xs <- barplot(tapply(simon_data$Accuracy, simon_data$Condition, mean), 
          ylim=c(0, 1.1), ylab="Accuracy", col=c("grey55", "grey55"),
          border="grey55")
  ys <- tapply(simon_data$Accuracy, simon_data$Condition, mean)
  ses <- tapply(simon_data$Accuracy, simon_data$Condition, se)
  arrows(xs, ys, xs, ys +ses, length = 0.1, angle=90)
  arrows(xs, ys, xs, ys - ses, length = 0.1, angle=90)
  segments(xs[1], max(ys + ses) + 0.05, xs[2], max(ys + ses) + 0.05)
  text("*", x=mean(xs), y=max(ys + ses) + 0.05 , adj=c(0.5, 0))
  abline(h=0, col="black")
  title(main="(B)")
  
  
  xs <- barplot(tapply(simon_data$Latency, simon_data$Condition, mean), 
          ylim=c(0, 600), ylab="Response Times (ms)", col=c("grey55", "grey55"),
          border="grey55")
  
  ys <- tapply(simon_data$Latency, simon_data$Condition, mean)
  ses <- tapply(simon_data$Latency, simon_data$Condition, se)
  arrows(xs, ys, xs, ys +ses, length = 0.1, angle=90)
  arrows(xs, ys, xs, ys - ses, length = 0.1, angle=90)
  segments(xs[1], max(ys + ses) + 0.05 * 600, xs[2], max(ys + ses) + 0.05 * 600)
  text("*", x=mean(xs), y=max(ys + ses) + 0.05 * 600, adj=c(0.5, 0))
  abline(h=0, col="black")
  title(main="(C)")
  
}

## MODEL

model <- read.table("simulations-new.txt", header=T, sep=",")
model <- read.table("simulations-new.txt", header=T, sep=",")
names(model) <- c("D1", "D2", "Con_ACC", "Con_RT", "In_ACC", "In_RT" )

# Generates a random factor
model$Run <- paste("Run", 1:dim(model)[1])


banana <- function() {
  plot.new()
  plot.window(xlim=c(0.1, 1.5), ylim=c(0.41, 0.52), fg="grey55", col.axis="grey55", col.lab="grey55")
  axis(2, at=seq(0.41, 0.52, 0.01), labels=seq(410, 520, 10))
  axis(1, at=seq(0.1, 1.5, 0.1))
  
  cols <- gray(1:(length(unique(model$D1)) - 0) / (2 +length(unique(model$D1)) ))
  #cols <- rainbow(length(unique(model$D1)))
  #cols <- jet.colors(length(unique(model$D1)))
  j <- 1

  tops <- tapply(model$In_RT, model$D2, mean) + tapply(model$In_RT, model$D2, se)
  bottoms <- tapply(model$In_RT, model$D2, mean) - tapply(model$In_RT, model$D2, se)
  
  
  cis <- group.CI(In_RT~D2, aggregate(model[c("In_RT")], list(D2=model$D2, D1=model$D1), mean), ci=0.99)
  tops <- cis[,2]
  bottoms <- cis[,4]
  
  for (d1 in sort(unique(model$D1))) {
    sub <- subset(model, model$D1 == d1)
    lines(x = unique(sub$D2), y = tapply(sub$In_RT, sub$D2, mean), col=cols[j], lwd=1.5, lty=1)
    points(x = unique(sub$D2), y = tapply(sub$In_RT, sub$D2, mean), pch=21, bg=cols[j], lwd=1.5, lty=1, col=cols[j])
    
    j <- j + 1
  }
  
  polygon(x=c(seq(0.1, 1.5, 0.1), seq(1.5, 0.1, -0.1)), c(tops, rev(bottoms)), col = "#EE111155", border=NA)
  lines(x = unique(model$D2), y = cis[,3], col="white", lwd=2, lty=2)
  #k = aggregate(model$In_RT, list(D2=factor(model$D2)), mean)
  #ci <- CI(k$x)
  #polygon(x=c(0, 1.5, 1.5, 0), c(ci[1], ci[3], ci[3], ci[1]), col = "#EE111177", border=NA)
  
  # Mean RT line
  #abline(h=mean(model$In_RT), col="black", lwd=2, lty=2)
  #text(y=mean(model$In_RT)+0.001, x=1.5, adj=c(1,0), labels = paste("Mean RT:", round(1000 * mean(model$In_RT), 2)))
  
  # Show also Congruent RT?
  
  cis <- group.CI(Con_RT ~ D2, aggregate(model[c("Con_RT")], list(D2 = model$D2, D1 = model$D1), mean), ci=0.99)
  tops <- cis[,2]
  bottoms <- cis[,4]
  j <- 1
  for (d1 in sort(unique(model$D1), decreasing=T)) {
    sub <- subset(model, model$D1 == d1)
    lines(x = unique(sub$D2), y = tapply(sub$Con_RT, sub$D2, mean), col=cols[j], lwd=1.5, lty=1)
    points(x = unique(sub$D2), y = tapply(sub$Con_RT, sub$D2, mean), pch=21, bg=cols[j], lwd=1.5, lty=1, col=cols[j])
    
    j <- j + 1
  }
  
  polygon(x=c(seq(0.1, 1.5, 0.1), seq(1.5, 0.1, -0.1)), c(tops, rev(bottoms)), col = "#EE111199", border=NA)
  lines(x = unique(model$D2), y = cis[,3], col="white", lwd=2, lty=2)
  
  # Legends and titles
  legend(x = "left", legend = paste("D1 =", unique(model$D1)), col= cols, 
         lty = 1, bty="n", pch=21, pt.bg=cols)
  
  text(x=c(1.0, 1.0), y=c(0.435, 0.500), labels=c("Congruent Trials", "Incongruent\nTrials"), adj=c(0.5, 0.5))
  
  title(main="Model Incongruent Response Times\nby Levels of D1 and D2",
        xlab="Value of D2 Parameter",
        ylab="Simulated Incongruent Response Time (ms)")
  box(bty="o")
  
  
}

banana2 <- function() {
  plot.new()
  plot.window(xlim=c(0.1, 1.5), ylim=c(0.42, 0.52), fg="grey55", col.axis="grey55", col.lab="grey55")
  axis(2, at=seq(0.42, 0.52, 0.01), labels=seq(420, 520, 10))
  axis(1, at=seq(0.1, 1.5, 0.1))
  
  cols <- gray(1:(length(unique(model$D1)) - 0) / (2 +length(unique(model$D1)) ))
  #cols <- rainbow(length(unique(model$D1)))
  #cols <- jet.colors(length(unique(model$D1)))
  j <- 1
  
  tops <- tapply(model$In_RT, model$D2, mean) + tapply(model$In_RT, model$D2, se)
  bottoms <- tapply(model$In_RT, model$D2, mean) - tapply(model$In_RT, model$D2, se)
  
  
  cis <- group.CI(In_RT~D2, aggregate(model[c("In_RT")], list(D2=model$D2, D1=model$D1), mean), ci=0.99)
  tops <- cis[,2]
  bottoms <- cis[,4]
  
  for (d1 in sort(unique(model$D1))) {
    sub <- subset(model, model$D1 == d1)
    lines(x = unique(sub$D2), y = tapply(sub$In_RT, sub$D2, mean), col=cols[j], lwd=1/2, lty=1)
    #points(x = unique(sub$D2), y = tapply(sub$In_RT, sub$D2, mean), pch=21, bg=cols[j], lwd=1.5, lty=1, col=cols[j])
    
    j <- j + 1
  }
  
  #polygon(x=c(seq(0.1, 1.5, 0.1), seq(1.5, 0.1, -0.1)), c(tops, rev(bottoms)), col = "#EE111155", border=NA)
  lines(x = unique(model$D2), y = cis[,3], col="black", lwd=2, lty=2)
  points(x = unique(model$D2), y = cis[,3], pch=21, bg="black", lwd=1, lty=1, col="black")
  arrows(x0=seq(0.1, 1.5, 0.1), x1=seq(0.1, 1.5, 0.1), 
         y0 = cis[,3], y1 = tops, col = "black", lwd=1, angle=90, length=0.1)
  arrows(x0=seq(0.1, 1.5, 0.1), x1=seq(0.1, 1.5, 0.1), 
         y0 = cis[,3], y1 = bottoms, col = "black", lwd=1, angle=90, length=0.1)
  
  #k = aggregate(model$In_RT, list(D2=factor(model$D2)), mean)
  #ci <- CI(k$x)
  #polygon(x=c(0, 1.5, 1.5, 0), c(ci[1], ci[3], ci[3], ci[1]), col = "#EE111177", border=NA)
  
  # Mean RT line
  #abline(h=mean(model$In_RT), col="black", lwd=2, lty=2)
  #text(y=mean(model$In_RT)+0.001, x=1.5, adj=c(1,0), labels = paste("Mean RT:", round(1000 * mean(model$In_RT), 2)))
  
  # Show also Congruent RT?
  
  cis <- group.CI(Con_RT ~ D2, aggregate(model[c("Con_RT")], list(D2 = model$D2, D1 = model$D1), mean), ci=0.99)
  tops <- cis[,2]
  bottoms <- cis[,4]
  j <- 1
  for (d1 in sort(unique(model$D1), decreasing=T)) {
    sub <- subset(model, model$D1 == d1)
    lines(x = unique(sub$D2), y = tapply(sub$Con_RT, sub$D2, mean), col=cols[j], lwd=1/2, lty=1)
    #points(x = unique(sub$D2), y = tapply(sub$Con_RT, sub$D2, mean), pch=21, bg=cols[j], lwd=1.5, lty=1, col=cols[j])
    
    j <- j + 1
  }
  
  #polygon(x=c(seq(0.1, 1.5, 0.1), seq(1.5, 0.1, -0.1)), c(tops, rev(bottoms)), col = "#EE111199", border=NA)
  lines(x = unique(model$D2), y = cis[,3], col="black", lwd=2, lty=2)
  points(x = unique(model$D2), y = cis[,3], pch=21, bg="black", lwd=1, lty=1, col="black")
  arrows(x0=seq(0.1, 1.5, 0.1), x1=seq(0.1, 1.5, 0.1), 
         y0 = cis[,3], y1 = tops, col = "black", lwd=1.5, angle=90, length=0.1)
  arrows(x0=seq(0.1, 1.5, 0.1), x1=seq(0.1, 1.5, 0.1), 
         y0 = cis[,3], y1 = bottoms, col = "black", lwd=1.5, angle=90, length=0.1)
  # Legends and titles
  legend(x = "left", legend = paste("D1 =", unique(model$D1)), col= cols, 
         lty = 1, lwd = 2, bty="n")#, pch=21, pt.bg=cols)
  
  text(x=c(1.0, 1.0), y=c(0.435, 0.500), labels=c("Congruent Trials", "Incongruent\nTrials"), adj=c(0.5, 0.5))
  
  title(main="Model Incongruent Response Times\nby Levels of D1 and D2",
        xlab="Value of D2 Parameter",
        ylab="Simulated Incongruent Response Time (ms)")
  box(bty="o")
  
  
}

# Comparison of model and data 
#scomp

model_1 <- model[c("Con_RT", "Con_ACC", "Run")]
model_1$Condition <- "Congruent"
names(model_1)[1] <- "Latency"
names(model_1)[2] <- "Accuracy"

model_2 <- model[c("In_RT", "In_ACC", "Run")]
model_2$Condition <- "Incongruent"
names(model_2)[1] <- "Latency"
names(model_2)[2] <- "Accuracy"

model_comp <- merge(model_1, model_2, all=T)
names(model_comp)[3] <- "Subject"
model_comp$Source <- "Model"

model_comp$Latency <- 1000 * model_comp$Latency

simon_comp <- simon_data
simon_comp$Source <- "Data"
comp <- merge(model_comp, simon_comp, all=T)

# RMSEs of model fit

rt.diff <- tapply(comp$Latency, list(comp$Condition, comp$Source), mean)
sqrt(mean((rt.diff[,1] - rt.diff[,2])**2))

acc.diff <- tapply(comp$Accuracy, list(comp$Condition, comp$Source), mean)
sqrt(mean((acc.diff[,1] - acc.diff[,2])**2))

# Now X-squared

# In the case of binomial data, we can calculate the values directly. 
chisq.test(200 * acc.diff)

# in case of RTs, we need to use X2 for normal distributions

rt.var <- tapply(comp$Latency, list(comp$Condition, comp$Source), var)
X2 <- sum(((rt.diff[,1] - rt.diff[,2]) ** 2) / (rt.var[,1] ** 2)) 
1 - pchisq(X2,1)

#tiff("figure8.tiff", width=6, height=5, units = "in", res = 150)
paratu <- function() {
  #layout(mat = matrix(c(1, 1, 2, 3, 4, 5), nrow = 3, byrow=T),
  #       widths=c(1, 1), heights=c(1/10, 1/10, 1))
  layout(mat = matrix(c(1, 1, 2, 3), nrow = 2, byrow=T),
         widths=c(1, 1), heights=c(1/10, 1))
  
  par(mar=c(0,4,0,2))
  plot.new()
  text("Comparison of Model and Data", x=0.5, y=1, adj=c(0.5,1), cex=1.5)
  
  #par(mar=c(0,3,1,1))
  #plot.new()
  #text("Accuracy", x=0.5, y=1, adj=c(0.5,1), cex=1.5)
  
  #plot.new()
  #text("Response Times", x=0.5, y=1, adj=c(0.5,1), cex=1.5)
  
  par(mar=c(2,4,2,2))
  
  xs <- barplot(tapply(comp$Accuracy, list(comp$Condition, comp$Source), mean), 
                ylim=c(0, 1.15), ylab="Accuracy", col=c("grey75", "grey55"), 
                beside=T, legend=T, args.legend=list(x="topleft", bty="n", border="white"),
                border="white")
  ys <- tapply(comp$Accuracy, list(comp$Condition, comp$Source), mean)
  ses <- tapply(comp$Accuracy, list(comp$Condition, comp$Source), se)
  arrows(xs, ys, xs, ys + ses, length = 0.1, angle=90)
  arrows(xs, ys, xs, ys - ses, length = 0.1, angle=90)
  abline(h=0, col="black")
  title(main="(A) Accuracy")
  
  xs <- barplot(tapply(comp$Latency, list(comp$Condition, comp$Source), mean), 
                ylim=c(0, 650), ylab="Response Times (ms)", col=c("grey75", "grey55"), 
                beside=T, legend=T, args.legend=list(x="topleft", bty="n", border="white"),
                border="white")
  ys <- tapply(comp$Latency, list(comp$Condition, comp$Source), mean)
  ses <- tapply(comp$Latency, list(comp$Condition, comp$Source), se)
  arrows(xs, ys, xs, ys + ses, length = 0.1, angle=90)
  arrows(xs, ys, xs, ys - ses, length = 0.1, angle=90)
  abline(h=0, col="black")
  title(main="(B) Response Times")
  
}


oldcomp <- comp
newsims <- read.table("final.txt", sep=",")
names(newsims) <- c("Alpha", "LF", "EGS", "ANS", "Bias", "D1", "D2", "Con_ACC", "Con_RT", "Incon_ACC", "Incon_RT")

zsims <- subset(newsims, newsims$Alpha == 0.3 & 
                    newsims$EGS == 0.0 & 
                    newsims$ANS == 0.2 & 
                    newsims$LF == 0.25 & 
                    newsims$Bias == 4.0 &
                    newsims$D1 == 1.0 &
                    newsims$D2 == 1.0)

model_1 <- zsims[c("Con_RT", "Con_ACC")]
model_1$Condition <- "Congruent"
names(model_1)[1] <- "Latency"
names(model_1)[2] <- "Accuracy"

model_2 <- zsims[c("Incon_RT", "Incon_ACC")]
model_2$Condition <- "Incongruent"
names(model_2)[1] <- "Latency"
names(model_2)[2] <- "Accuracy"

model_comp <- merge(model_1, model_2, all=T)
model_comp$Source <- "Model"
model_comp$Latency <- model_comp$Latency * 1000

comp <- subset(comp, comp$Source != "Model")

comp <- merge(comp, model_comp, all=T)

papagera <- function() {
  #layout(mat = matrix(c(1, 1, 2, 3, 4, 5), nrow = 3, byrow=T),
  #       widths=c(1, 1), heights=c(1/10, 1/10, 1))
  
  ## Modify comp to include the
  layout(mat = matrix(c(1, 1, 2, 3), nrow = 2, byrow=T),
         widths=c(1, 1), heights=c(1/10, 1))
  
  par(mar=c(0,4,0,2))
  plot.new()
  text("Comparison of Model and Data", x=0.5, y=1, adj=c(0.5,1), cex=1.5)
  
  #par(mar=c(0,3,1,1))
  #plot.new()
  #text("Accuracy", x=0.5, y=1, adj=c(0.5,1), cex=1.5)
  
  #plot.new()
  #text("Response Times", x=0.5, y=1, adj=c(0.5,1), cex=1.5)
  
  par(mar=c(2,4,2,2))
  
  xs <- barplot(tapply(comp$Accuracy, list(comp$Condition, comp$Source), mean), 
                ylim=c(0, 1.15), ylab="Accuracy", col=c("grey75", "grey55"), 
                beside=T, legend=T, args.legend=list(x="topleft", bty="n", border="white"),
                border="white")
  ys <- tapply(comp$Accuracy, list(comp$Condition, comp$Source), mean)
  ses <- tapply(comp$Accuracy, list(comp$Condition, comp$Source), se)
  arrows(xs, ys, xs, ys + ses, length = 0.1, angle=90)
  arrows(xs, ys, xs, ys - ses, length = 0.1, angle=90)
  abline(h=0, col="black")
  title(main="(A) Accuracy")
  
  xs <- barplot(tapply(comp$Latency, list(comp$Condition, comp$Source), mean), 
                ylim=c(0, 650), ylab="Response Times (ms)", col=c("grey75", "grey55"), 
                beside=T, legend=T, args.legend=list(x="topleft", bty="n", border="white"),
                border="white")
  ys <- tapply(comp$Latency, list(comp$Condition, comp$Source), mean)
  ses <- tapply(comp$Latency, list(comp$Condition, comp$Source), se)
  arrows(xs, ys, xs, ys + ses, length = 0.1, angle=90)
  arrows(xs, ys, xs, ys - ses, length = 0.1, angle=90)
  abline(h=0, col="black")
  title(main="(B) Response Times")
}


# Analysis

# Make a copy
m <- model

m$D1 <- as.factor(model$D1)
m$D2 <- as.factor(model$D2)
summary(aov(In_RT ~ (D1 * D2), m))
summary(aov(Con_RT ~ (D1 * D2), m))

summary(lm(In_RT ~ (D1 * D2), model))
summary(lm(Con_RT ~ (D1 * D2), model))

# Test difference between D=0.1 and D=1.5

extremes <- subset(m, m$D2 %in% c(0.1, 1.5)) 
extremes$D1 <- as.factor(extremes$D2)
t.test(Con_RT ~ D2, extremes, var.equal = T)
t.test(In_RT ~ D2, extremes, var.equal = T)

extreme_data <- subset(data, data$ChooseB_ACC < 0.5 | data$ChooseB_ACC == 1)
extreme_data$ChooseB_ACC[extreme_data$ChooseB_ACC < 0.5] <- 0
extreme_data$ChooseB_ACC <- as.factor(extreme_data$ChooseB_ACC)
t.test(Pre_Incongruent_SimonRT ~ ChooseB_ACC, extreme_data)