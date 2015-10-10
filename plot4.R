
#Exploratory Data Analysis

#Create Plot 4


data <- read.csv("C:\\Users\\stephanvdw\\Documents\\R\\Data\\RCourse_ED\\household_power_consumption.txt" , sep=";" , header=T)


data[,1] <- as.Date(strptime(data[,1],format="%d/%m/%Y"))
data$DateTime <- as.POSIXct(paste(data$Date,as.character(data$Time)))

data.sub1 <- data[data[,1]=="2007-02-01",]
data.sub2 <- data[data[,1]=="2007-02-02",]

data <- rbind(data.sub1,data.sub2)

for(i in 3:ncol(data)){is.na(data[,i]) <- data[,i]=="?"}
for(i in 3:9){data[,i] <- as.numeric(as.character(data[,i]))}


par(mfrow=c(2,2))

with(data,plot(DateTime,Global_active_power ,type="l",xlab="",main="",ylab="Global Active Power"))
with(data,plot(DateTime,Voltage,type="l",xlab="datetime",main="",ylab="Voltage"))

with(data,plot(data[,10],data[,7],type="n",ylab="Energy sub metering",xlab=""))
points(data[,10],data[,7],type="l",col="black")
points(data[,10],data[,8],type="l",col="red")
points(data[,10],data[,9],type="l",col="blue")
legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

with(data,plot(DateTime,Global_reactive_power ,type="l",xlab="datetime",main=""))

dev.copy(png,file="C:\\Users\\stephanvdw\\Documents\\R\\Coursera\\Course4\\Project1\\plot4.png")
dev.off()
