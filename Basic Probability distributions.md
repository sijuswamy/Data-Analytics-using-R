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
