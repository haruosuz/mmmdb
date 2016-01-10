
# Set Working Directory
#setwd("~/projects/mmmdb/")

# Loading Data into R
d <- read.csv("data/cerebella_mouse_1_known.csv")

cat("# Exploring and Transforming Dataframes\n")
dim(d)
head(d, n=3)
colnames(d)[1] <- "metabolite"
colnames(d)[3] <- "conc"
colnames(d)

cat("# Data Summary\n")
summary(d)

# Exploring Data Visually
pdf(file="analysis/plot.pdf")
par(mfrow=c(2,2))
hist(d$m.z)
hist(d$conc)
plot(d$m.z, d$conc)
barplot(sort(d$m.z), ylab = "m.z")
dev.off()

# Exporting Data
write.csv(d[order(d$m.z),], file="analysis/table.csv")

# Print R version and packages
sessionInfo()
