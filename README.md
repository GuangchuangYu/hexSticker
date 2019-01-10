<!-- README.md is generated from README.Rmd. Please edit that file -->

# hexSticker: create hexagon sticker in R

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/hexSticker?color=green)](https://cran.r-project.org/package=hexSticker)
![](http://cranlogs.r-pkg.org/badges/grand-total/hexSticker?color=green)
![](http://cranlogs.r-pkg.org/badges/hexSticker?color=green)
![](http://cranlogs.r-pkg.org/badges/last-week/hexSticker?color=green)

## Author

Guangchuang YU <https://guangchuangyu.github.io>

School of Basic Medical Sciences, Southern Medical
University

[![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://saythanks.io/to/GuangchuangYu)
[![](https://img.shields.io/badge/follow%20me%20on-微信-green.svg)](https://guangchuangyu.github.io/blog_images/biobabble.jpg)
[![](https://img.shields.io/badge/打赏-支付宝/微信-green.svg)](https://guangchuangyu.github.io/blog_images/pay_qrcode.png)

-----

## Installation

Install the hexSticker package via CRAN:

``` r
install.packages("hexSticker")
```

You can also install the package via the Github repository.

``` r
# install.package("devtools")   #In case you have not installed it.
devtools::install_github("GuangchuangYu/hexSticker")
```

## Fail to install

### imageMagick

`imageMagick` is required for installing `hexSticker`. If you have not
installed it, please try the following
[approaches](https://www.imagemagick.org/script/download.php).

### Fail to load ‘sysfonts’

In Mac OS, you may need to re-install `sysfornt` to properly load it.

Be sure to install `xqartz` first.

``` r
brew update && brew install homebrew/cask/xquartz
```

-----

## Examples

> `sticker` function will produce a file with dimension exactly for
> printing according to <http://hexb.in/sticker.html>

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

-----

## Stickers produced by `hexSticker`

> If you use `hexSticker` and want your sticker to be listed here,
> please feel free to edit
> [README.Rmd](https://github.com/GuangchuangYu/hexSticker/edit/master/README.Rmd).

### Stickers for software packages

<!--
[<img src="" height="120"/>]()
-->

[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/AnnotationFilter/AnnotationFilter_hl.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/AnnotationFilter)
[<img src="https://github.com/lpantano/bcbioSmallRna/raw/master/inst/sticker/bcbioSmallRna.png" height="120"/>](https://github.com/lpantano/bcbioSmallRna)
[<img src="https://raw.githubusercontent.com/bcgov/bcmaps/master/inst/sticker/bcmaps.png" height="120"/>](https://github.com/bcgov/bcmaps)
[<img src="https://github.com/Bioconductor/BiocStickers/raw/master/BiocFileCache/BiocFileCache.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/BiocFileCache)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/ChIPseeker/ChIPseeker.png" height="120"/>](https://guangchuangyu.github.io/ChIPseeker)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/cleaver/cleaver.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/cleaver)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/clusterProfiler/clusterProfiler.png" height="120"/>](https://guangchuangyu.github.io/clusterProfiler)
[<img src="https://github.com/RhoInc/CRANsearcher/raw/master/inst/image/hex/CRANsearcher_hexSticker.png" height="120"/>](https://github.com/RhoInc/CRANsearcher)
[<img src="https://github.com/lpantano/DEGreport/raw/master/inst/sticker/degreport.png" height="120"/>](https://github.com/lpantano/DEGreport)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/FamAgg/FamAgg_hl.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/FamAgg)
[<img src="https://raw.githubusercontent.com/seabbs/getTBinR/master/man/figure/logo.png" height="120"/>](https://www.samabbott.co.uk/getTBinR/)
[<img src="https://raw.githubusercontent.com/strengejacke/ggeffects/master/man/figures/logo.png" height="120"/>](https://github.com/strengejacke/ggeffects)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/ggtree/ggtree.png" height="120"/>](https://guangchuangyu.github.io/ggtree)
[<img src="https://github.com/muschellij2/glassdoor/raw/master/sticker.png" height="120"/>](https://github.com/muschellij2/glassdoor)
[<img src="https://github.com/greta-dev/greta/blob/master/logos/greta_hex.png" height="120"/>](https://github.com/greta-dev/greta/tree/master/logos)
[<img src="https://raw.githubusercontent.com/SteffenMoritz/imputeR/master/man/figures/imputeR-logo.png" height="120"/>](https://github.com/SteffenMoritz/imputeR)
[<img src="https://github.com/lpantano/isomiRs/raw/master/inst/stickers/isomirs.png" height="120"/>](https://github.com/lpantano/isomiRs)
[<img src="https://github.com/wjakethompson/jayhawkdown/raw/master/hex_logo/jayhawkdown.png" height="120"/>](https://github.com/wjakethompson/jayhawkdown)
[<img src="https://github.com/graemeleehickey/joineR/raw/master/man/figures/hex.png" height="120"/>](https://github.com/graemeleehickey/joineR)
[<img src="https://github.com/graemeleehickey/joineRML/raw/master/man/figures/hex.png" height="120"/>](https://github.com/graemeleehickey/joineRML)
[<img src="https://raw.githubusercontent.com/juliasilge/janeaustenr/master/tools/janeaustenr.png" height="120"/>](https://github.com/juliasilge/janeaustenr/tree/master/tools)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/MSnbase/MSnbase.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/MSnbase)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/mzR/mzR_hl.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/mzR)
[<img src="https://raw.githubusercontent.com/lbenz730/ncaahoopR/master/figures/logo.png" height="120"/>](https://github.com/lbenz730/ncaahoopR)
[<img src="https://shanmdphd.github.io/hex/ncarbe.png" height="120"/>](https://github.com/asancpt/ncarbe)
[<img src="https://shanmdphd.github.io/hex/NonCompart.png" height="120"/>](https://github.com/asancpt/NonCompart)
[<img src="https://github.com/emsweene/oasis/raw/master/sticker.png" height="120"/>](https://github.com/emsweene/oasis)
[<img src="https://raw.githubusercontent.com/EnriquePH/OEIS.R/master/sticker/OEIS.R-sticker.png" height="120"/>](https://github.com/EnriquePH/OEIS.R)
[<img src="https://raw.githubusercontent.com/ox-it/oidnChaRts/master/data-raw/oidnChaRt-sticker.png" height="120"/>](https://github.com/ox-it/oidnChaRts/tree/master/data-raw)
[<img src="https://raw.githubusercontent.com/RGLab/openCyto/trunk/inst/figures/openCyto.png" height="120"/>](http://github.com/RGLab/openCyto)
[<img src="https://raw.githubusercontent.com/cbg-ethz/perturbatr/122cdd1516aa13d967677050dbf4fe08cfe66c7c/inst/figure/sticker.png" height="120"/>](https://github.com/cbg-ethz/perturbatr)
[<img src="https://raw.githubusercontent.com/dmi3kno/polite/master/data-raw/sticker.png" height="120"/>](https://github.com/dmi3kno/polite)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/pRoloc/pRoloc.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/pRoloc)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/pRoloc/pRolocdata.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/pRoloc)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/pRoloc/pRolocGUI.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/pRoloc)
[<img src="https://github.com/Yue-Jiang/pzfx/blob/master/man/figures/logo.png" height="120"/>](https://github.com/Yue-Jiang/pzfx)
[<img src="https://raw.githubusercontent.com/justinmillar/r-gators-hex/master/r-gators.png" height="120"/>](https://github.com/justinmillar/r-gators-hex)
[<img src="https://raw.githubusercontent.com/ellessenne/rsimsum/master/man/figures/hex.png" height="120"/>](https://github.com/ellessenne/rsimsum)
[<img src="https://github.com/thiyangt/seer/blob/master/logo/seer.png" height="120"/>](https://github.com/thiyangt/seer/blob/master/logo/seer.png)
[<img src="https://user-images.githubusercontent.com/9893806/34084712-02f8698a-e33a-11e7-86e7-ce60bf51fe86.png" height="120"/>](https://github.com/Bohdan-Khomtchouk/shinyheatmap)
[<img src="https://raw.githubusercontent.com/cwthom/shinyhelper/master/data-raw/shinyhelper.png" height="120"/>](https://github.com/cwthom/shinyhelper)
[<img src="https://raw.githubusercontent.com/strengejacke/sjmisc/master/man/figures/logo.png" height="120"/>](https://github.com/strengejacke/sjmisc)
[<img src="https://raw.githubusercontent.com/strengejacke/sjPlot/master/man/figures/logo.png" height="120"/>](https://github.com/strengejacke/sjPlot)
[<img src="https://raw.githubusercontent.com/strengejacke/sjstats/master/man/figures/logo.png" height="120"/>](https://github.com/strengejacke/sjstats)
[<img src="https://github.com/Tazinho/snakecase/raw/master/man/figures/snakecase05.png" height="120" />](https://github.com/Tazinho/snakecase)
[<img src="https://raw.githubusercontent.com/pdrhlik/southparkr/master/sticker/southparkr-sticker.png" height="120" />](https://github.com/pdrhlik/southparkr)
[<img src="https://github.com/rrrlw/TDAstats/blob/master/man/figures/HexTDA.png" height="120" />](https://github.com/rrrlw/TDAstats)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/treeio/treeio.png" height="120"/>](https://www.bioconductor.org/packages/treeio)
[<img src="https://raw.githubusercontent.com/wenlong-liu/usfertilizer_sticker/master/usfertilizer.png" height="120"/>](https://github.com/wenlong-liu/usfertilizer)
[<img src="https://raw.githubusercontent.com/sjmgarnier/viridis/master/hex_logo/viridis.png" height="120"/>](https://github.com/sjmgarnier/viridis)
[<img src="https://github.com/neuroconductor/WhiteStripe/raw/master/sticker.png" height="120"/>](https://github.com/neuroconductor/WhiteStripe)
[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/xcms/xcms_hl.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/xcms)
[<img src="https://raw.githubusercontent.com/drisso/zinb_analysis/master/sticker/zinbwave.png" height="120"/>](https://github.com/drisso/zinb_analysis/tree/master/sticker)

### Stickers for events/workshops

[<img src="https://raw.githubusercontent.com/Bioconductor/BiocStickers/master/events/CSAMA/2017/CSAMA2017.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/events/CSAMA/2017)
[<img src="https://github.com/Bioconductor/BiocStickers/blob/master/events/CSAMA/2018/CSAMA2018.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/events/CSAMA/2018)
[<img src="https://github.com/Bioconductor/BiocStickers/raw/master/events/EuroBioc2017/EuroBioc2017.png" height="120"/>](https://github.com/Bioconductor/BiocStickers/tree/master/events/EuroBioc2017)

### Stickers for fun

[<img src="https://www.karada-good.net/wp/wp-content/uploads/2017/04/kemono-320x371.png" height="120"/>](https://www.karada-good.net/analyticsr/r-584)

### Stickers for organizations

[<img src="https://shanmdphd.github.io/hex/cryptokor.png" height="120"/>](https://github.com/cryptokor)
[<img src="https://user-images.githubusercontent.com/9893806/36942615-8f9b0640-1f2b-11e8-85eb-6d2cabcfd62f.png" height="120"/>](https://github.com/shinycrypto)
[<img src="https://github.com/slc-rug/slcrug-hexsticker/raw/master/R/slcrug_hex.png" height="120"/>](https://github.com/slc-rug/slcrug-hexsticker)

## Print/order stickers

Sticker designers can make their stickers available via [Sticker
Mule](https://www.stickermule.com/uses/hexagon-stickers).

## Related Tools

  - [badger](https://github.com/GuangchuangYu/badger): Query information
    and generate badge for using in README and GitHub Pages.
