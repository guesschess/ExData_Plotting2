# Plotting emissions from motor vehicle sources changed from 1999-2008 in Baltimore City
library(ggplot2)
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# merge these two data frames by SCC
total <- merge(NEI, SCC, by = "SCC")
# filtering data in Baltimore City
sub1 <- total[total$fips == "24510",]
sname1 <- grep("vehicle", sub1$EI.Sector, ignore.case = TRUE)
sname2 <- grep("on-road", sub1$type, ignore.case = TRUE)
# filtering motor vehicle sources
sub2 <- sub1[sname1|sname2,]
sub3 <- aggregate(Emissions ~ year, data = sub2, sum)

# plotting and creating png file for it
png("myPlot5.png", width = 700, height = 700)

g <- ggplot(sub3, aes(x = year, y = Emissions))
g <- g + geom_line()
g <- g + xlab("years") + ggtitle("Motor Vehicle Sources Changed from 1999 to 2008")

print(g)
dev.off()
# comments: no related data related to "Motor"

