library(ggplot2)
# read rds files 
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# merging data
total <- merge(NEI, SCC, by = "SCC")
# thanks for my classmates' help, maybe I can use EI.sector and type to fiter more useful data
sname1 <- grep("vehicle", total$EI.Sector, ignore.case = TRUE)
sname2 <- grep("ON-ROAD", total$type, ignore.case = TRUE)
sub1 <- total[sname1|sname2,]
# filtering data using fips
sub2 <- sub1[sub1$fips == "24510" | sub1$fips == "06037", ]
# change fips' names
sub2$fips[sub2$fips == "24510"] <- "Baltimore City, MD"
sub2$fips[sub2$fips == "06037"] <- "Los Angeles County, CA"
sub3 <- aggregate(Emissions ~ year + fips, sub2, sum)

# creating a png file
png("myPlot6.png", width = 700, height = 700)

g <- ggplot(sub3, aes(x = year, y = Emissions, color = fips))
g <- g + geom_line()
g <- g + xlab("years") + ggtitle("Emissions from Motor Vehicle Sources 
                                 in Baltimore and Los Angeles County")
print(g)
dev.off()

              



