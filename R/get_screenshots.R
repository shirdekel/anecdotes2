##' @title Screenshots anecdotes 2

##' @return
##' @author Shir Dekel
##' @export
get_screenshots <- function(experiment_directory) {
  file_name_materials <-
    get_file_name_materials_anecdotes_2()

  materials_directory <-
    file.path("inst", "materials")

  file_path_materials <-
    shirthesis::get_file_path_materials(materials_directory, file_name_materials)

  pre_experiment <-
    str_c(
      "this.click('#jspsych-instructions-next');",
      str_c(
        "this.click('.jspsych-btn');" %>%
          rep(3),
        collapse = "\n"
      ),
      sep = "\n"
    )

  casper_calls_chronological <-
    c(
      pre_experiment,
      "this.click('.jspsych-btn');" %>%
        rep(15)
    ) %>%
    slider::slide(~., .before = Inf) %>%
    map_chr(
      ~ str_c(
        .,
        collapse = "\n"
      )
    )

  casper_calls <-
    casper_calls_chronological %>%
    .[
      c(
        # General instructions
        1,
        # Anecdote only instructions
        3,
        # Combined instructions
        3,
        # Statistics only instructions
        15,
        # Interstitial, display (anecdote and target), and follow-up - negative high
        2,
        3,
        3,
        4,
        # Interstitial, display (anecdote and target), and follow-up - positive high
        5,
        6,
        6,
        7,
        # Interstitial, display (anecdote and target), and follow-up - negative low
        8,
        9,
        9,
        10,
        # Interstitial, display (anecdote and target), and follow-up - positive low
        11,
        12,
        12,
        13,
        # Interstitial, display (just target), and follow-up -  Anecdote only
        14:16
      )
    ]

  anecdote_between <-
    c(
      "anecdote_only" %>%
        rep(2),
      "combined" %>%
        rep(21)
    )

  webshot_eval <-
    list(
      casper_calls,
      anecdote_between
    ) %>%
    pmap_chr(
      function(casper_calls, anecdote_between) {
        str_c(
          "casper.thenOpen(this.getCurrentUrl() + '",
          "?test=true",
          "&project_variation=1",
          "&anecdote_variation=1",
          "&anecdote_between=",
          anecdote_between,
          str_c(
            "', function() {", casper_calls, "});",
            sep = "\n"
          )
        )
      }
    )

  selector_type <-
    list(
      instructions = ".instructions",
      anecdote = ".anecdote",
      target = ".target"
    )

  selector <-
    list(
      NULL,
      selector_type$anecdote,
      selector_type$target,
      NULL
    ) %>%
    rep(4) %>%
    c(
      list(NULL),
      list(selector_type$instructions) %>%
        rep(3),
      .,
      list(NULL),
      list(selector_type$target),
      list(NULL)
    )

  expand_type <-
    list(
      anecdote_only = c(-1200, 0, 1200, 0),
      combined_short = c(-1620, 0, 1620, 0),
      combined_medium = c(-1675, 0, 1675, 0),
      combined_long = c(-1730, 0, 1730, 0),
      statistics_only = c(-550, 0, 550, 0)
    )

  expand_allocation <-
    list(
      expand_type$combined_short %>%
        list() %>%
        rep(2),
      expand_type$combined_medium %>%
        list() %>%
        rep(2),
      expand_type$combined_short %>%
        list() %>%
        rep(2),
      expand_type$combined_long %>%
        list() %>%
        rep(2),
      expand_type$statistics_only %>%
        list()
    )

  expand <-
    expand_allocation %>%
    list(
      0 %>% rep(5),
      .,
      0 %>% rep(5)
    ) %>%
    transpose() %>%
    map(flatten) %>%
    flatten() %>%
    c(
      0,
      expand_type$anecdote_only %>%
        list(),
      expand_type$combined_short %>%
        list(),
      expand_type$statistics_only %>%
        list(),
      .
    )


  file.path(experiment_directory, "index.html") %>%
      webshot::webshot(
          file = file_path_materials,
          eval = webshot_eval,
          selector = selector,
          expand = expand
      )
}
