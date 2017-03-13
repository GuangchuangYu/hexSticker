<!-- README.md is generated from README.Rmd. Please edit that file -->
hexSticker: create hexagon sticker in R
=======================================

Author
------

Guangchuang YU <https://guangchuangyu.github.io>

School of Public Health, The University of Hong Kong

------------------------------------------------------------------------

Examples
--------

> `sticker` function will produce a file with dimension exactly for printing according to <http://hexb.in/sticker.html>

### base plot

``` r
library(hexSticker)
sticker(expression(plot(cars)), package="hexSticker", p_size=8, s_x=1, s_y=.85, s_width=.5, s_height=.4, filename="inst/figures/baseplot.png")
```

<img src="inst/figures/baseplot.png" height=300"/>

### lattice

``` r
library(lattice)

counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
bwplot <- bwplot(counts ~ outcome | treatment, xlab=NULL, ylab=NULL, cex=.5,
                 scales=list(cex=.5), par.strip.text=list(cex=.5))
sticker(bwplot, package="hexSticker", p_size=8, s_x=1.05, s_y=.75, s_width=1.1, s_height=.8,
        h_fill="#f9690e", h_color="#f39c12", filename="inst/figures/lattice.png")
```

<img src="inst/figures/lattice.png" height=300"/>

### ggplot2

``` r
library(ggplot2)

p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
p <- p + theme_void() + theme_transparent()

sticker(p, package="hexSticker", p_size=8, s_x=1, s_y=.75, s_width=.8, s_height=.45,
        filename="inst/figures/ggplot2.png")
```

<img src="inst/figures/ggplot2.png" height=300"/>

### local image file

``` r
imgurl <- "http://www.belleamibengals.com/bengal_cat_2.png"
imgfile <- tempfile(fileext=".png")
download.file(imgurl,imgfile,mode="wb")
sticker(imgfile, package="hexSticker", p_size=8, s_x=1, s_y=.75, s_width=.6, s_height=.4,
        filename="inst/figures/imgfile.png")
```

<img src="inst/figures/imgfile.png" height=300"/>

Stickers produced by `hexSticker`
---------------------------------

<img src="https://guangchuangyu.github.io/ggtree/ggtree.png" height="128", align="right" />
