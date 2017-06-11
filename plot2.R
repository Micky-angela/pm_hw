setwd("~/Documents/Studying/Rcourse/pm_hw")
library(grDevices)
if(!exists("nei")){
  nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("scc")){
  scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
}
bal <- subset(nei,fips == "24510")
bals <- aggregate(Emissions~year,bal,sum)
png("plot2.png",width = 480,height = 480)
plot(bals$year,bals$Emissions,type = "l",main = "PM2.5 Emissions in Baltimore City",xlab = "Year",ylab = "Emissions")
dev.off()