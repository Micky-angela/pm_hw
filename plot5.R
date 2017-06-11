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
bals <- subset(mot,fips=="24510")
blas1 <- aggregate(Emissions~year,bals,sum)
png("plot5.png",width = 480,height = 480)
plot(blas1$year,blas1$Emissions,type = "l",main = "PM2.5 Emissions from motor vehicle sources in Baltimore City",xlab = "Year",ylab = "Emissions")
dev.off()
