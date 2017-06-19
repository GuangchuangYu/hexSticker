<!-- README.md is generated from README.Rmd. Please edit that file -->
hexSticker: create hexagon sticker in R
=======================================

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/hexSticker?color=green)](https://cran.r-project.org/package=hexSticker) ![](http://cranlogs.r-pkg.org/badges/grand-total/hexSticker?color=green) ![](http://cranlogs.r-pkg.org/badges/hexSticker?color=green) ![](http://cranlogs.r-pkg.org/badges/last-week/hexSticker?color=green)

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
sticker(expression(plot(cars, cex=.5, cex.axis=.5, mgp=c(0,.3,0), xlab="", ylab="")),
        package="hexSticker", p_size=8, s_x=1, s_y=.8, s_width=1.2, s_height=1,
        filename="inst/figures/baseplot.png")
```

<img src="inst/figures/baseplot.png" height="300"/>

### lattice

``` r
library(lattice)

counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
bwplot <- bwplot(counts ~ outcome | treatment, xlab=NULL, ylab=NULL, cex=.5,
                 scales=list(cex=.5), par.strip.text=list(cex=.5))
sticker(bwplot, package="hexSticker", p_size=8, s_x=1.05, s_y=.75, s_width=2, s_height=1.5,
        h_fill="#f9690e", h_color="#f39c12", filename="inst/figures/lattice.png")
```

<img src="inst/figures/lattice.png" height="300"/>

### ggplot2

``` r
library(ggplot2)

p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
p <- p + theme_void() + theme_transparent()

sticker(p, package="hexSticker", p_size=8, s_x=1, s_y=.75, s_width=1.3, s_height=1,
        filename="inst/figures/ggplot2.png")
```

<img src="inst/figures/ggplot2.png" height="300"/>

### image file

``` r
imgurl <- "http://www.belleamibengals.com/bengal_cat_2.png"
sticker(imgurl, package="hexSticker", p_size=8, s_x=1, s_y=.75, s_width=.6,
        filename="inst/figures/imgfile.png")
```

<img src="inst/figures/imgfile.png" height="300"/>

------------------------------------------------------------------------

Stickers produced by `hexSticker`
---------------------------------

> If you use `hexSticker` and want your sticker to be listed here, please feel free to edit [README.Rmd](https://github.com/GuangchuangYu/hexSticker/edit/master/README.Rmd).

### Stickers for software packages

<!--
[<img src="" height="120"/>]()
-->
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/AnnotationFilter/AnnotationFilter_hl.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/AnnotationFilter) [<img src="https://github.com/Bioconductor/BiocStickers/raw/master/BiocFileCache/BiocFileCache.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/BiocFileCache) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/cleaver/cleaver.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/cleaver) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/FamAgg/FamAgg_hl.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/FamAgg) [<img src="https://raw.githubusercontent.com/strengejacke/ggeffects/master/man/figures/logo.png" height="120"/>](https://github.com/strengejacke/ggeffects) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/ggtree/ggtree.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/ggtree) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/MSnbase/MSnbase.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/MSnbase) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/mzR/mzR_hl.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/mzR) [<img src="https://raw.githubusercontent.com/ox-it/oidnChaRts/master/data-raw/oidnChaRt-sticker.png" height="120"/>](https://github.com/ox-it/oidnChaRts/tree/master/data-raw) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/pRoloc/pRoloc.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/pRoloc) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/pRoloc/pRolocdata.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/pRoloc) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/pRoloc/pRolocGUI.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/pRoloc) [<img src="https://raw.githubusercontent.com/strengejacke/sjmisc/master/man/figures/logo.png" height="120"/>](https://github.com/strengejacke/sjmisc) [<img src="https://raw.githubusercontent.com/strengejacke/sjPlot/master/man/figures/logo.png" height="120"/>](https://github.com/strengejacke/sjPlot) [<img src="https://raw.githubusercontent.com/strengejacke/sjstats/master/man/figures/logo.png" height="120"/>](https://github.com/strengejacke/sjstats) [<img src="https://github.com/Tazinho/snakecase/raw/master/man/figures/snakecase05.png" height="120" />](https://github.com/Tazinho/snakecase) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/treeio/treeio.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/treeio) [<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/xcms/xcms_hl.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/xcms) [<img src="https://raw.githubusercontent.com/drisso/zinb_analysis/master/sticker/zinbwave.png" height="120"/>](https://github.com/drisso/zinb_analysis/tree/master/sticker)

### Stickers for events/workshops

[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/events/CSAMA/2017/CSAMA2017.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/events/CSAMA/2017)

### Stickers for fun

[<img src="https://www.karada-good.net/wp/wp-content/uploads/2017/04/kemono-320x371.png" height="120"/>](https://www.karada-good.net/analyticsr/r-584)

Print/order stickers
--------------------

Sticker designers can make their stickers available via [Sticker Mule](https://www.stickermule.com).
