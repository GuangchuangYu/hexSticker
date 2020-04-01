##' @importFrom grDevices as.raster
##' @method as.raster sticker
##' @export
as.raster.sticker <- function(x,  ...) {
    filename <- x$plot_env$filename
    if (is.null(filename) || is.na(filename) || !file.exists(filename)) {
        filename <- tempfile(fileext = ".png")
        class(x) <- c("gg", "ggplot")
        save_sticker(filename, x, ...)
    }

    as.raster(magick::image_read(filename))
}

##' @method plot sticker
##' @export
plot.sticker <- function(x, ...) {
    plot(as.raster.sticker(x), ...)
}

