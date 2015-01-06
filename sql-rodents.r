#This R script is to show how to query a database and work in R and github
#This is by Heather Manza
#Done on 2015-01-06

#install and load a new package
install.packages("RSQLite", dependencies=T)
library(RSQLite)

driver <- dbDriver("SQLite")
con <- dbConnect(driver, dbname="portal_mammals.sqlite")

results <- dbGetQuery(con, "SELECT species, wgt, year FROM surveys")
 
#if we are done working on the database we can disconnect
dbDisconnect(con)

#we can now plot the results
plot(results$year, results$wgt)


