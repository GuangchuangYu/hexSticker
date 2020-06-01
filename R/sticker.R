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
##' @param h_color color for hexagon border
##' @param spotlight whether add spotlight
##' @param l_x x position for spotlight
##' @param l_y y position for spotlight
##' @param l_width width for spotlight
##' @param l_height height for spotlight
##' @param l_alpha maximum alpha for spotlight
##' @param url url at lower border
##' @param u_x x position for url
##' @param u_y y position for url
##' @param u_color color for url
##' @param u_family font family for url
##' @param u_size text size for url
##' @param u_angle angle for url
##' @param white_around_sticker default to FALSE. If set to TRUE, it puts
##'           white triangles in the corners
##' @param ... additional parameter to geom_pkgname
##' @param filename filename to save sticker
##' @param asp aspect ratio, only works if subplot is an image file
##' @param dpi plot resolution
##' @details
##' The extension given in `filename` determines the graphics device that is
##' used to render the sticker, e.g. `filename = 'sticker.png'` creates a png file
##' and `filename = 'sticker.svg'` creates a svg file. For a list of supported
##' graphics devices please see the documentation of [ggplot2::ggsave()].
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
##' @author Guangchuang Yu
##' @md
sticker <- function(subplot, s_x=.8, s_y=.75, s_width=.4, s_height=.5,
                    package, p_x=1, p_y=1.4, p_color="#FFFFFF", p_family="Aller_Rg", p_size=8,
                    h_size=1.2, h_fill="#1881C2", h_color="#87B13F",
                    spotlight=FALSE, l_x=1, l_y=.5, l_width=3, l_height=3, l_alpha=0.4,
                    url = "",  u_x=1, u_y=0.08, u_color="black", u_family="Aller_Rg", u_size=1.5, u_angle=30,
                    white_around_sticker = FALSE, ...,
                    filename = paste0(package, ".png"), asp=1, dpi = 300) {

    hex <- ggplot() +
      geom_hexagon(size = h_size, fill = h_fill, color = NA)

    if (inherits(subplot, "character")) {
        d <- data.frame(x=s_x, y=s_y, image=subplot)
        sticker <- hex + geom_image(aes_(x=~x, y=~y, image=~image), d, size=s_width, asp=asp)
    } else {
        sticker <- hex + geom_subview(subview=subplot, x=s_x, y=s_y, width=s_width, height=s_height)
    }

    sticker <- sticker +
      geom_hexagon(size = h_size, fill = NA, color = h_color)

    if(spotlight)
        sticker <- sticker + geom_subview(subview=spotlight(l_alpha), x=l_x, y=l_y, width=l_width, height=l_height)

    sticker <- sticker + geom_pkgname(package, p_x, p_y, p_color, p_family, p_size, ...)

    sticker <- sticker + geom_url(url, x=u_x, y = u_y, color = u_color, family = u_family, size=u_size, angle=u_angle)

    if (white_around_sticker)
      sticker <- sticker + white_around_hex(size = h_size)

    sticker <- sticker + theme_sticker(size = h_size)

    save_sticker(filename, sticker, dpi = dpi)
    class(sticker) <- c("sticker", class(sticker))
    invisible(sticker)
}

# ##' empty hexagon
# ##'
# ##'
# ##' @title hexagon
# ##' @param size size of border
# ##' @param fill color of hexagon
# ##' @param color border color of hexagon
# ##' @return hexagon
# ##' @export
# ##' @author Guangchuang Yu
# hexagon <- function(size=1.2, fill="#1881C2", color="#87B13F") {
#     ggplot() + geom_hexagon(size=size, fill=fill, color=color) + theme_sticker(size)
# }


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
##' @importFrom ggplot2 geom_text
##' @export
##' @author Guangchuang Yu
geom_pkgname <- function(package, x=1, y=1.4, color="#FFFFFF", family="Aller_Rg", size=8, ...) {
    family <- load_font(family)
    d <- data.frame(x = x, y = y,
                    label = package)
    geom_text(aes_(x=~x, y=~y, label=~label), d,
              size=size, color=color, family = family, ...)
}

##' @importFrom sysfonts font_add
##' @importFrom showtext showtext_auto
load_font <- function(family) {
    ## load the font packed in the hexSticker package,
    ## otherwise, load system fonts
    ##
    ## google font can be supported via `showtext`,
    ## see https://github.com/GuangchuangYu/hexSticker#google-fonts
    ##
    if (family == "Aller") {
        family <- "Aller_Rg"
    }

    fonts <- list.files(system.file("fonts", package="hexSticker"),
                        pattern="ttf$", recursive=TRUE, full.names=TRUE)
    i <- family == sub(".ttf", "", basename(fonts))
    if (any(i)) {
        font_add(family, fonts[which(i)[1]])
        showtext_auto()
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
##' @author Guangchuang Yu
geom_url <- function(url="www.bioconductor.org", x=1, y=0.08, family="Aller_Rg",
                     size=1.5, color="black", angle=30, hjust=0, ...) {
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
##' @importFrom ggplot2 geom_polygon
## @importFrom ggforce geom_circle
##' @export
##' @author Guangchuang Yu
geom_hexagon <- function(size=1.2, fill="#1881C2", color="#87B13F") {
    ## center <- 1
    ## radius <- 1
    ## d <- data.frame(x0 = center, y0 = center, r = radius)
    ## geom_circle(aes_(x0 = ~x0, y0 = ~y0, r = ~r),
    ##             size = size, data = d, n = 5.5,
    ##             fill = fill, color = color)
    hexd <- data.frame(x = 1+c(rep(-sqrt(3)/2, 2), 0, rep(sqrt(3)/2, 2), 0),
                       y = 1+c(0.5, -0.5, -1, -0.5, 0.5, 1))
    hexd <- rbind(hexd, hexd[1, ])
    geom_polygon(aes_(x=~x, y=~y), data=hexd,
                 size = size, fill = fill, color = color)
}


white_around_hex <- function(size = 1.2) {
  # copied from theme_sticker
  center <- 1
  radius <- 1
  h <- radius
  w <- sqrt(3)/2 * radius
  m <- 1.02
  x_lims <- c(center-w*m , center+w*m)
  y_lims <- c(center-h*m , center+h*m)
  # starting at left, upper and going around counter-clockwise
  x_vertices <- 1+c(rep(-sqrt(3)/2, 2), 0, rep(sqrt(3)/2, 2), 0)
  y_vertices <- 1+c(0.5, -0.5, -1, -0.5, 0.5, 1)

  list(
  ggplot2::geom_polygon(mapping = aes_(x = ~x, y = ~y),
                        data = data.frame(x = c(x_lims[1], x_lims[1], x_vertices[6]),
                                          y = c(y_vertices[1], y_lims[2], y_lims[2])),
                        fill = 'white'),
  ggplot2::geom_polygon(mapping = aes_(x = ~x, y = ~y),
                        data = data.frame(x = c(x_vertices[6], x_lims[2], x_lims[2]),
                                          y = c(y_lims[2], y_lims[2], y_vertices[5])),
                        fill = 'white'),
  ggplot2::geom_polygon(mapping = aes_(x = ~x, y = ~y),
                        data = data.frame(x = c(x_vertices[3], x_lims[2], x_lims[2]),
                                          y = c(y_lims[1], y_vertices[4], y_lims[1])),
                        fill = 'white'),
  ggplot2::geom_polygon(mapping = aes_(x = ~x, y = ~y),
                        data = data.frame(x = c(x_lims[1], x_lims[1], x_vertices[3]),
                                          y = c(y_lims[1], y_vertices[2], y_lims[1])),
                        fill = 'white')
  )
}

##' sticker theme
##'
##'
##' @title theme_sticker
##' @param size size of hexagon border
##' @param ... additional parameters passed to theme()
##' @return theme for sticker
##' @importFrom ggplot2 coord_fixed
##' @importFrom ggplot2 theme
##' @importFrom ggplot2 element_blank
##' @importFrom ggplot2 scale_x_continuous
##' @importFrom ggplot2 scale_y_continuous
##' @importFrom ggplot2 margin
##' @importFrom ggimage theme_transparent
##' @export
##' @author Guangchuang Yu
theme_sticker <- function(size=1.2, ...) {
    center <- 1
    radius <- 1
    h <- radius
    w <- sqrt(3)/2 * radius
    m <- 1.02
    list(
      theme_transparent() +
        theme(plot.margin = margin(b = -.2, l= -.2, unit = "lines"),
              strip.text = element_blank(),
              line = element_blank(),
              text = element_blank(),
              title = element_blank(), ...),
      coord_fixed(),
      scale_y_continuous(expand = c(0, 0), limits = c(center-h*m , center+h*m )),
      scale_x_continuous(expand = c(0, 0), limits = c(center-w*m , center+w*m ))
    )
}


##' save sticker to file
##'
##'
##' @title save_sticker
##' @param filename file name
##' @param sticker sticker
##' @param ... additional parameters for ggsave
##' @return NULL
##' @importFrom ggplot2 ggsave
##' @importFrom ggplot2 last_plot
##' @importFrom tools file_ext
##' @export
##' @author Guangchuang Yu
save_sticker <- function(filename, sticker = last_plot(), ...) {
    args <- list(filename = filename, plot = sticker, width = 43.9,
                 height = 50.8, units = "mm", bg = "transparent", ...)
    is_png <- (!is.null(args$device) && args$device == "png") ||
              file_ext(filename) == "png"
    is_win <- .Platform$OS.type == "windows"
    if (is_png && is_win && capabilities("cairo")) {
      args$type <- "cairo-png"
      args$antialias <- "subpixel"
    }
    do.call(ggsave, args)
}

##' open dev for sticker
##'
##'
##' @title sticker_dev
##' @return new dev
##' @importFrom grDevices dev.new
##' @export
##' @author Guangchuang Yu
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

