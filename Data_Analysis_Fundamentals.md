# Introduction
Descriptive statistics consist of describing the data using some summary statistics and graphics. Here, we’ll describe how to compute summary statistics using R software.

## Import your data into R

Import your data into R as follow:

```
# If .txt tab file, use this
my_data <- read.delim(file.choose())
# Or, if .csv file, use this
my_data <- read.csv(file.choose())
```
> Here, we’ll use the built-in R data set named iris.

```
# Store the data in the variable my_data
my_data <- iris
```
### Check your data

You can inspect your data using the functions head() and tails(), which will display the first and the last part of the data, respectively.

```
# Print the first 6 rows
head(my_data, 6)
```

R functions for computing descriptive statistics

Some R functions for computing descriptive statistics:

|Description        |	R function    |
|-------------------|---------------|
|Mean               |	mean()        |
|Standard deviation | sd()          |
|Variance           |	var()         |
|Minimum	           | min()         |
|Maximum            |	maximum()     |
|Median             |	median()      |
|Range              |	range()       |
|Sample quantiles   |	quantile()    |
|Generic function   |	summary()     |
|Interquartile range|	IQR()         |

The function `mfv()`, for most frequent value, [in `modeest` package] can be used to find the statistical mode of a numeric vector.

## Descriptive statistics for a single group
### Measure of central tendency: mean, median, mode

Roughly speaking, the central tendency measures the “average” or the “middle” of your data. The most commonly used measures include:

* the `mean`: the average value. It’s sensitive to outliers.
* the `median`: the middle value. It’s a robust alternative to mean.
* and the `mode`: the most frequent value

In R,

>The function `mean()` and `median()` can be used to compute the mean and the median, respectively;
> The function `mfv()` [in the modeest R package] can be used to compute the mode of a variable.

The R code below computes the mean, median and the mode of the variable Sepal.Length [in my_data data set]:

```
# Compute the mean value
mean(my_data$Sepal.Length)
```
[1] 5.843333
```
# Compute the median value
median(my_data$Sepal.Length)
```
[1] 5.8
```
# Compute the mode
# install.packages("modeest")
require(modeest)
mfv(my_data$Sepal.Length)
```
[1] 5

## Measure of variability

Measures of variability gives how “spread out” the data are.

>**Range:** Range corresponds to biggest value minus the smallest value. It gives you the full spread of the data.

```
# Compute the minimum value
min(my_data$Sepal.Length)
```
[1] 4.3
```
# Compute the maximum value
max(my_data$Sepal.Length)
```
[1] 7.9
```
# Range
range(my_data$Sepal.Length)
```

### Interquartile range

Recall that, quartiles divide the data into 4 parts. Note that, the interquartile range (IQR) - corresponding to the difference between the first and third quartiles - is sometimes used as a robust alternative to the standard deviation.

R function:
`quantile(x, probs = seq(0, 1, 0.25))`


* x: numeric vector whose sample quantiles are wanted.
* probs: numeric vector of probabilities with values in [0,1].

>Example:

```
quantile(my_data$Sepal.Length)
```
By default, the function returns the minimum, the maximum and three quartiles (the 0.25, 0.50 and 0.75 quartiles).

To compute deciles (0.1, 0.2, 0.3, …., 0.9), use this:

```
quantile(my_data$Sepal.Length, seq(0, 1, 0.1))
```

To compute the interquartile range, type this:

```
IQR(my_data$Sepal.Length)
```

[1] 1.3

### Variance and standard deviation

The variance represents the average squared deviation from the mean. The standard deviation is the square root of the variance. It measures the average deviation of the values, in the data, from the mean value.

```
# Compute the variance
var(my_data$Sepal.Length)
```
```
# Compute the standard deviation =
# square root of th variance
sd(my_data$Sepal.Length)
```
### Median absolute deviation

The median absolute deviation (MAD) measures the deviation of the values, in the data, from the median value.
```
# Compute the median
median(my_data$Sepal.Length)
```
```
# Compute the median absolute deviation
mad(my_data$Sepal.Length)
```
### Which measure to use?
>`Range`. It’s not often used because it’s very sensitive to outliers.
>`Interquartile range`. It’s pretty robust to outliers. It’s used a lot in combination with the median.
>`Variance`. It’s completely uninterpretable because it doesn’t use the same units as the data. It’s almost never used except as a mathematical tool
>`Standard deviation`. This is the square root of the variance. It’s expressed in the same units as the data. The standard deviation is often used in the situation where the mean is the measure of central tendency.
>`Median absolute deviation`. It’s a robust way to estimate the standard deviation, for data with outliers. It’s not used very often.

In summary, the IQR and the standard deviation are the two most common measures used to report the variability of the data.

### Computing an overall summary of a variable and an entire data frame

>**`summary()` function**

The function `summary()` can be used to display several statistic summaries of either one variable or an entire data frame.

>Summary of a single variable. Five values are returned: the mean, median, 25th and 75th quartiles, min and max in one single line call:
```
summary(my_data$Sepal.Length)
```
>Summary of a data frame. In this case, the function `summary()` is automatically applied to each column. The format of the result depends on the type of the data contained in the column. For example:
* If the column is a numeric variable, mean, median, min, max and quartiles are returned.
* If the column is a factor variable, the number of observations in each group is returned.
```
summary(my_data, digits = 1)
```            
>**`sapply()` function**

It’s also possible to use the function `sapply()` to apply a particular function over a list or vector. For instance, we can use it, to compute for each column in a data frame, the mean, sd, var, min, quantile, …

```
# Compute the mean of each column
sapply(my_data[, -5], mean)
```
```
# Compute quartiles
sapply(my_data[, -5], quantile)
```
>**`stat.desc()` function**

The function `stat.desc()` [in `pastecs` package], provides other useful statistics including:

- the median
- the mean
- the standard error on the mean (SE.mean)
- the confidence interval of the mean (CI.mean) at the p level (default is 0.95)
- the variance (var)
- the standard deviation (std.dev)
- and the variation coefficient (coef.var) defined as the standard deviation divided by the mean
```
install.packages("pastecs")
```
Use the function `stat.desc()` to compute descriptive statistics
```
# Compute descriptive statistics
library(pastecs)
res <- stat.desc(my_data[, -5])
round(res, 2)
```             
### Case of missing values

Note that, when the data contains missing values, some R functions will return errors or `NA` even if just a single value is missing.

For example, the `mean()` function will return ``NA if even only one value is missing in a vector. This can be avoided using the argument na.rm = TRUE, which tells to the function to remove any NAs before calculations. An example using the meanfunction is as follow:
```
mean(my_data$Sepal.Length, na.rm = TRUE)
```
## Graphical display of distributions

The R package `ggpubr` will be used to create graphs.

>Installation and loading `ggpubr`. Install the latest version from GitHub as follow:
```
# Install
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")
```
Load `ggpubr` as follow:
```
library(ggpubr)
#Box plots
ggboxplot(my_data, y = "Sepal.Length", width = 0.5)
```

>**Histogram**
Histograms show the number of observations that fall within specified divisions (i.e., bins).
Histogram plot of Sepal.Length with mean line (dashed line).

```
gghistogram(my_data, x = "Sepal.Length", bins = 9, 
             add = "mean")
```
> **Empirical cumulative distribution function (ECDF):**
ECDF is the fraction of data smaller than or equal to x.
```
ggecdf(my_data, x = "Sepal.Length")
```
>**Q-Q plots**

```
ggqqplot(my_data, x = "Sepal.Length")
```

### Descriptive statistics by groups

To compute summary statistics by groups, the functions `group_by()` and `summarise()` [in `dplyr` package] can be used.

>**We want to group the data by Species and then:**
- compute the number of element in each group. R function: `n()`
- compute the mean. R function `mean()`
- and the standard deviation. R function `sd()`

The function `%>%` is used to chaine operations.

Install ddplyr as follow:
```
install.packages("dplyr")
```
Descriptive statistics by groups:
```
library(dplyr)
group_by(my_data, Species) %>% 
summarise(
  count = n(), 
  mean = mean(Sepal.Length, na.rm = TRUE),
  sd = sd(Sepal.Length, na.rm = TRUE)
  )
```

### Graphics for grouped data:

```
library("ggpubr")
# Box plot colored by groups: Species
ggboxplot(my_data, x = "Species", y = "Sepal.Length",
          color = "Species",
          palette = c("#00AFBB", "#E7B800", "#FC4E07"))
```
```
# Stripchart colored by groups: Species
ggstripchart(my_data, x = "Species", y = "Sepal.Length",
          color = "Species",
          palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          add = "mean_sd")
```
>Note that, when the number of observations per groups is small, it’s recommended to use strip chart compared to box plots.

### Frequency tables

A frequency table (or contingency table) is used to describe categorical variables. It contains the counts at each combination of factor levels.

>R function to generate tables: `table()`

