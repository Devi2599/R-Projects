

```{r, message=FALSE, warning=FALSE}
library(ggplot2)
> 
  > # Define data and categories
  > data <- c("Operational risk mitigation", "Fraud detection", "Information asymmetry", "Regulatory compliance")
  > values <- c(0.35, 0.25, 0.2, 0.2)
  > 
    > # Create bar chart
    > ggplot(data.frame(data, values), aes(x=data, y=values)) +
    +     geom_bar(stat="identity", fill="blue") +
    +     labs(title="Uses of Big Data in Financial Organizations", x="", y="Proportion") +
    +     theme(plot.title = element_text(size=18, hjust=0.5),
                +           axis.text.x = element_text(size=14, angle=45, hjust=1),
                +           axis.text.y = element_text(size=14),
                +           axis.title = element_text(size=16))

  
 ```
 library(ggplot2)
 >  
   >      # Define data and categories
   >      data <- c(" 2010-01-01","2010-01-05", "2010-01-09","2010-01-13",    
                    +       "2010-01-17","2010-01-21","2020-12-10","2020-12-14","2020-12-18",    
                    +       "2020-12-22","2020-12-26","2020-12-31"  )
 >      values <- c("50.60198","21.87261","43.36818","42.64465","62.48203",
                    +         "60.35669","43.25684","46.66042","55.24340","43.62941","41.33274",
                    +        "49.96300")
 >      
   >          # Create bar chart
   >          ggplot(data.frame(data, values), aes(x=data, y=values)) +
   +              geom_bar(stat="identity", fill="blue") +
   +              labs(title="Uses of Big Data in Financial Organizations", x="Dates", y="Stock_Prices") 
 >              theme(plot.title = element_text(size=18, hjust=0.5),
                      +                                axis.text.x = element_text(size=14, angle=45, hjust=1),
                      +                                axis.text.y = element_text(size=14),
                      +                                axis.title = element_text(size=16))` 
 
 ```
 
 # Load the required library
 > library(tidyverse)
 > library(lubridate)
 > 
   > # Define the number of data points
   > n <- 1000
 > 
   > # Create a sequence of dates starting from 2010-01-01 to 2020-12-31
   > dates <- seq(as.Date("2010-01-01"), as.Date("2020-12-31"), length.out = n)
 > 
   > # Generate synthetic stock prices
   > stock_prices <- rnorm(n, mean = 50, sd = 10)
 > 
   > # Create a data frame containing the dates and stock prices
   > fin_data <- data.frame(date = dates, stock_price = stock_prices)
 > 
   > # Print the first few rows of the data frame
   > rbind(head(fin_data),tail(fin_data))
 