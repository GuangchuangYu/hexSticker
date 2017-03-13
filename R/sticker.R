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
##' @importFrom ggtree subview
##' @export
##' @examples
##' library(ggplot2)
##' p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
##' p <- p + theme_void() + theme_transparent()
##' sticker(p, package="hexSticker")
##' @author guangchuang yu
sticker <- function(subplot, s_x=.8, s_y=.75, s_width=.4, s_height=.5,
                    package, p_x=1, p_y=1.4, p_color="#FFFFFF", p_family="Aller", p_size=6,
                    h_size=1.2, h_fill="#1881C2", h_color="#87B13F",
                    filename = paste0(package, ".png")) {
    hex <- make_hex(size=h_size, fill=h_fill, color=h_color)
    hex <- add_pkg_name(hex, package, p_x, p_y, p_color, p_family, p_size)
    subplot <- toGrob(subplot)
    sticker <- subview(hex, subplot, x=s_x, y=s_y, width=s_width, height=s_height)
    save_sticker(sticker, filename)
    invisible(sticker)
}

##' @importFrom ggplot2 ggsave
save_sticker <- function(sticker, filename) {
    ggsave(sticker, width = 43.9, height = 50.8,
           filename = filename,
           bg = 'transparent',
           units = "mm")
}

## @importFrom grid grid.grabExpr
##' @importFrom ggplot2 ggplotGrob
##' @importFrom gridGraphics grid.echo
##' @importFrom grid grid.grab
toGrob <- function(x) {
    if (inherits(x, "expression")) {
        x <- eval(x)
        if (is.null(x)) {
            grid.echo()
            x <- grid.grab()
        }
    }

    if (inherits(x, "ggplot"))
        x <- ggplotGrob(x)
    if (inherits(x, "trellis")) {
        x <- grid::grid.grabExpr(print(x))
    }
    return(x)
}

##' @importFrom sysfonts font.add
##' @importFrom showtext showtext.auto
##' @importFrom ggplot2 annotate
add_pkg_name <- function(hex, package, x, y, color, family, size) {
    if (family == "Aller") {
        font <- system.file("fonts/Aller/Aller_Rg.ttf", package="hexSticker")
        font.add(family, font)
        showtext.auto()
    }

    hex + annotate("text", x=x, y=y, label=package,
                   color=color, size=size, family=family)

}

##' @export
ggtree::theme_transparent


##' @importFrom ggplot2 ggplot
##' @importFrom ggplot2 aes_
##' @importFrom ggplot2 coord_fixed
##' @importFrom ggplot2 theme
##' @importFrom ggplot2 element_blank
##' @importFrom ggplot2 scale_x_continuous
##' @importFrom ggplot2 scale_y_continuous
##' @importFrom ggtree theme_transparent
##' @importFrom ggplot2 coord_fixed
##' @importFrom ggforce geom_circle
make_hex <- function(center=1, radius=1, size=1.2, fill, color) {
    d <- data.frame(x0 = center, y0 = center, r = radius)
    hex <- ggplot() +
        geom_circle(aes_(x0 = ~x0, y0 = ~y0, r = ~r),
                    size = size, data = d, n = 5.5,
                    fill = fill, color = color) +
        coord_fixed() + theme_transparent() +
        theme(strip.text = element_blank()) +
        theme(line = element_blank(),
              text = element_blank(),
              title = element_blank())

    h <- radius
    w <- sqrt(3)/2 * radius
    m <- 1.02

    hex + scale_y_continuous(expand = c(0, 0), limits = c(center-h*m, center+h*m)) +
        scale_x_continuous(expand = c(0, 0), limits = c(center-w*m, center+w*m)) +
        theme(plot.margin = grid::unit(c(0, 0, -0.2, -0.2), "lines"))
}


