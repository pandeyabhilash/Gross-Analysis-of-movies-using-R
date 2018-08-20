#homework 6

mov <- read.csv("Section6-Homework-Data.csv")
View(mov)

head(mov)
summary(mov)
str(mov)

ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()

filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")
filt2 <- mov$Studio %in% c("Buena Vista Studios","WB","Fox","Universal","Sony","Paramount Pictures")

mov2 <- mov[filt & filt2,]

p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p

p + geom_point()

p + geom_boxplot()

p + geom_boxplot() + geom_point()

p + geom_boxplot() + geom_jitter()

p  + geom_jitter() + geom_boxplot()

p  + geom_jitter() + geom_boxplot(alpha=0.7)

p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7,outlier.color = NA) 

q <- p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7,outlier.color = NA) 

q

q <- q +
  xlab("Genre") + #x axis title
  ylab("Gross % US") + #y axis title
  ggtitle("Domestic Gross % by Genre") #plot title
q


q <- q + 
  theme (
    text = element_text(family="Comic Sans MS"),
    
    axis.title.x = element_text(colour="Blue", size=30),
    axis.title.y = element_text(colour="Blue", size=30),
    
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),  
    
    plot.title = element_text(colour="Black",
                              size=40),
    legend.title = element_text(size=20),
    legend.text  = element_text(size=12)
  )
q

q$labels$size = "Budget $M"
q


