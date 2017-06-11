setwd("~/Documents/Studying/Rcourse/pm_hw")
library(grDevices)
library(ggplot2)
if(!exists("nei")){
  nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("scc")){
  scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
}
coal <- grep("coal",scc$EI.Sector,value = T,ignore.case = T)
scc_coal <- subset(scc,scc$EI.Sector %in% coal,select = T)
nei_coal <- subset(nei,nei$SCC %in% scc_coal$SCC)
neicg <- aggregate(Emissions~year,nei_coal,sum)
png("plot4.png",width = 480,height = 480)
g <- ggplot(neicg,aes(x=year,y=Emissions))
g <- g+geom_smooth(size=1,method = loess)
g <- g+ggtitle("PM2.5 Emissions from coal combustion-related sources in U.S")
print(g)
dev.off()