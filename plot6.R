setwd("~/Documents/Studying/Rcourse/pm_hw")
library(grDevices)
library(ggplot2)
if(!exists("nei")){
  nei <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("scc")){
  scc <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
}
motor <- grep("vehicle",scc$EI.Sector,value = T,ignore.case = T)
moto <- subset(scc,scc$EI.Sector %in% motor)
mot <- subset(nei,nei$SCC %in% moto$SCC)
la <- subset(mot,fips=="06037"|fips=="24510")
lasum <- aggregate(Emissions~year+fips,la,sum)
lasum$City <- rep(NA,nrow(lasum))
lasum[lasum$fips=="24510",][,"City"] <- "Baltimore City"
lasum[lasum$fips=="06037",][,"City"] <- "Los Angeles City"
png("plot6.png",width = 960,height = 480)
g <- ggplot(lasum,aes(year,Emissions))
g <- g+geom_smooth(method = loess,size=1)+facet_grid(.~City)
g <- g+ggtitle("PM2.5 Emissions from motor vehicle sources")
print(g)
dev.off()