# getRversion() => 3.4.1
# packageVersion("ggplot2") => 2.2.1
library(ggplot2)

bas <- read.table(url("http://www.meteoswiss.admin.ch/product/output/climate-data/homogenous-monthly-data-processing/data/homog_mo_BAS.txt"), skip=27, header=TRUE)
gve <- read.table(url("http://www.meteoswiss.admin.ch/product/output/climate-data/homogenous-monthly-data-processing/data/homog_mo_GVE.txt"), skip=27, header=TRUE)
ber <- read.table(url("http://www.meteoswiss.admin.ch/product/output/climate-data/homogenous-monthly-data-processing/data/homog_mo_BER.txt"), skip=27, header=TRUE)
sma <- read.table(url("http://www.meteoswiss.admin.ch/product/output/climate-data/homogenous-monthly-data-processing/data/homog_mo_SMA.txt"), skip=27, header=TRUE)
# bas <- read.table("data/homog_mo_BAS.txt"), skip=27, header=TRUE)
# gve <- read.table("data/homog_mo_GVE.txt"), skip=27, header=TRUE)
# ber <- read.table("data/homog_mo_BER.txt"), skip=27, header=TRUE)
# sma <- read.table("data/homog_mo_SMA.txt"), skip=27, header=TRUE)

# Combine into one
temps <- rbind(bas, gve, ber, sma)
# Subset for JJA months
jja.temps <- subset(temps, temps$Month == 6 | bas$Month == 7 | temps$Month == 8)
# Average rows with same year value, cf stackoverflow.com/a/18765852/3710111
yearly.temps <- aggregate(.~Year, FUN=mean, data=jja.temps[, -2])
# Create subset for years 1961-1990 like example
yearly.temps.subset <- subset(yearly.temps, yearly.temps$Year >= 1988 & yearly.temps$Year <= 2017)

# Create constant for year 2003
year.2003.temps <- subset(yearly.temps, yearly.temps$Year == 2003)$Temperature

ggplot(yearly.temps.subset, aes(x=Temperature)) +
  scale_x_continuous(breaks = seq(12,28, by=2),
                     limits = c(12,28)) +
  scale_y_continuous(breaks = FALSE,
                     expand=c(0,0),
                     limits = c(0,1)) + # TODO: Remove confusing space beneath minimum
  labs(x="Temperature", y="Frequency", caption="ndarville.com/reading/") +
  ggtitle("1988-2017") +
  stat_function(fun = dnorm,
                args = list(mean = mean(yearly.temps.subset$Temperature, na.rm = TRUE),
                            sd = sd(yearly.temps.subset$Temperature, na.rm = TRUE)),
                color="#444444") +
  geom_vline(xintercept=year.2003.temps, linetype="dashed", color="#D7191C") +
  geom_text(
    aes(x=year.2003.temps,
        label="2003",
        y=0.5),
    colour="#444444",
    angle=90) +
  geom_vline(xintercept=yearly.temps.subset$Temperature, color="#2C7BB6")

