# This R script uses the `reshape2` package to reshape data: the function `cast()` turns long data into wide data.

# Set Working Directory
#setwd("~/projects/mmmdb/")

# List files in a directory
files <- list.files(path="data", pattern="_known\\.csv", full.names=TRUE)
files <- files[-grep(pattern="plasma", x=files)]

# Loading Data into R
ld <- lapply(files, read.csv, col.names=c("metabolite", "mz", "conc"))

# name each list item with the filename (sans full path)
names(ld) <- basename(files)

# Using do.call() and rbind to merge this data together
d <- do.call(rbind, ld)

# extract the sample name and replicate number and add these as columns in the dataframe
d$sample_number <- sub("(.+)_mouse_([12])_known\\.csv\\.[0-9]+", "\\1_\\2", rownames(d))

# reshape data: reshape2::dcast turns long data into wide data.
library(reshape2)
d <- dcast(d, sample_number ~ metabolite, value.var = "conc")
rownames(d) <- d[,1]; d <- d[,-1]
d <- na.omit(t(d))

# Exporting Data
write.csv(d, file="analysis/table_reshape2.csv")

cat("# Exploring Dataframes\n")
dim(d)
colnames(d)
head(d, n=2)
tail(d, n=2)

# Exploring Data Visually
pdf(file="analysis/plot_reshape2.pdf")
par(mfrow=c(1,1))
heatmap(d)
plot(as.data.frame(d[,c(9:10,13:14)]))
par(mfrow=c(2,2), cex = 0.7, oma = c(0, 1.5, 0, 0)) # oma = c(bottom, left, top, right)
for(key in rownames(d)) barplot(d[key,], main=key, horiz=TRUE, las=1, xlab="Concentration")
dev.off()

# Print R version and packages
sessionInfo()
