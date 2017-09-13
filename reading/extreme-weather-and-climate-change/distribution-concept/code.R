# getRversion() => 3.4.1
# packageVersion("ggplot2") => 2.2.1

library(ggplot2)

dat <- seq(-3,3, by=.1)

red <- "#D7191C" # ColorBrewer
blue <- "#2C7BB6" # ColorBrewer

p <- ggplot(data = data.frame(x = dat), aes(x)) +
  scale_x_continuous(breaks = c(-3,0,3),
                     labels=c("Cold", "Average", "Hot"),
                     limits=c(-5,5)) +
  scale_y_continuous(breaks = NULL, expand=c(0,0)) +
  labs(x="Temperature", y="", caption="ndarville.com/reading/") +
  ggtitle("Temperature w/ and w/o climate change (conceptual)") +
  stat_function(fun=dnorm, n=101, color=blue,
                args = list(mean=0, sd=1), linetype="dashed")

increasedmean <- p +
  stat_function(fun=dnorm, n=101, color=red,
                args = list(mean=1, sd=1))
increasedvariance <- p +
  stat_function(fun=dnorm, n=101, color=red,
                args = list(mean=0, sd=1.2))
increasedboth <- p +
  stat_function(fun=dnorm, n=101, color=red,
                args = list(mean=1, sd=1.2))

increasedboth
