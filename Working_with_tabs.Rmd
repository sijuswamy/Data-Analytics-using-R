---
title: "Working with tabs (Simple Approach)"
author: "siju.swamy@saintgits.org"
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE,message = FALSE,warning = FALSE)
```

```{r, echo=FALSE}
library(ggplot2) # for plotting
library(plotly)  # for interactive plotting
library(dplyr)   # for filtering
#library("magrittr") # managing sematics
library("DT") # for interactive tables
```

## Comparing Diamond Prices by Carat Across Different Cut Qualities {.tabset}


### Data as a whole

```{r}
datatable(diamonds,class = "compact", 
          caption = "Example of an interactive data table. Each observation (row) is the information for one of the sample from the diamonds dataset",
          colnames = c("carat","cut" ,"color","clarity","depth","table","price","x","y","z" ),
          width = 800)
```


### Fair

```{r, echo=FALSE}
ggplot(diamonds %>% filter(cut == 'Fair'), aes(x = carat)) +

  geom_point(aes(y = price, col = color)) +

  labs(x = '\nCarat',

       y = 'Price (USD $)\n',

       col = 'Color') +

  theme_bw()

```

### Good

```{r}
ggplot(diamonds %>% filter(cut == 'Good'), aes(x = carat)) +

  geom_point(aes(y = price, col = color)) +

  labs(x = '\nCarat',

       y = 'Price (USD $)\n',

       col = 'Color') +

  theme_bw()
```

### Very Good

```{r}
ggplot(diamonds %>% filter(cut == 'Very Good'), aes(x = carat)) +

  geom_point(aes(y = price, col = color)) +

  labs(x = '\nCarat',

       y = 'Price (USD $)\n',

       col = 'Color') +

  theme_bw()
```

### Premium


```{r}
fig <- plot_ly(data = diamonds %>% filter(cut == 'Premium'), x = ~carat, y = ~price, color=~carat)
fig
```
```




