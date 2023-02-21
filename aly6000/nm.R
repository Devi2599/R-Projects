```{r libraries data, message=FALSE, warning=FALSE}
# Libraries

library(readxl)
library(readr)
library(tidyverse)
library(dplyr)
library(knitr)
library(kableExtra)
library(magrittr)
library(RColorBrewer)



#Data sets(add importing codes here)
MyData =  readxl::read_excel("Datasets/M2Data.xlsx")

read_excel("Datasets/M2Data.xlsx")
#TASK1-FIRST AND LAST ROWS OF MARKET DATASET
# obtain the top and bottom rows
head_rows = head(MyData, n=5)

tail_rows = tail(MyData, n=5)

#combining the two sets into a single one
final_rows = rbind(head_rows,tail_rows)

#organize into one table
final_table = knitr::kable(final_rows,
                           align = "c",
                           digits = 2,
                           format = "html",
                           table.attr = "style='width:45%;'")

#OBSERVATIONS:It is important to create the vector object before binding it.

#TASK2-CATEGORIES AND FREQUENCIES OF THE MARKET

Market = MyData$Market

table(MyData$Market)
as.data.frame(table(MyData$Market))

knitr::kable(MyData$Market,
             align = "c", 
             digits = 2,
             format = "html",
             table.attr = "style='width:40%;'")

#OBSERVATIONS- 1.IN THE MARKET ASIA PACIFIC HAS A HIGHEST FREQUENCY AND AFRICA HAS THE LOWEST FREQUENCY
````{r}
#TASK3-BARPLOT FOR MARKET

#create horizontal bar plot
Market_T =table(MyData$Market)




#creating horizontal bar graph
Market_bar = barplot(Market_T, main = "Horizontal_bar" ,xlab = "row_count" ,ylab = "market_places", col ="green" ,xlim =c(0,450), horiz = TRUE ,las= 1,cex.axis =0.3 ,cex.names =0.5 ,cex.lab = 0.6)

#Task4-product category-Africa

Mafrica = filter(MyData, Market == 'Africa')
filter(Mafrica, Market == 'Africa')

t4Africa = dplyr::filter(Mafrica, Market == 'Africa')
knitr::kable(head(Mafrica[], 'simple'))

task_p = Mafrica$Product_Category
table(Mafrica$Product_Category)
pie_label = unique(Mafrica$Product_Category)
as.data.frame(table(task_p))

task_p %>%
  table(Mafrica$Product_Category) %>%
  pie_label = unique(Mafrica$Product_Category) %>%
  pie(Mafrica$Product_Category, labels = pie_label, radius = 0.9)

#TASK5-PRODUCT_SUBCATEGORY

```{r libraries data,message=FALSE, warning=FALSE}

task_t = Mafrica$Product_SubCategory
table(Mafrica$Product_SubCategory)
as.data.frame(table(task_t))


#TASK6-CREATE A BAR PLOT
#Create a table
task5_table = table(Mafrica$Product_SubCategory)

#Plot the table using a bar plot
t5bar = barplot(task5_table,horiz = T)

#use text() to show values per column
text(y=table(Mafrica$Product_SubCategory),
     t5bar,
     table(Mafrica$Product_SubCategory),
     cex.name=0.8,cex.lab=0.7,cex.axis =0.4)

##TASK7-SALES/SUBCATEGORY
task_q = Mafrica$Sales
task_t = Mafrica$Product_SubCategory
table(Mafrica$Product_SubCategory)
as.data.frame(table(task_t))

tapply(task_q,task_t, mean)
as.data.frame(tapply(task_q,task_t, mean))

#create object 'meanSales' to store data
meanSales = tapply(task_q, task_t, mean)
#present data using table
knitr::kable(meanSales)

dotchart(meanSales, xlab = 'no. of sales' , ylab = 'Africa-Subcategory')

##Task9
task_r = Mafrica$Region
table(Mafrica$Region)
as.data.frame(table(task_r))
task_s = Mafrica$ShippingCost
tapply(task_s, task_r, mean)
yt = as.data.frame(tapply(task_s, task_r, mean))

#Create a table
task8_table = table(Mafrica$Region)

#Plot the table using a bar plot
t8bar = barplot(task8_table, horiz = T)

#use text() to show values per column
text(y=table(Mafrica$Region),
     t8bar,
     table(Mafrica$Region),
     cex.lab=0.8,cex.axis=0.5)


###task 11
par(mfcol=c(2,1),
    mai=c(1, 1, 0.2, 0.4),
    mar=c(4,4,0.5,2))

#present a box plot of all profits
boxplot(MyData$Profits,
        horizontal = T)

#present a histogram of all profits
hist(MyData$Profits,
     breaks = 50,
     main = "")

##task13

t13LATAM = filter(MyData, Market == 'LATAM')
filter(t13LATAM, Market == 'LATAM')
knitr::kable(head(t13LATAM[], 'simple'))

task_a = t13LATAM$Region
table(t13LATAM$Region)
as.data.frame(table(task_a))

#Create a table
task14_table = table(t13LATAM$Region)

##TASK15-TABLE(CUMSUM,PROB)
t15 = MyData$Product_SubCategory %>%
  table() %>%
  as.data.frame() %>%
  rename(Frequency = Freq) %>%
  mutate(Cumsum = cumsum(Frequency), 
         Probabilities = Frequency/nrow(MyData),
         Cumprob = cumsum(Probabilities))
knitr::kable(t15,
             digits = 2,
             caption = "LATAM-Product_Subcategory",
             format = "html",
             table.attr = "style ='width:40%;'",
             align = 'c') %>%
  kable_classic(bootstrap_options = "striped",
                full_width = TRUE,
                position = "center",
                font_size = 12)
##TASK16-PROB GRAPHS

pie_label1 = MyData$Product_SubCategory %>%
  pie(t15$Frequency)
pie(t15$Frequency, labels = pie_label1, radius = 0.5)

barplot(t15$Cumsum)


pie(t15$Probabilities)

barplot(t15$Cumprob)













