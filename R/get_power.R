##' @title Get power components

##' @return
##' @author Shir Dekel
##' @export
##' @param power_table_anecdotes_2
get_power <- function(power_table_anecdotes_2) {
  data_power <-
    power_table_anecdotes_2 %>%
    mutate(
      across(
        effect,
        ~ .x %>%
          as_factor()
      )
    ) %>%
    nest_by(effect, power, upper, lower, n)

  min_n <-
    data_power %>%
    mutate(
      n = n %>%
        as.character() %>%
        as.numeric()
    ) %>%
    pull(n) %>%
    min()

  data_label <-
    data_power %>%
    filter(power > 0.8) %>%
    group_by(effect) %>%
    slice_min(power, with_ties = FALSE) %>%
    filter(n != min_n)

  power_curve <-
    get_power_curve_anecdotes_2(data_power, data_label)

  n <-
    data_label %>%
    mutate(
      across(n, ~ .x %>%
        as.character() %>%
        as.numeric())
    ) %>%
    pull(n) %>%
    max()

  n_total <-
    n %>%
    prod(2)

  power <-
    lst(
      power_curve,
      n,
      n_total
    )

  return(power)
}
