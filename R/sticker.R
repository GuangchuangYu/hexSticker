##' create sticker in R
##'
##'
##' @title sticker
##' @param subplot subplot
##' @param s_x x position for subplot
##' @param s_y y position for subplot
##' @param s_width width for subplot
##' @param s_height height for subplot
##' @param package package name
##' @param p_x x position for package name
##' @param p_y y position for package name
##' @param p_color color for package name
##' @param p_family font family for package name
##' @param p_size font size for package name
##' @param h_size size for hexagon border
##' @param h_fill color to fill hexagon
##' @param h_color color for hexagon boder
##' @param spotlight whether add spotlight
##' @param l_x x position for spotlight
##' @param l_y y positioin for spotlight
##' @param l_width width for spotlight
##' @param l_height height for spotlight
##' @param l_alpha maximum alpha for spotlight
##' @param url url at lower border
##' @param u_x x position for url
##' @param u_y y position for url
##' @param u_color color for url
##' @param u_family font family for url
##' @param u_size text size for url
##' @param filename filename to save sticker
##' @return gg object
##' @importFrom ggplot2 ggplot
##' @importFrom ggplot2 aes_
##' @importFrom ggimage geom_subview
##' @importFrom ggimage geom_image
##' @export
##' @examples
##' library(ggplot2)
##' p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
##' p <- p + theme_void() + theme_transparent()
##' sticker(p, package="hexSticker")
##' @author guangchuang yu
sticker <- function(subplot, s_x=.8, s_y=.75, s_width=.4, s_height=.5,
                    package, p_x=1, p_y=1.4, p_color="#FFFFFF", p_family="Aller_Rg", p_size=8,
                    h_size=1.2, h_fill="#1881C2", h_color="#87B13F",
                    spotlight=FALSE, l_x=1, l_y=.5, l_width=3, l_height=3, l_alpha=0.4,
                    url = "",  u_x=1, u_y=0.08, u_color="black", u_family="Aller_Rg", u_size=1.5,
                    filename = paste0(package, ".png")) {

    hex <- hexagon(size=h_size, fill=h_fill, color=h_color)
    if (inherits(subplot, "character")) {
        d <- data.frame(x=s_x, y=s_y, image=subplot)
        sticker <- hex + geom_image(aes_(x=~x, y=~y, image=~image), d, size=s_width)
    } else {
        sticker <- hex + geom_subview(subplot, x=s_x, y=s_y, width=s_width, height=s_height)
    }

    if(spotlight)
        sticker <- sticker + geom_subview(spotlight(l_alpha), x=l_x, y=l_y, width=l_width, height=l_height)

    sticker <- sticker + geom_pkgname(package, p_x, p_y, p_color, p_family, p_size)

    sticker <- sticker + geom_url(url, x=u_x, y = u_y, color = u_color, family = u_family, size=u_size)

    save_sticker(filename, sticker)
    invisible(sticker)
}

##' empty hexagon
##'
##'
##' @title hexagon
##' @param size size of border
##' @param fill color of hexagon
##' @param color border color of hexagon
##' @return hexagon
##' @export
##' @author guangchuang yu
hexagon <- function(size=1.2, fill="#1881C2", color="#87B13F") {
    ggplot() + geom_hexagon(size=size, fill=fill, color=color) + theme_sticker()
}

##' @importFrom grDevices rgb
##' @author Johannes Rainer with modification from Guangchuang Yu and Sebastian Gibb
whiteTrans <- function(alpha = 0.4) {
    function(n) {
        rgb(red = rep(1, n), green = rep(1, n), blue = rep(1, n),
            alpha = seq(0, alpha, length.out = n))
    }
}

##' @importFrom stats rnorm
##' @importFrom hexbin hexbinplot
##' @author Johannes Rainer with modification from Guangchuang Yu
spotlight <- function(alpha) {
    ## set.seed(123)
    vals_x <- rnorm(500000, sd = 2, mean = 0)
    vals_y <- rnorm(500000, sd = 2, mean = 0)
    hexbinplot(vals_x ~ vals_y, colramp = whiteTrans(alpha), colorkey = FALSE,
               bty = "n", scales = list(draw = FALSE), xlab = "", ylab = "",
               border = NA, par.settings = list(axis.line = list(col = NA)))
}


##' add package name to sticker
##'
##'
##' @title geom_pkgname
##' @param package package name
##' @param x x position
##' @param y y position
##' @param color color
##' @param family font family
##' @param size font size
##' @param ... addition parameters passed to geom_text()
##' @return package name layer
##' @importFrom sysfonts font.add
##' @importFrom showtext showtext.auto
##' @importFrom ggplot2 geom_text
##' @export
##' @author guangchuang yu
geom_pkgname <- function(package, x=1, y=1.4, color="#FFFFFF", family="Aller_Rg", size=8, ...) {
    family <- load_font(family)
    d <- data.frame(x = x, y = y,
                    label = package)
    geom_text(aes_(x=~x, y=~y, label=~label), d,
              size=size, color=color, family = family, ...)
}

load_font <- function(family) {
    if (family == "Aller") {
        family <- "Aller_Rg"
    }

    fonts <- list.files(system.file("fonts", package="hexSticker"),
                        pattern="ttf$", recursive=TRUE, full.names=TRUE)
    i <- family == sub(".ttf", "", basename(fonts))
    if (any(i)) {
        font.add(family, fonts[which(i)[1]])
        showtext.auto()
    }
    return(family)
}

##' add url at the lower border of the sticker
##'
##'
##' @title geom_url
##' @param url url
##' @param x x position of url
##' @param y y position of url
##' @param family font family
##' @param size size of url
##' @param color color of url
##' @param angle angle of url, default is 30
##' @param hjust horizontal adjustment
##' @param ... additional parameters to geom_text
##' @return geom layer
##' @export
##' @author guangchuang yu
geom_url <- function(url="www.bioconductor.org", x=1, y=0.08, family="Aller_Rg", size=1.5, color="black", angle=30, hjust=0, ...) {
    family <- load_font(family)
    d <- data.frame(x = x,
                    y = y,
                    url = url)
    geom_text(aes_(x=~x, y=~y, label=~url),
              data = d,
              size = size,
              color = color,
              family = family,
              angle = angle,
              hjust = hjust,
              ...)
}

##' geom layer of hexagon
##'
##'
##' @title geom_hexagon
##' @param size size of border
##' @param fill color of hexagon
##' @param color color of border
##' @return hexagon layer
##' @importFrom ggplot2 aes_
##' @importFrom ggforce geom_circle
##' @export
##' @author guangchuang yu
geom_hexagon <- function(size=1.2, fill="#1881C2", color="#87B13F") {
    center <- 1
    radius <- 1
    d <- data.frame(x0 = center, y0 = center, r = radius)
    geom_circle(aes_(x0 = ~x0, y0 = ~y0, r = ~r),
                size = size, data = d, n = 5.5,
                fill = fill, color = color)
}

##' sticker theme
##'
##'
##' @title theme_sticker
##' @param ... additional parameters passed to theme()
##' @return theme for sticker
##' @importFrom ggplot2 coord_fixed
##' @importFrom ggplot2 theme
##' @importFrom ggplot2 element_blank
##' @importFrom ggplot2 scale_x_continuous
##' @importFrom ggplot2 scale_y_continuous
##' @importFrom ggimage theme_transparent
##' @export
##' @author guangchuang yu
theme_sticker <- function(...) {
    center <- 1
    radius <- 1
    h <- radius
    w <- sqrt(3)/2 * radius
    m <- 1.02

    list(theme_transparent() +
         theme(plot.margin = grid::unit(c(0, 0, -0.2, -0.2), "lines"),
               strip.text = element_blank(),
               line = element_blank(),
               text = element_blank(),
               title = element_blank(), ...),
         coord_fixed(),
         scale_y_continuous(expand = c(0, 0), limits = c(center-h*m, center+h*m)),
         scale_x_continuous(expand = c(0, 0), limits = c(center-w*m, center+w*m))
         )
}


##' save sticker to file
##'
##'
##' @title save_sticker
##' @param filename file name
##' @param sticker sticker
##' @return NULL
##' @importFrom ggplot2 ggsave
##' @importFrom ggplot2 last_plot
##' @export
##' @author guangchuang yu
save_sticker <- function(filename, sticker=last_plot()) {
    ggsave(sticker, width = 43.9, height = 50.8,
           filename = filename,
           bg = 'transparent',
           units = "mm")
}

##' open dev for sticker
##'
##'
##' @title sticker_dev
##' @return new dev
##' @importFrom grDevices dev.new
##' @export
##' @author guangchuang yu
sticker_dev <- function() {
    # if (!(all.equal(dev.size()[1], sqrt(3)) && all.equal(dev.size()[2], 2)))
    dev.new(width=sqrt(3), height=2, noRStudioGD=TRUE)
}


##' @export
ggimage::geom_subview

##' @export
ggimage::theme_transparent

##' @export
ggplot2::ggplot

