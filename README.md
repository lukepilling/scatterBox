scatterBox
==========

R function to create semi-transparent boxplots overlaying scatter of raw data - for comparison of categorical and linear variables in R

#### Luke Pilling -- luke.pilling@gmail.com

#### Inputs/options
#### ==============
#### x.var   ::  {REQUIRED} the numeric y-axis variable
#### y.var   ::  {REQUIRED} the categorical x-axis variable +++must be numeric+++
#### x.lab   ::  {optional} label for x-axis
#### y.lab   ::  {optional} label for y-axis
#### y.lim   ::  {optional} vector of length 2, with the minimum and maximum y-axis values
#### main    ::  {optional} title of plot
#### labels  ::  {optional} a vector of labels for the categories of y.var {optional}
#### showN   ::  {default=TRUE} change to FALSE to not show # of samples in each category

#### Colours
#### =======
#### points.col    ::  {default="grey60"} colour of scatter points
#### bg.col        ::  {default="grey98"} colour of background of plot
#### box.col       ::  {default="grey70"} fill colour of boxes
#### box.alpha     ::  {default=0.75}     transparency of box fill (min=0, max=1)
#### border.col    ::  {default="grey20"} border colour of boxes
#### border.alpha  ::  {default=0.8}      transparency of box borders (min=0, max=1)
