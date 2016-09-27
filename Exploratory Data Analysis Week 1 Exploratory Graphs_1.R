#EXPLORATORY DATA ANALYSIS
#WEEK 1
#EXPLORATORY GRAPHS (1)
#2

setwd("C:/Users/segran.pillay/My Documents/Exploratory Data Analysis/Data")
#if(!file.exists("./data")){dir.create("./data")}
#fileURL <- "xx"
#download.file(fileURL,destfile = "./data/xx.csv")
#readDATA <- read.csv("./data/xx.csv")

pollution <- read.csv("avgpm25.csv",colClasses = c("numeric","character","factor","numeric","numeric"))
head(pollution)

#Lesson 1

        #Five Number Summary
                summary(pollution$pm25)
        
        #Boxplot
                boxplot(pollution$pm25,col = "blue")
        
        #Histogram 
                hist(pollution$pm25,col = "green")
                rug(pollution$pm25)
        
                hist(pollution$pm25,col = "green",breaks = 100)
                rug(pollution$pm25)
        #Overlaying Features
                boxplot(pollution$pm25, col = "blue")
                abline(h=12)  #horizontal line with national ambient avg of 12
                
                hist(pollution$pm25,col = "green")
                abline(v=12,lwd=2)
                abline(v=median(pollution$pm25),col = "magenta",lwd=4)
        #Barplot
                barplot(table(pollution$region),col = "wheat", main = "Number of Counties in Each Region")
                
     #Exploratory Graphs part 2
                #Multiple Boxplots
                boxplot(pm25 ~ region, data =pollution,col="red")
                
                #Multiple Histograms
                par(mfrow =c(1,2), mar=c(4,4,2,1))
                hist(subset(pollution,region =="east")$pm25,col="green")
                hist(subset(pollution,region =="west")$pm25,col="green")
                
                #Scatterplot
                with(pollution, plot(latitude,pm25))
                abline(h=12,lwd=2,lty=2)
                
                #Scatterplot - using color
                with(pollution, plot(latitude,pm25,col = region))
                abline(h=12,lwd=2,lty=2)
                
                
                #Multiple Scatterplot - using color
                par(mfrow =c(1,2), mar=c(5,4,2,1))
                with(subset(pollution, region == "west"), plot(latitude,pm25,main = "west"))
                with(subset(pollution, region == "east"), plot(latitude,pm25,main = "east"))

#Lesson 2: Plotting                

                #Base Plots
                library(datasets)
                data(cars)
                with(cars, plot(speed,dist))
                
                #Lattice Package
                 #install.packages("lattice")
                
                library(lattice)
                state <- data.frame(state.x77,region = state.region)
                xyplot(Life.Exp ~ Income | region, data =state, layout= c(4,1))
                
                
                #GGPLOT2
                library(ggplot2)
                data(mpg)
                qplot(displ,hwy,data =mpg)
                
                
#BASE PLOTTING SYSTEM PART 1
        #Simple Base Graphics: Histogram
        library(datasets)
        hist(airquality$Ozone)
        