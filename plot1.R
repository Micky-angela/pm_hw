setwd("~/Documents/Studying/Rcourse/pm_hw")
library(grDevices)
if(!exists("nei")){
  nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("scc")){
scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
}
age <- aggregate(Emissions~year,nei,sum)
png("plot1.png",width = 480,height = 480)
barplot(height = age$Emissions,names.arg = age$year,main = "PM2.5 Emissions in U.S",xlab = "Year",ylab = "Emissions")
dev.off()