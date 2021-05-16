#' @title `{drake}` plan

#' @return
#' @author Shir Dekel
#' @export
get_plan <- function() {
  drake_plan(
    experiment_resources = target(
      file.path("inst", "experiment_resources"),
      format = "file"
    ),
    main = get_main(),
    experiment = target(
      {
        shirthesis::get_experiment(
          experiment_directory = file.path("inst", "jspsych"),
          experiment_resources,
          main,
          post_experiment = get_post_experiment(),
          columns = get_columns(),
          condition_allocation = get_condition_allocation(),
          ethics = FALSE,
          on_finish = NULL
        )
        file.path("inst", "jspsych", "experiment")
      },
      target = "file"
    ),
    materials = get_screenshots(experiment)
  )
}
