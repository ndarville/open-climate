# getRversion() => 3.4.1
# packageVersion("ggplot2") => 2.2.1

library(ggplot2)

# NOAA adds title row; skip
temps <- read.csv(url("https://www.ncdc.noaa.gov/extremes/cei/us/2/06-08/data.csv"), skip=1)
# temps <- read.csv("data/us2-06-08-data.csv", skip=1)

# Make "Below" values negative; *-1
temps$Much.Below.Normal <- temps$Much.Below.Normal*-1

red <- "#D7191C" # ColorBrewer
blue <- "#2C7BB6" # ColorBrewer
black <- "#444444"

ggplot(temps, mapping = aes(x=Date)) +
  geom_bar(stat="identity", mapping = aes(y=Much.Above.Normal), fill=red, color=black) +
    geom_smooth(mapping = aes(y=Much.Above.Normal), color=red) +
    geom_hline(yintercept=mean(temps$Much.Above.Normal), linetype="dashed") +
  geom_bar(stat="identity", mapping = aes(y=Much.Below.Normal), fill=blue, color=black) +
    geom_smooth(mapping = aes(y=Much.Below.Normal), color=blue) +
    geom_hline(yintercept=mean(temps$Much.Below.Normal), linetype="dashed") +
  scale_x_continuous(breaks = seq(1910,2010, by=10)) +
  scale_y_continuous(breaks = seq(-60,60, by=10),
                     limits = c(-60,60)) +
  labs(x="Year", y="Temperature relative to normal (%)", caption="ndarville.com/reading/") +
  ggtitle("US extremes for minimum temperatures in Summer (Jun-Aug)")