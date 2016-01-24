# read PM25 file
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# select Baltimore city(fips == "24510")
Bdata <- NEI[NEI$fips == "24510", ]

# calculating the sum of every year in B
Bdata1 <- sum(Bdata[Bdata$year == "1999",]$Emissions, na.rm = TRUE)
Bdata2 <- sum(Bdata[Bdata$year == "2002",]$Emissions, na.rm = TRUE)
Bdata3 <- sum(Bdata[Bdata$year == "2005",]$Emissions, na.rm = TRUE)
Bdata4 <- sum(Bdata[Bdata$year == "2008",]$Emissions, na.rm = TRUE)

bte <- c(Bdata1, Bdata2, Bdata3, Bdata4)
bte.frame <- data.frame(bte)
as.numeric(bte.frame$bte)

# plotting and creating a png file
png("myPlot2.png", width = 500, height = 500)
barplot(bte.frame$bte, col = "red", names.arg = c("1999", "2002", "2005", "2008"), 
        main = "Emission in Baltimore from 1999 to 2008", xlab = "years")
dev.off()