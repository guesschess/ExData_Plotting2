# loading files
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# total emissions from pm25 in (fips == "24510) from 1999 to 2008
sub1 <- NEI[NEI$fips == "24510",]
# subset sub1 and calculate the total emission from 1999 to 2008
sub2 <- aggregate(Emissions ~ year, sub1, sum)

# creating png file to plot
png("myPlot2b.png", width = 700, height = 700)
barplot(log(sub2$Emissions)/log(10), names.arg = sub2$year, xlab = "Years", ylab = "Emisssions",
        main = "Total Emissions from PM2.5 in Baltimore City" ,
        col = "blue")
dev.off()
