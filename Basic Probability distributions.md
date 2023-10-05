# Probability Distributions in R

R comes with built-in implementations of many probability distributions. This document will show how to generate these distributions in R by focusing on making plots, giving the reader an intuitive feel for what all the different R functions are actually calculating.

Each probability distribution in R is associated with four functions that follow a naming convention: the probability density function always begins with ‘d’, the cumulative distribution function always begins with ‘p’, the inverse cumulative distribution (or quantile function) always begins with ‘q’, and a function that produces random variables always begins with ‘r’. Each function takes a single argument at which to evaluate the function, followed by specific parameters that define the particular distribution function to evaluate.

In the following, we will demonstrate usage for the density, disribution and quantile functions only. Each demonstration will include plots and simple examples.

|Name       |	Probability Density|	Cumulative Distribution|	Quantile           |
|-----------|--------------------|------------------------|--------------------|
|Normal     |	dnorm(Z,mean,sd)   |	pnorm(Z,mean,sd)       |	qnorm(Q,mean,sd)   |
|Poisson    |	dnorm(N,lambda)    |	pnorm(N,lambda)        |	qnorm(Q,lambda)    |
|Binomial   |	dbinom(N,size,prob)|	pbinom(N,size,prob)    |	qbinom(Q,size,prob)|
|Uniform    |	dunif(N,size,prob) |	punif(N,size,prob)     |	qunif(Q,size,prob) |
|Exponential|	dexp(N,rate)       |	pexp(N,rate)           |	qexp(Q,rate)       |
|χ2         |dchisq(X,df)        |	pchisq(X.df)           |	qchisq(X,df)       |


## Normal Distribution
The normal distribution $N(\mu,\sigma)$ is represented R by `dnorm`, `pnorm`, and `qnorm`, where μ
 is the mean and σ  is the standard deviation. The probability density function of the normal distribution is given by;
 $$f(x)=\dfrac{1}{\sqrt{2\pi\sigma^2}}e^{-1(\frac{x-\mu}{\sqrt{2}\sigma})^2}$$ 
 
 The probability density `dnorm` and cumulative distribution `pnorm are` defined on the entire real axis.

For example, we will use the standard normal distribution, given by μ=0  and σ=1. The density is very small outside of the interval (-3.5,3.5), so we will restrict the plots to this domain.

```
z<-seq(-3.5,3.5,0.1)  # 71 points from -3.5 to 3.5 in 0.1 steps
  q<-seq(0.001,0.999,0.001)  # 1999 points from 0.1% to 99.9% on 0.1% steps
  dStandardNormal <- data.frame(Z=z, 
                               Density=dnorm(z, mean=0, sd=1),
                               Distribution=pnorm(z, mean=0, sd=1))  
  qStandardNormal <- data.frame(Q=q, 
                                Quantile=qnorm(q, mean=0, sd=1))  
  head(dStandardNormal)
```
** Plotting the distribution**

```
# using basic plot function
plot(dStandardNormal$Z,dStandardNormal$Density, type = "l", lwd = 2, axes = FALSE, xlab = "", ylab = "")
axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", "mean", "1s", "2s", "3s"))
```
```
# plotting cumulative distribution
plot(dStandardNormal$Z,dStandardNormal$Distribution, type = "l", lwd = 2, axes = TRUE, xlab = "", ylab = "")
#axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", "mean", "1s", "2s", "3s"))
```
```
 head(qStandardNormal)
```

>**Task 1:** Create a Normal distribution with mean 50 and SD 5. Also plot the distribution.
**Solution:**

```
#define population mean and standard deviation
population_mean <- 50
population_sd <- 5

#define upper and lower bound
lower_bound <- population_mean - population_sd
upper_bound <- population_mean + population_sd

#Create a sequence of 1000 x values based on population mean and standard deviation
x <- seq(-4, 4, length = 1000) * population_sd + population_mean

#create a vector of values that shows the height of the probability distribution
#for each value in x
y <- dnorm(x, population_mean, population_sd)

#plot normal distribution with customized x-axis labels
plot(x,y, type = "l", lwd = 2, axes = FALSE, xlab = "", ylab = "")
sd_axis_bounds = 5
axis_bounds <- seq(-sd_axis_bounds * population_sd + population_mean,
                    sd_axis_bounds * population_sd + population_mean,
                    by = population_sd)
axis(side = 1, at = axis_bounds, pos = 0)
```
>**Task 2:** Assume a random variable $Z$ is distributed according to the normal distribution with mean 6 and standard deviation 4. What is the probability that Z takes on a value between -1 and 3 ?

**Solution**
\begin{array}{lc}
P(-1<Z<3)&=P(Z\leq 3)-P(Z\leq -1)\\
&=pnorm(3,6,4)-pnorm(-1,6,4)
\end{array}
```
prob=pnorm(3,6,4)-pnorm(-1,6,4)
prob
```

>**Task 2:** Assume a random variable Z is distributed according to the normal distribution with mean 20 and standard deviation 10. What is the 90% confidence interval around the mean for the expected value of Z?
**Solution:**

```
# A: Use the quantile function
upper <- qnorm(0.95, 20, 10)
lower <- qnorm(0.05, 20, 10)
c(lower, upper)
```

>**Task 3:** Assume a random variable Z is distributed according to the normal distribution with mean 20 and standard deviation 10. Find $P(Z\leq 30)$
**Solution:**

```
# A: use pnorm function
prob=pnorm(30,20,10)
prob
```

## Poisson Distribution

The pmf of a Poisson distribution with mean, $\lambda$ is defined as:
$$P(X=x)=\dfrac{e^{-\lambda}\lambda^x}{x!}$$
The Poisson distribution f(λ) is represented in R by `dpois`, `ppois`, and `qpois`. The probability density `dpois` and cumulative distribution `ppois` are defined on non-negative integers.

>For the example, we’ll use λ=2.5. To figure out a good range for plotting, we will use the qpois function to find out for a given mean, what is the least integer that bounds the cumulative Poisson distribution above 99.9%, and what is the greatest integer that bounds below at 0.1%.

```
lower<-qpois(0.001, lambda=2.5)
upper<-qpois(0.999, lambda=2,5)
n<-seq(lower,upper,1)
q<-seq(0.001,0.999,0.001)
dPoisson25 <- data.frame(N=n, 
                          Density=dpois(n, lambda=2.5),
                          Distribution=ppois(n, lambda=2.5))  
  qPoisson25 <- data.frame(Q=q, Quantile=qpois(q, lambda=2.5))  
  head(dPoisson25)
```
```
plot(dPoisson25$N,dPoisson25$Density,type='h',xlab="# samples",ylab="P(n)")
```

>**Task:** Assume a a ball from the driving range next door lands in your yard at an average rate of 3 balls per hour during the day. What is the probability that 10 or fewer golf balls will land in your yard during the afternoon, assuming the afternoon is 5 hours long?

**Solution:**

```
# A: mean is 15 = 3 * 5 for the entire afternoon
ppois(10, 15)
```
>**Task:** If a bird flies overhead at an average rate of 1 every 4 hours, what is the probability that at least one bird will fly overhead in the next hour?

