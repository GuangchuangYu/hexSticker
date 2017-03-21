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
                    filename = paste0(package, ".png")) {

    hex <- hexagon(size=h_size, fill=h_fill, color=h_color)
    if (inherits(subplot, "character")) {
        d <- data.frame(x=s_x, y=s_y, image=subplot)
        sticker <- hex + geom_image(aes_(x=~x, y=~y, image=~image), d, size=s_width)
    } else {
        sticker <- hex + geom_subview(subplot, x=s_x, y=s_y, width=s_width, height=s_height)
    }

    sticker <- sticker + geom_pkgname(package, p_x, p_y, p_color, p_family, p_size)

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
    d <- data.frame(x = x, y = y,
                    label = package)
    geom_text(aes_(x=~x, y=~y, label=~label), d,
              size=size, color=color, family = family, ...)
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
    # if (!(all.equal(dev.size()[1], 1.728) && all.equal(dev.size()[2], 2)))
    dev.new(width=1.728, height=2, noRStudioGD=TRUE)
}


##' @export
ggimage::geom_subview

##' @export
ggimage::theme_transparent

##' @export
ggplot2::ggplot

