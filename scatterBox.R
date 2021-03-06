############################################################################################################
#### Function to create semi-transparent boxplots with scattered raw data behind and sample size information
#### Luke Pilling

#### Inputs/options
#### ==============
#### x.var      ::  {REQUIRED} the categorical x-axis variable +++must be numeric+++
#### y.var      ::  {REQUIRED} the numeric y-axis variable
#### x.lab      ::  {optional} label for x-axis
#### y.lab      ::  {optional} label for y-axis
#### y.lim      ::  {optional} vector of length 2, with the minimum and maximum y-axis values
#### main       ::  {optional} title of plot
#### labels     ::  {optional} a vector of labels for the categories of y.var {optional}
#### showN      ::  {default=TRUE} change to FALSE to not show # of samples in each category
#### doScatter  ::  {default=TRUE} whether or not to show the scatter points
#### doBox      ::  {default=TRUE} whether or not to show the box plots  --  can just show scatter categories if set to FALSE

#### Colours
#### =======
#### points.col    ::  {default="grey35"} colour of scatter points
#### points.alpha  ::  {default="0.8"} transparency of scatter points
#### bg.col        ::  {default="grey96"} colour of background of plot
#### box.col       ::  {default="grey70"} fill colour of boxes
#### border.col    ::  {default="grey20"} border colour of boxes


scatterBox  <- function(x.var=stop("\n\n## Need to specify a valid vector of numeric categories for the X-axis using [x.var=...]\n\n"), 
                        y.var=stop("\n\n## Need to specify a valid vector of numeric values for the Y-axis using [y.var=...]\n\n"), 
                        y.lim=NA, 
                        x.lab="",   y.lab="", main="", subtitle="", labels=NA, showN=TRUE,
                        points.col="grey35", points.alpha=0.8,
                        bg.col="grey96",
                        box.col="grey70", border.col="grey20",
                        doScatter=T, doBox=T
                       )  
{
    
    ## check X/Y variables appropriate -- return error if not
    if (!is.numeric(x.var))  stop("\n\n## Vector of values for X-axis needs to be numeric - this means they appear in the order you want!\n\n")
    if (!is.numeric(y.var))  stop("\n\n## Vector of values for Y-axis needs to be numeric\n\n")
    
    ## remove missings
    df <- na.omit(data.frame(x.var, y.var))
    x.var <- df[,1]
    y.var <- df[,2]
    
    ## determine axis ranges
    ylim     <- range(y.var, na.rm=T)
    span     <- ylim[2] - ylim[1]
    span.3p  <- span / 100 * 3
    span.10p <- span / 100 * 10
    ylim[1]  <- ylim[1] - span.10p          ## lower Y limit is -10% to allow N individuals to be included
    if (!is.na(y.lim[1]))  ylim <- y.lim    ## override Y-axis limits if provided by user
       
    xlim    <- c(0.5, length(table(x.var))+0.5)
    
    ## categories should be numeric - lowest # needs to be "1" for plotting the points
    xMin  <- min(x.var)
    xDiff <- 1 - xMin
    
    ## create empty plot of correct dimensions, with labels
    plot(   1,
            type="n",  
            xlim = xlim, 
            ylim = ylim, 
            xaxt = "n", 
            cex.main=1.3,
            cex.lab=1.2,
            main=main,
            ylab=y.lab,
            xlab=x.lab
        )
    rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col=bg.col)
    
    ## add boxes (semi-transparent)
    if (doBox)
    {
    boxplot(y.var ~ x.var, 
            xaxt = "n", 
            add = TRUE, 
            col=box.col,
            border=border.col,
            pch=16,
            outline=FALSE
           )
    }

    ## add raw data (with jitter on Xaxis)
    x.var.points <- jitter( x.var + xDiff )
    if (doScatter)  points(x.var.points, y.var, pch=16, col=adjustcolor(points.col, alpha.f=points.alpha))
    
    ## add category labels
    if (is.na(labels[1]))  labels <- as.vector(names(table(x.var)))
    axis(1, 
         at=c(1:(xlim[2]-0.5)), 
         labels=labels, 
         tick = TRUE, 
         cex=1.1)
    
    ## add sample size info for each group
    if (showN)  {
      text( x=0.7, y=ylim[1]+span.3p, "N=", cex=1.1)
      for (i in c(1:(xlim[2]-0.5)))  {
        text( x=i, y=ylim[1]+span.3p, table(x.var)[[i]], cex=1.1)
      }
    }

    # add subtitle
    mtext(subtitle, line=0.3, cex=0.8)

    
}  ## end of scatterBox function
