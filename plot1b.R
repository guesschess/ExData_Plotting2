# loading files
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# total emissions from pm2.5 in the United States from 1999 to 2008
sub1 <- aggregate(Emissions ~ year, NEI, sum)
# creating png file
png("myPlot1b.png", width = 700, height = 700)
barplot(log(sub1$Emissions)/log(10), names.arg = sub1$year, xlab = "years", ylab = "Emissions", main = "Total Emissions from PM25 in the United States
     from 1999 to 2008")
dev.off()
