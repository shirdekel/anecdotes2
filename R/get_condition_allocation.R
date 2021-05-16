##' @title Parse condition allocation JS code for anecdotes 2

##' @return
##' @author Shir Dekel
##' @export
get_condition_allocation <- function() {
    condition_level <-
        list(
            seq_len(5),
            seq_len(2),
            c("anecdote_only", "combined")
        )

    condition_name <-
        c(
            "project_variation",
            "anecdote_variation",
            "anecdote_between"
        )

    sample <-
        list(
            condition_level,
            str_c(condition_name, "condition", sep = "_")
        ) %>%
        pmap_chr(
            ~ jspsych_sample(.x, .y)
        )

    urlvar <-
        condition_name %>%
        get_urlvar()

    condition_allocation <-
        c(sample, urlvar) %>%
        js::coffee_compile(bare = TRUE)

    return(condition_allocation)
}
