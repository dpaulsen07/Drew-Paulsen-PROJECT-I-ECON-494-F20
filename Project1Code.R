########################
## DREW'S NBA DATASET ##
########################

#INTRODUCTION - Getting the data

#Data obtained from Basketball Reference
#Website URL: https://www.basketball-reference.com/leagues/NBA_stats_per_game.html
#Copy & paste data into excel spreadsheet, save as Comma Separated Values (.csv)
#Once file is saved as CSV, find location of CSV and use "read.csv()" function. Store data in variable name (of your choice)

MyData <- read.csv("/Users/dpaulsen/Downloads/ECON494Data.csv")

#To view the data as a table, use View() function

View(MyData)

#Now data is ready to be tidied up!

################
# DATA TIDYING #
################

#N/As already given in data - not necessary to clean

#Column Names messed up - Changing names to columns
#Column 11 - "X3P" > change to "x3P"
names(MyData)[names(MyData) == "X3P"] <- "x3P"

#Column 12 - "X3PA" > change to "x3PA"
names(MyData)[names(MyData) == "X3PA"] <- "x3PA"

#Column 24 - "FG." > change to "FGp"
names(MyData)[names(MyData) == "FG."] <- "FGp"

#Column 25 - "X3P." > change to "x3Pf"
names(MyData)[names(MyData) == "X3P."] <- "x3Pp"

#Column 26 - "FT." > change to "FTp"
names(MyData)[names(MyData) == "FT."] <- "FTp"

#Column 28 - "eFG." > change to "eFGp"
names(MyData)[names(MyData) == "eFG."] <- "eFGp"

#Column 29 - "TOV." > change to "TOVp"
names(MyData)[names(MyData) == "TOV."] <- "TOVp"

#Column 30 - "ORB." > change to "ORBp"
names(MyData)[names(MyData) == "ORB."] <- "ORBp"


#For my analysis, I did not care to include columns 3-6.
#I didn't feel they added anything more to my analysis.
#Deleting columns 3-6 from the dataframe:

df <- MyData[-c(3:6)]
View(df)

#Should result in 28 variables instead of 32.
#Data is ready for analysis.

########################
# EXPLORATORY ANALYSIS #
########################

#How has the NBA changed over time?
#What business decisions should be made to increase profits?

#Shooting - how has shooting changed over time? (Present to past)
#FGA
ggplot(df, aes(x = Rk)) + geom_line(aes(y = FGA)) + ggtitle("Field Goals Attempted")
#FGp
ggplot(df, aes(x = Rk)) + geom_line(aes(y = FGp)) + ggtitle("Field Goal Percentage")
#x3PA
ggplot(df, aes(x = Rk)) + geom_line(aes(y = x3PA)) + ggtitle("3 Pointers Attempted")
#x3Pp
ggplot(df, aes(x = Rk)) + geom_line(aes(y = x3Pp)) + ggtitle("3 Point Percentage")
#FGp & x3Pp
ggplot(df, aes(x = Rk)) + geom_line(aes(y = FGp, color = "FGp")) + geom_line(aes(y = x3Pp, color = "x3Pp")) + ggtitle("Field Goal Percentages")
#eFGp
ggplot(df, aes(x = Rk)) + geom_line(aes(y = eFGp)) + ggtitle("Effective Field Goal Percentage")

#Pace and style of play - how are games played?
#Pace
ggplot(df, aes(x = Rk)) + geom_line(aes(y = Pace)) + ggtitle("Possessions per 48 Minutes")
#FTA
ggplot(df, aes(x = Rk)) + geom_line(aes(y = FTA)) + ggtitle("Free Throws Attempted")
#TOV
ggplot(df, aes(x = Rk)) + geom_line(aes(y = TOVp)) + ggtitle("Turnovers per 100 possessions")


