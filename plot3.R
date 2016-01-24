#import ggplot2 library
library(ggplot2)
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# using Baltimore city data
sub1 <- NEI[NEI$fips == "24510",]
#head(sub1)

# four types of sources(point, nonpoint, onroad, nonroad)
diffemission <- aggregate(Emissions ~ year + type, data = sub1, sum)

# plotting and creating png file 
png("myPlot3.png", width = 700, height = 700)

g <- ggplot(diffemission, aes(x = year, y = Emissions, color = type) ) 
g <- g + geom_line() + xlab("years") + ggtitle("Total Emission of Baltimore City from 1999 to 2008")

print(g)
dev.off()


