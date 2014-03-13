scatterBox
==========

R function to create semi-transparent boxplots overlaying scattered raw data. 

Advantages - no additional packages required, options to change colours, include sample size for each category (optional).

##### Luke Pilling -- luke.pilling@gmail.com

## Inputs/options
* x.var   ::  {REQUIRED} the numeric y-axis variable
* y.var   ::  {REQUIRED} the categorical x-axis variable +++must be numeric+++
* x.lab   ::  {optional} label for x-axis
* y.lab   ::  {optional} label for y-axis
* y.lim   ::  {optional} vector of length 2, with the minimum and maximum y-axis values
* main    ::  {optional} title of plot
* labels  ::  {optional} a vector of labels for the categories of y.var {optional}
* showN   ::  {default=TRUE} change to FALSE to not show # of samples in each category


##### Colours;
* points.col    ::  {default="grey60"} colour of scatter points
* bg.col        ::  {default="grey98"} colour of background of plot
* box.col       ::  {default="grey70"} fill colour of boxes
* box.alpha     ::  {default=0.75}     transparency of box fill (min=0, max=1)
* border.col    ::  {default="grey20"} border colour of boxes
* border.alpha  ::  {default=0.8}      transparency of box borders (min=0, max=1)

## Example
![](http://s8.postimg.org/c7e98afk5/boxes.png)

```
weight <- vars$pq1_v20_qtiles
height <- vars$pq1_v21

scatterBox(weight, height, 
           x.lab="Quartiles of weight", y.lab="Height (cm)",
           main="Plot showing the relationship between height and weight",
           labels=c("1st", "2nd", "3rd", "4th"))
```
