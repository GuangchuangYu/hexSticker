##' @importFrom grDevices as.raster
##' @method as.raster sticker
##' @export
as.raster.sticker <- function(x,  ...) {
    filename <- tempfile(fileext = ".png")
    save_sticker(filename, x, ...)
    as.raster(magick::image_read(filename))
}

##' @method plot sticker
##' @export
plot.sticker <- function(x, ...) {
    plot(as.raster.sticker(x), ...)
}
