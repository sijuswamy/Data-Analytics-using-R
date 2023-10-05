# Probability Distributions in R

R comes with built-in implementations of many probability distributions. This document will show how to generate these distributions in R by focusing on making plots, and so give the reader an intuitive feel for what all the different R functions are actually calculating.

Each probability distribution in R is associated with four functions which follow a naming convention: the probability density function always begins with ‘d’, the cumulative distribution function always begins with ‘p’, the inverse cumulative distrobution (or quantile function) always beings with ‘q’, and a function that produces random variables always begins with ‘r’. Each function takes a single argument at which to evaluate the function followed by specific parameters that define the particular distribution function to evaluate.

In the following we will demonstrate usage for the density, disribution and quantile functions only. Each demonstration will include plots and simple examples.

|Name       |	Probability Density|	Cumulative Distribution|	Quantile           |
|-----------|--------------------|-------------------------|---------------------|
|Normal     |	dnorm(Z,mean,sd)   |	pnorm(Z,mean,sd)       |	qnorm(Q,mean,sd)   |
|Poisson    |	dnorm(N,lambda)    |	pnorm(N,lambda)        |	qnorm(Q,lambda)    |
|Binomial   |	dbinom(N,size,prob)|	pbinom(N,size,prob)    |	qbinom(Q,size,prob)|
|Uniform    |	dunif(N,size,prob) |	punif(N,size,prob)     |	qunif(Q,size,prob) |
|Exponential|	dexp(N,rate)       |	pexp(N,rate)           |	qexp(Q,rate)       |
|χ2         |dchisq(X,df)        |	pchisq(X.df)           |	qchisq(X,df)       |


## Normal Distribution
The normal distribution $N(\mu,\sigma)$ is represented R by `dnorm`, `pnorm`, and `qnorm`, where μ
 is the mean and σ  is the standard deviation. The probability density `dnorm` and cumulative distribution `pnorm are` defined on the entire real axis.

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
plot(z,dStandardNormal, type = "l", lwd = 2, axes = FALSE, xlab = "", ylab = "")
axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", "mean", "1s", "2s", "3s"))
```

```
 head(qStandardNormal)
```
