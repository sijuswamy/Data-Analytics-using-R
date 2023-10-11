# Data-Analytics-using-R
Course Repository for add-on programme at VJCET, Kannur
----


### Introduction
R is a programming language created and developed in 1991 by two statisticians at the University of Auckland, in New Zealand. It officially became free and open-source only in 1995. For its origins, it provides statistical and graphical techniques, linear and non-linear models, techniques for time series, and many other functionalities. Even if Python is the most common in the Data Science field, R is still widely used for specialized purposes, like in financial companies, research, and healthcare.

### Requirements to Learn R Programming
If you want to start programming in R, you need to install the last versions of `R` and `R studio` or use the cloud version - `poitcloud`. You are surely asking yourself why you need to install both. If you prefer, you can install only R and you will have a basic tool to write the code. In addition, R studio provides an intuitive and efficient graphical interface to write code in R. It allows to divide the interface into subwindows to visualize separately the code, the output of the variables, the plots, the environment, and many other features.

Link to register with posit cloud- <https://login.posit.cloud/register?redirect=%2F>


### Basics of R programming

> Assignment operation
> 
When we program in R, the entities we work with are called objects. They can be `numbers, strings, vectors, matrices, arrays, or functions`. So, any generic data structure is an object. The assignment operator is `<-` (or `=`), which combines the characters `<` and `-`. We can visualize the output of the object by calling it:

```
x <- 23
x
#[1] 23
```

>**Task 1:** Create two variables `a,b` , assign values to them and find sum, difference, product and quotient using R code.

>**Vectors in R Programming**

In R, the vectors constitute the simplest data structure. The elements within the vector are all of the same types. To create a vector, we only need the function `c()` :

```
v1 <- c(2,4,6,8,9)
v1
# [1] 2 4 6 8 9
```

This function simply concatenates different entities into a vector. There are other ways to create a vector, depending on the purpose. For example, we can be interested in creating a list of consecutive numbers and we don’t want to specify them manually. In this case, the syntax is`a:b` , where a and b correspond to the lower and upper extremes of this succession. The same result can be obtained using the function `seq()`.

```
v2 <- 1:7
v2
#[1] 1 2 3 4 5 6 7
v3 <- seq(from=1,to=7)
v3
#[1] 1 2 3 4 5 6 7
```

The function `seq()` can also be applied to create more complex sequences. For example, we can add the argument by the step size and the length of the sequence:

```
v4 <- seq(0,1,by=0.1)
v4
#[1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
v5 <- seq(0,2,len=11)
v5
#[1] 0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0
```
To repeat the same number more times into a vector, the function `rep()` can be used:

```
v6 <- rep(2,3)
v6
v7 <-c(1,rep(2,3),3)
v7
#[1] 2 2 2
#[1] 1 2 2 2 3

```
There are not only numerical vectors. There are also logical vectors and character vectors:

```
x <- 1:10
y <- 1:5 
l <- x=y 
l
c <- c('a','b','c')
c
```

>**Factors in R Programming**

Factors are specialized vectors used to group elements into categories. There are two types of factors: `ordered` and `unordered`. For example, we have the countries of five friends. We can create a factor using the function `factor()`

```
states <- c('italy','france','germany','germany','germany')
statesf<-factor(states)
statesf
```

To check the levels of the factor, the function `levels()` can be applied.

```
levels(statesf)
```

>**Matrices in R Programming**
>
As you probably know, the matrix is a 2-dimensional array of numbers. It can be built using the function `matrix()`

`Synatx: var=matrix(data,nrow=m,ncol=m,byrow=TRUE)`

```
m1 <- matrix(1:6,nrow=3)
m1
```

```
m2 <- matrix(1:6,ncol=3)
m2
```

It can also be interesting combine different vectors into a matrix row-wise or column-wise. This is possible with rbind() and cbind() :

```
countries <- c('italy','france','germany')
age <- 25:27
rbind(countries,age)
```

or
```
countries <- c('italy','france','germany')
age <- 25:27
cbind(countries,age)
```

>**Arrays in R Programming**

Arrays are objects that can have one, two, or more dimensions. When the array is one-dimensional, it coincides with the vector. In the case it’s 2D, it’s like to use the matrix function. In other words, arrays are useful to build a data structure with more than 2 dimensions.

```
a <- array(1:16,dim=c(6,3,2))
a
```

>**lists**

The list is a `ordered collection` of objects. For example, it can a collection of vectors, matrices. Differently from vectors, the lists can contain values of different type. They can be build using the function `list()` :
```
x <- 1:3
y <- c('a','b','c')
l <- list(x,y)
l
```

>**Data frames in R Programming**

A data frame is very similar to a matrix. It’s composed of rows and columns, where the columns are considered vectors. The most relevant difference is that it’s easier to filter and select elements. We can build manually the dataframe using the function `data.frame()` :

```
countries <- c('italy','france','germany')
age <- 25:27
df <- data.frame(countries,age)
df
```

>**Reading data from en external file or data source**

An alternative is to read the content of a file and assign it to a data frame with the function `read.table()` :
```
df <- read.table('titanic.dat')
```
Like in `Pandas`, there are other functions to read files with different formats. For example, let’s read a csv file:

```
df <- read.csv('titanic.csv')

```

>**Built-in datsets in R**
>
R provides pre-loaded data using the function `data()`. A simple example is shown bellow:

```
data(mtcars)
head(mtcars)
```
The function `head()` allows visualizing the first 6 rows of the mtcars dataset, which provides the data regarding fuel consumption and ten characteristics of 32 automobiles.

All information about the `mtcars` datset can be extracted using the `help(mtcars)` function.

```
help(mtcars)
```

* the function `dim()` to look at the dimensions of the data frame
* the function `names()` to see the names of the variables

```
dim(mtcars)
```

```
names(mtcars)
```

>**Five point summary of a features/ numerical columns of a dataframe**

The summary statistics of the variables can be obtained through the function `summary()`

```
summary(mtcars)
```

We can access specific columns using the expression `dataframe$namevariable`. If we want to avoid specifying every time the name of the dataset, we need the function `attach()`.

For example:

```
mtcars$mpg
```

```
attach(mtcars)
mpg
```

In this way, we attach the data frame to the search path, allowing to refer to the columns with only their names. Once we attached the data frame and we aren’t interested anymore to use it, we can do the inverse operation using the function `detach()`.

>**Accessing values in a dataframe**
We can  select the first row in the data frame using this syntax:

```
mtcars[1,]
```
First column of `mtcars`:

```
mtcars[,1]
```

>**Basic filtering operation**
We can filter the rows using a logical expression:

```
mtcars[mpg>20,]
```

Showing a particular column satisfying a row condition as:

```
mtcars[mpg>20,'mpg']
```
### Conditionals in R programming

`If` statement in R Programming

The syntax of the `if` statement is similar to the one in `Python`. As before, the difference is the addition of the parenthesis and curly brackets.

Syntax- if:
```
if (cond1) {statement1} else {statement2}
```

Syntax if-else

```
if (cond1) {statement1} else if {statement2} else {statement3}
```

**Example**

```
# code to check whether a number is even or not
x= as.integer(readline(prompt="Enter the number:"))
if (i%%2==0) print('even') else print('odd')
```

**Task-1:** Assign two values to `a` and `b`. Find the largest.

```
a <- 10
b <- 2
if (b > a){
  print('b is greater than a')
}else if (a == b){
  print('a and b are equal')
}else {
  print('a is greater than b')
  }
```
There is also a vectorized version of the if statement, the function `ifelse(condition,a,b)` . It’s the equivalent of writing:

```
ifelse(a>b,'a is greater than b','b is greater than a')

```

### Iteratives in R programming

The `for` loop is used to iterate elements over the sequence like in `Pandas`. The difference is the addition of the parenthesis and curly brackets. It has slightly different syntax:



>syntax: `for (var in seq) statement`

**Example:**

```
for (i in 1:4) 
{print(i)}
```

>`while` loop

`while` executes a statement or more statements as long as the condition is `TRUE`

>Syntax `while (cond) statement`

**Example:**

```
i<-1
while (i<6)
{print(i)
  i<-i+1}
```

>**Task:** Display whether the number in the range $(1,4)$ is odd or even.

```
for (i in 1:4)
{if (i%%2==0) print('even') else print('odd')
}
```
## Functions in `R`

The function is a block of code used to perform an action. It runs only when the function is called. It usually needs parameters, that need to be passed, and returns an output as result. It’s defined with this syntax in R:

```
function_name <- function(par_1,par_2,…)
{
body of function
}
```

>**Example:**

Write an R function to find square of an input variable:

```
square=function(a)
{
a*a
}
m=1
## calling the function
square(m)
```

>**Task 1:** Create a function to calculate the average of a vector:

```
average <- function(x)
{ val = 0
  for (i in x){val=val+i}
  av = val/length(x)
  av
    }
average(1:3)
```
## Day-1: Introduction to Descriptive Statistics

<https://github.com/sijuswamy/Data-Analytics-using-R/blob/main/Day-1%20Presentation.Rmd>

---

