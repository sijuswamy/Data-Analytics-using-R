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
 $$f(x)=\dfrac{1}{\sqrt{2\pi\sigma^2}}e^{-(\frac{x-\mu}{\sqrt{2}\sigma})^2}$$
 
 The probability density `dnorm` and cumulative distribution `pnorm are` defined on the entire real axis.

For example, we will use the standard normal distribution, given by μ=0  and σ=1. The density is very small outside of the interval (-3.5,3.5), so we will restrict the plots to this domain.

```python
z<-seq(-3.5,3.5,0.1)  # 71 points from -3.5 to 3.5 in 0.1 steps
  q<-seq(0.001,0.999,0.001)  # 1999 points from 0.1% to 99.9% on 0.1% steps
  dStandardNormal <- data.frame(Z=z, 
                               Density=dnorm(z, mean=0, sd=1),
                               Distribution=pnorm(z, mean=0, sd=1))  
  qStandardNormal <- data.frame(Q=q, 
                                Quantile=qnorm(q, mean=0, sd=1))  
  head(dStandardNormal)
```
**Plotting the distribution**

```r
# using basic plot function
plot(dStandardNormal$Z,dStandardNormal$Density, type = "l", lwd = 2, axes = FALSE, xlab = "", ylab = "")
axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", "mean", "1s", "2s", "3s"))
```
```r
# plotting cumulative distribution
plot(dStandardNormal$Z,dStandardNormal$Distribution, type = "l", lwd = 2, axes = TRUE, xlab = "", ylab = "")
#axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", "mean", "1s", "2s", "3s"))
```
```
 head(qStandardNormal)
```

>**Task 1:** Create a Normal distribution with mean 50 and SD 5. Also plot the distribution.

**Solution:**

```r
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
```r
prob=pnorm(3,6,4)-pnorm(-1,6,4)
prob
```

>**Task 2:** Assume a random variable Z is distributed according to the normal distribution with mean 20 and standard deviation 10. What is the 90% confidence interval around the mean for the expected value of Z?

**Solution:**

```r
# A: Use the quantile function
upper <- qnorm(0.95, 20, 10)
lower <- qnorm(0.05, 20, 10)
c(lower, upper)
```

>**Task 3:** Assume a random variable Z is distributed according to the normal distribution with mean 20 and standard deviation 10. Find $P(Z\leq 30)$.

**Solution:**

```r
# A: use pnorm function
prob=pnorm(30,20,10)
prob
```
## Binomial Distribution
The pmf of binomial distribution is given by $$P(x)=\binom n x p^x(1-p)^{n-x}$$

![](
The Binomial distribution f(n,p) is represented in R by dbinom, pbinom, and qbinom. In the formula, n is the number of trials of some random process that can take on one of two discrete values, say 1 for success and 0 for failure, and p is the probability of success for each trial. The probability density dbinom and cumulative distribution pbinom are defined on the non-negative integers up to and including n.

For the example, we’ll look at n=100 and p=0.5, like 100 coin flips. To figure out a good range for plotting, we will use the qbinom function to find out for a given n and p, what is the least integer that bounds the cumulative Binomial distribution above 99.9%, and what is the greatest integer that bounds below at 0.1%.

```r
lower<-qbinom(0.001, size=100, prob=0.5)
  upper<-qbinom(0.999, size=100, prob=0.5)
  n<-seq(lower,upper,1)
  q<-seq(0.001,0.999,0.001)
  dBinom100 <- data.frame(N=n, 
                          Density=dbinom(n, size=100, prob=0.5),
                          Distribution=pbinom(n, size=100, prob=0.5))  
  qBinom100 <- data.frame(Q=q, Quantile=qbinom(q, size=100, prob=0.5))
```
**Plotting the distribution**

```r
plot(dBinom100$N,dBinom100$Density,type='h')
```

>**Task:** Assume a coin is weighted so that it comes up heads 60% of the time. What is the prbability that you will obtain 25 or more heads in 50 flips?

**Solution:**

```r
# A: Use pbinom to get the probability of 25 or less heads, and subtract from 1 
1 - pbinom(25,50,0.6)
```

>**Task:** Assume a standard die is rolled 10 times. What it the probability that you will roll fewer than 5 sixes?

**Solution:**

```r
# A: Use pbinom to sum the cases 0, 1, 2, 3, and 4 and subtract from 1.
pbinom(4, 10, 0.16)
```
>**Task:** Assume you flip a fair coin 100 times. What is the number N that, 90% of the time, the number of heads is less than or equal to N?

**Solution:**

```r
# A: Use the quantile function.  
qbinom(0.9, 100, 0.5)
```

## Poisson Distribution

The pmf of a Poisson distribution with mean, $\lambda$ is defined as:
$$P(X=x)=\dfrac{e^{-\lambda}\lambda^x}{x!}$$
The Poisson distribution f(λ) is represented in R by `dpois`, `ppois`, and `qpois`. The probability density `dpois` and cumulative distribution `ppois` are defined on non-negative integers.

>For the example, we’ll use λ=2.5. To figure out a good range for plotting, we will use the qpois function to find out for a given mean, what is the least integer that bounds the cumulative Poisson distribution above 99.9%, and what is the greatest integer that bounds below at 0.1%.

```r
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
```r
plot(dPoisson25$N,dPoisson25$Density,type='h',xlab="# samples",ylab="P(n)")
```

>**Task:** Assume a a ball from the driving range next door lands in your yard at an average rate of 3 balls per hour during the day. What is the probability that 10 or fewer golf balls will land in your yard during the afternoon, assuming the afternoon is 5 hours long?

**Solution:**

```r
# A: mean is 15 = 3 * 5 for the entire afternoon
ppois(10, 15)
```
>**Task:** If a bird flies overhead at an average rate of 1 every 4 hours, what is the probability that at least one bird will fly overhead in the next hour?

**Solution:**
```r
# A: The mean is 0.25 birds per hour.  Subtract of the case that no birds 
#    will fly over
1 - ppois(0, 0.25)
```

## Exponential Distribution
The pdf of exponential distribution is $f(r)=re^{-r}$. The Exponential distribution f(r) is represented in R by `dexp`, `pexp`, and `qexp`. In the formula, r is the decay rate of the exponential.The probability density dexp and cumulative distribution pexp are defined on the non-negative reals.

For the example, we’ll use r=0.2. To figure out a good range for plotting, we will use the qexp function to find out for a given rate, what is the least number that bounds the cumulative Exponential distribution above 99.9%, and what is the greatest integer that bounds below at 0.1%.

```r
lower <- floor(qexp(0.001, rate=0.2))
  upper <- ceiling(qexp(0.999, rate=0.2))
  t <- seq(lower,upper,0.1)
  q <- seq(0.001,0.999,0.001)
  dexp02 <- data.frame(T=t, 
                        Density=dexp(t, rate=0.2),
                        Distribution=pexp(t, rate=0.2))  
  qexp02 <- data.frame(Q=q, Quantile=qexp(q, rate=0.2))  
  head(dexp02)
```

```r
plot(dexp02$T,dexp02$Density, type = "l", lwd = 2, axes = TRUE, xlab = "T", ylab = "P(t)")
```

>**Task:** Assume the lifetime of a metastable nuclear isomer ζ  is exponentially distributed with a mean lifetime of 20 minutes. What is the probabilty that a ζ  nucleus will decay within the next 15 minutes?

**Solution:**

```r
# A: The rate is 1/20 = 0.05.  Use pexp to get the probability of decay
#    in 15 or less minutes 
pexp(15, 0.05)
```

>**Task:** Assume that a light bulb has a mean lifetime of 1000 hours. What is the probability that the light bulb survives to 2000 hours?

**Solution:**

```r
# A: The rate is 1/1000 = 0.001.  Use pexp to get the probability of burnout within
#    2000 hours, and subtract from 1.
1 - pexp(2000, 0.001)
```

### Uniform distribution

The uniform distribution is a probability distribution where each value in the range from a to b has an equal chance of being selected. The pdf of uniform distribution is given by $$p(x)=\dfrac{1}{b-a}$$

The following formula can be used to determine the likelihood that a value between $x_1$ and $x_2$ will fall within the range from $a$ to $b$.
```
P(obtain value between x1 and x2)  =  (x2 – x1) / (b – a)
```

We’ll utilize R’s two built-in functions to provide answers using the uniform distribution.

They are:

In the formula `dunif(x, min, max)`, where `x` is the value of a random variable and `min` and `max` are the distribution’s minimum and maximum values, respectively, the probability density function (pdf) for the uniform distribution is calculated.

When `x` is the value of a random variable and `min` and `max` are the minimum and maximum values for the distribution, respectively, `punif(x, min, max)` generates the cumulative distribution function (cdf) for the uniform distribution.

Here you may access the complete R documentation for the uniform distribution.

>**Task 1:**: A bus arrives at a bus stop every 8 minutes. What is the chance that the bus will arrive in 5 minutes or less if you arrive at the bus stop?

**Solution:**

Since we want to know the cumulative probability that the bus will arrive in 5 minutes or less, given that the minimum time is 0 minutes and the maximum time is 8 minutes, we can easily use the punif() function to calculate the probability that the bus will arrive in 5 minutes or less.

```r
punif(5, min=0, max=8)
```

>**Task 2:** A particular species of frog weighs consistently between 15 and 25 grams. What is the likelihood that a frog you choose at random will weigh between 17 and 19 grams?

**Solution:**

The cumulative probability of a frog weighing less than 19 pounds will be calculated, and the cumulative likelihood of a frog weighing less than 17 pounds will be subtracted using the syntax shown below.

```r
punif(19, 15, 25) - punif(17, 15, 25)
```

>**Task 3:** An X game lasts between 120 and 170 minutes on average. How likely is it that a randomly chosen X game would go longer than 200 minutes?

**Solution:**

We may use the formula 1 – to find the answer to this (probability that the game lasts less than 200 minutes).

```r
1 - punif(200, 120, 170)
```
### χ2 Distribution
The χ2 (df) distribution is represented in R by `dchisq`, `pchisq`, and `qchisq`. In the formula, df is the number of degrees of freedom. The probability density `dchisq` and cumulative distribution `pchisq` are defined on the non-negative reals.

For the example, we’ll use df=10. To figure out a good range for plotting, we will use the qchisq function to find out for a given rate, what is the least number that bounds the cumulative χ2  distribution above 99.9%, and what is the greatest integer that bounds below at 0.1%.
