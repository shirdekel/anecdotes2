##' @title Get omnibus analysis for allocation difference data
##' @return
##' @author Shir Dekel
##' @export
##' @param data
get_omnibus_allocation_difference <- function(data = anecdotes2::data) {
  data %>%
    dplyr::filter(
      anecdote_between == "combined"
    ) %>%
    afex::aov_ez(
      id = "id",
      dv = "allocation_difference",
      within = c("similarity", "valence"),
      data = .,
      type = 2
    )
}
