`text.ordiplot`  <-
    function (x, what, labels, select, arrows = FALSE, length = 0.05,
              arr.mul, bg, ...)
{
    sco <- scores(x, what)
    if (!missing(labels))
        rownames(sco) <- labels
    if (!missing(select))
        sco <- .checkSelect(select, sco)
    if (!missing(arr.mul)) {
        arrows <- TRUE
        sco <- sco * arr.mul
    } else {
        scoatt <- attr(sco, "score")
        if (!is.null(scoatt) && scoatt %in% c("biplot", "regression")) {
            arrows <- TRUE
            sco <- sco * ordiArrowMul(sco)
        }
    }
    if (arrows) {
        arrows(0, 0, sco[,1], sco[,2], length = length, ...)
        sco <- ordiArrowTextXY(sco, rownames(sco), rescale = FALSE, ...)
    }
    if (missing(bg))
        text(sco, labels = rownames(sco), ...)
    else
        ordilabel(sco, labels = rownames(sco), fill = bg, ...)
    invisible(x)
}
