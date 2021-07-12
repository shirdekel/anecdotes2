##' @title Get plot for anecdotes 2
##' @param data
##' @return
##' @author Shir Dekel
##' @export
get_plot <- function(data = anecdotes2::data) {
  allocation <-
    data %>%
    get_omnibus_allocation() %>%
    plot_allocation()

  allocation_difference <-
    data %>%
    get_omnibus_allocation_difference() %>%
    plot_allocation_difference_anecdotes_2()

  similarity <-
    data %>%
    afex::aov_ez(
      id = "id",
      dv = "similarity_rating",
      between = "anecdote_between",
      within = c("valence", "similarity"),
      data = .,
      type = 2
    ) %>%
    afex::afex_plot(
      x = "anecdote_between",
      trace = "similarity",
      panel = "valence"
    )

  relevance_specific <-
    data %>%
    afex::aov_ez(
      id = "id",
      dv = "relevance_specific_rating",
      between = "anecdote_between",
      within = c("valence", "similarity"),
      data = .,
      type = 2
    ) %>%
    afex::afex_plot(
      x = "anecdote_between",
      trace = "similarity",
      panel = "valence"
    )

  relevance_general <-
    data %>%
    afex::aov_ez(
      id = "id",
      dv = "relevance_general_rating",
      between = "anecdote_between",
      within = c("valence", "similarity"),
      data = .,
      type = 2
    ) %>%
    afex::afex_plot(
      x = "anecdote_between",
      trace = "similarity",
      panel = "valence"
    )

  allocation_similarity <-
    data %>%
    ggplot2::ggplot(ggplot2::aes_string(x = "similarity_rating", y = "allocation")) +
    ggplot2::facet_grid(cols = ggplot2::vars(valence)) +
    ggplot2::geom_point(alpha = 0.2) +
    ggplot2::geom_smooth(method = lm, color = "black") +
    ggplot2::labs(
      x = "Similarity rating",
      y = "Mean allocation to the target project"
    ) +
    papaja::theme_apa()

  allocation_relevance_specific_similarity <-
    data %>%
    dplyr::mutate(
      dplyr::across(
        similarity,
        ~ .x %>%
          forcats::fct_relevel("low", "high") %>%
          dplyr::recode(low = "Low", high = "High")
      ),
      dplyr::across(
        valence,
        dplyr::recode,
        negative = "Negative valence",
        positive = "Positive valence"
      )
    ) %>%
    ggplot2::ggplot(ggplot2::aes_string(
      x = "relevance_specific_rating", y = "allocation",
      linetype = "similarity", color = "similarity"
    )) +
    ggplot2::facet_grid(cols = ggplot2::vars(valence)) +
    ggplot2::geom_point(alpha = 0.2) +
    ggplot2::geom_smooth(method = "lm") +
    ggplot2::labs(
      x = "Specific relevance rating",
      color = "Similarity",
      linetype = "Similarity",
      y = "Mean allocation to the target project"
    ) +
    papaja::theme_apa()

  relevance_specific_similarity <-
    data %>%
    ggplot2::ggplot(ggplot2::aes_string(x = "similarity_rating", y = "relevance_specific_rating")) +
    ggplot2::facet_grid(cols = ggplot2::vars(valence)) +
    ggplot2::geom_point(alpha = 0.2) +
    ggplot2::geom_smooth(method = lm, color = "black") +
    ggplot2::labs(
      x = "Similarity rating",
      y = "Specific relevance rating"
    ) +
    papaja::theme_apa()

  lm <-
    tibble::lst(
      allocation_similarity,
      allocation_relevance_specific_similarity,
      relevance_specific_similarity
    )

  tibble::lst(
    allocation,
    allocation_difference,
    similarity,
    relevance_specific,
    relevance_general,
    lm
  )
}
