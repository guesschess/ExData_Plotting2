# In US, emissions from coal combustion-related sources changed from 1999-2008
#import ggplot2 library
library(ggplot2)
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# combine NEI and SCC
total <- merge(NEI, SCC, by = "SCC")

# find coal-related sourse from SCC
sname <- grep("coal", SCC$Short.Name, ignore.case = TRUE)

#head(sname)

# filter coal combustion-related sources in total
tdata <- total[sname,]
# total emission per year
totalperyear <- aggregate(Emissions ~ year, data = tdata, sum)
# plotting and creating a png file for it 
png("myplot4.png", width = 700, height = 700)
g <- ggplot(totalperyear, aes(x = year, y = Emissions))
g <- g + geom_line()
g <- g + xlab("years") + ggtitle("Emission from Coal-related Source from 1999 to 2008")

print(g)
dev.off()