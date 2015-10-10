#Exploratory Data Analysis

#Create Plot 1



data <- read.csv("C:\\Users\\stephanvdw\\Documents\\R\\Data\\RCourse_ED\\household_power_consumption.txt" , sep=";" , header=T)
data[,1] <- as.Date(strptime(data[,1],format="%d/%m/%Y"))
data$DateTime <- as.POSIXct(paste(data$Date,as.character(data$Time)))

data.sub1 <- data[data[,1]=="2007-02-01",]
data.sub2 <- data[data[,1]=="2007-02-02",]

data <- rbind(data.sub1,data.sub2)

for(i in 3:ncol(data)){is.na(data[,i]) <- data[,i]=="?"}
for(i in 3:9){data[,i] <- as.numeric(as.character(data[,i]))}

#Create the first plot - histogram

hist(data[,3],main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red")

dev.copy(png,file="C:\\Users\\stephanvdw\\Documents\\R\\Coursera\\Course4\\Project1\\plot1.png")
dev.off()
