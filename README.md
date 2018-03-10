# Data-wrangling-and-visualization-practice-tidycensus

Collect data of the average travel time from home to work in Philadelphia, 2013-2016 through tidycensus. Make gif indicates the change of average travel time in different areas of Philadephia.

Average travel time from home to work in Philadelphia is appealing for me because I participate in a project to predict the demand for bike sharing in low-income communities. We have found out that the demand for bike sharing is closely related to the average commuting time from home to work. People with middling commuting time, like 300 to 1000 minutes per month, are most likely to use shared bikes.

I used tidycensus package to acquire data. Firstly, I set up working direction, set API key and loaded variable list in tidycensus. Secondly, I searched the list to find aggregated travel time in different years. Thirdly, I mapped the variables in fixed legend limit(0-3000 minutes per month) and added explanatory features. Lastly, I exported jpgs and made gif.

The gif suggests that from 2013 to 2016, the average travel time is increasing, especially in north Philadelphia. The applicable low-income area for biking sharing stations is shrinking. However, consider traffic congestion contributes to the increase of traffic time, we could still consider communities to the north of university city and center city.

