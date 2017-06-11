setwd("~/Documents/Studying/Rcourse/pm_hw")
library(grDevices)
library(ggplot2)
if(!exists("nei")){
  nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("scc")){
  scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
}
bal <- subset(nei,fips == "24510")
agbal <- aggregate(Emissions~year+type,bal,sum)
png("plot3.png",width = 480,height = 480)
g <- ggplot(agbal,aes(x=year,y=Emissions,color=type))
g <- g+ geom_smooth(size=1,method = loess)
g <- g+ ggtitle("PM2.5 Emissions in Baltimore City")
print(g)
dev.off()
