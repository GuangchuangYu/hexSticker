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

### base plot

``` r
library(hexSticker)
sticker(expression(plot(cars)), package="hexSticker", p_size=8, s_x=1, s_y=.85, s_width=.5, s_height=.4, filename="inst/figures/baseplot.png")
```

![](README_files/figure-markdown_github/unnamed-chunk-2-1.png)![](README_files/figure-markdown_github/unnamed-chunk-2-2.png)![](README_files/figure-markdown_github/unnamed-chunk-2-3.png)

<img src="inst/figures/baseplot.png" height=300"/>

### lattice

``` r
library(lattice)

counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
bwplot <- bwplot(counts ~ outcome | treatment, xlab=NULL, ylab=NULL, cex=.5, scales=list(cex=.5), par.strip.text=list(cex=.5))
sticker(bwplot, package="hexSticker", p_size=8, s_x=1.05, s_y=.75, s_width=1.1, s_height=.8, filename="inst/figures/lattice.png")
```

<img src="inst/figures/lattice.png" height=300"/>

### ggplot2

``` r
library(ggplot2)

p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
p <- p + theme_void() + theme_transparent()

sticker(p, package="hexSticker", p_size=8, s_x=1, s_y=.75, s_width=.8, s_height=.45, filename="inst/figures/ggplot2.png")
```

<img src="inst/figures/ggplot2.png" height=300"/>

### ggtree

``` r
library(ggbio)
library(biovizBase)
library(Homo.sapiens)

library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

data(genesymbol, package = "biovizBase")
wh <- genesymbol[c("BRCA1", "NBR1")]
wh <- range(wh, ignore.strand = TRUE)

gr.txdb <- crunch(txdb, which = wh)
## change column to  model
colnames(values(gr.txdb))[4] <- "model"
grl <- split(gr.txdb, gr.txdb$tx_id)
## fake some randome names
set.seed(2016-10-25)
names(grl) <- sample(LETTERS, size = length(grl), replace = TRUE)


## the random tree

library(ggtree)
n <- names(grl) %>% unique %>% length
set.seed(2016-10-25)
tr <- rtree(n)
set.seed(2016-10-25)
tr$tip.label = sample(unique(names(grl)), n)

p <- ggtree(tr, color='grey') + geom_tiplab(align=T, linesize=.05, linetype='dashed', size=1.2, color='grey')

##  align the alignment with tree
p2 <- facet_plot(p, 'Alignment', grl, geom_alignment, inherit.aes=FALSE, alpha=.6, size=.1, mapping=aes(), color='grey', extend.size=.1)
p2 <- p2 + theme_transparent() + theme(strip.text = element_blank())+xlim_tree(3.4)


#################################
library(hexSticker)
sticker(p2, package="ggtree", p_x=1, p_y=1.5, p_size=9, s_x=.85, s_y = .68, s_width=.95, s_height=.65)
```

> the produced file has dimension exactly for printing according to <http://hexb.in/sticker.html>

<img src="inst/figures/ggtree.png" height=300"/>
