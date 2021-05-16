#' Generate a latin square design as a list
#'
#' @param x A vector or list.
#'
#' @return A list.
#' @export
#'
#' @examples
#' x <- c(1:4)
#' latin_list(x)
latin_list <- function(x) {
    set.seed(42)
    y <- magic::rlatin(length(x)) %>%
        apply(1, function(x) as.list(x)) %>%
        purrr::map(unlist)
    y %>%
        purrr::map(~ x[.x])
}
