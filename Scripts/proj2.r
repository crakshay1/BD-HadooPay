library(ggplot2)
library(gridExtra)

# Purchase 2.
data <- read.table("/db/purchase.txt", header = FALSE, sep = "\t",
                   stringsAsFactors = FALSE)
colnames(data) <- c("City", "Amount")

summary(data) # Some stats about the cities
data$City[which.min(data$Amount)]
data$City[which.max(data$Amount)]


### First barplot yaaay
data1 <- read.table("/db/purchase1.txt", header = FALSE, sep = "\t",
                   stringsAsFactors = FALSE)
colnames(data1) <- c("categories", "income")

# Min-Max normalization, the values were messy without it
# Indeed the bars were pretty much the same, although the data showed differences
income_norm <- (data1$income - min(data1$income)) /
  (max(data1$income) - min(data1$income))

# Plot
par(mar = c(10, 5, 4, 2))
barplot(
  income_norm,
  names.arg = data1$categories,
  las = 2,
  cex.names = 0.7,
  ylim = c(0, 1),
  ylab = "Normalized income (0–1)",
  main = "Normalized Income by Product Category",
  col = "steelblue"
)





# Purchase 3.0
city_data <- read.table("/db/city.txt", sep="\t", 
                        header=FALSE, stringsAsFactors=FALSE)
colnames(city_data) <- c("key", "value")
city_data$city <- gsub("city:", "", city_data$key)

payment_data <- read.table("/db/payment.txt", sep="\t", 
                           header=FALSE, stringsAsFactors=FALSE)
colnames(payment_data) <- c("key", "value")
payment_data$payment <- gsub("payment:", "", payment_data$key)

item_data <- read.table("/db/item.txt", sep="\t", 
                        header=FALSE, stringsAsFactors=FALSE)
colnames(item_data) <- c("key", "value")
item_data$item <- gsub("item:", "", item_data$key)

date_data <- read.table("/db/date.txt", sep="\t", 
                        header=FALSE, stringsAsFactors=FALSE)
colnames(date_data) <- c("key", "value")
date_data$date <- as.Date(gsub("date:", "", date_data$key))

time_data <- read.table("/db/time.txt", sep="\t", 
                        header=FALSE, stringsAsFactors=FALSE)
colnames(time_data) <- c("key", "value")
time_data$time <- gsub("time:", "", time_data$key)


### Desc stats

# Which city has the highest/lowest number of purchases? 
city_data[which.min(city_data$value), ]
city_data[which.max(city_data$value), ]

# Pretty much the same as before : which payment method is the most/least used
payment_data[which.min(payment_data$value), ]
payment_data[which.max(payment_data$value), ]

item_data[which.min(item_data$value), ] # Has a problem with the file...
item_data[which.max(item_data$value), ] # So not included in report !

heures <- as.numeric(sub("^time:([0-9]{2}):.*", "\\1", time_data$key))
# Before or after noon??
sum(time_data$value[heures < 12]) 
sum(time_data$value[heures > 12])

# The Daily Trend plot (used this because of the huge number of dates)
ggplot(date_data, aes(x=date, y=value)) +
  geom_line(color="forestgreen") +
  labs(title="Daily Trend (2012)", x="Date", y="Value") +
  theme_minimal()
