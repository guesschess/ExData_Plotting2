# read PM25 file
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# calculating each year's emission
dat1 <- sum(NEI[NEI$year == "1999",]$Emissions, na.rm = TRUE)
dat2 <- sum(NEI[NEI$year == "2002",]$Emissions, na.rm = TRUE)
dat3 <- sum(NEI[NEI$year == "2005",]$Emissions, na.rm = TRUE)
dat4 <- sum(NEI[NEI$year == "2008",]$Emissions, na.rm = TRUE)

# combine data
years <- c("1999", "2002", "2005", "2008")
total_emission <- c(dat1, dat2, dat3,dat4)
emission <- data.frame(years, total_emission)

as.numeric(emission$total_emission)

# plotting and create a png file
png("myPlot1.png", width = 500, height = 500)
barplot(emission$total_emission, col = "grey",names.arg = c("1999", "2002", "2005","2008"),
        main = "Total Emission from 1999 to 2008", xlab = "years")
dev.off()





