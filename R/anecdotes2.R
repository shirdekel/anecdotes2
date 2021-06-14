#' anecdotes2
#' A data package for the Anecdotes 2 experiment.
#' @docType package
#' @aliases anecdotes2-package
#' @title Anecdotes 2 experiment
#' @name anecdotes2
#' @description Data, materials, and experiment code for the Anecdotes 2 experiment.
#' @details Use \code{data(package='anecdotes2')$results[, 3]} to see a list of available data sets in this data package
#'     and/or DataPackageR::load_all
#' _datasets() to load them.
#' @seealso
#' \link{plot_simulation}
#' \link{power}
NULL





#' Detailed description of the data
#' @name data
#' @docType data
#' @title Descriptive data title
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{id}{}
#' \item{subject}{}
#' \item{prolific}{}
#' \item{contact}{}
#' \item{address}{}
#' \item{sex}{}
#' \item{age}{}
#' \item{language}{}
#' \item{language_other}{}
#' \item{business_edu}{}
#' \item{business_exp}{}
#' \item{current}{}
#' \item{company_name}{}
#' \item{sector}{}
#' \item{sector_other}{}
#' \item{employees}{}
#' \item{revenue}{}
#' \item{role_company}{}
#' \item{role_company_other}{}
#' \item{role_allocation}{}
#' \item{role_allocation_other}{}
#' \item{budget}{}
#' \item{instructions_test}{}
#' \item{interstitial_5}{}
#' \item{interstitial_3}{}
#' \item{interstitial_1}{}
#' \item{interstitial_2}{}
#' \item{interstitial_4}{}
#' \item{stage}{}
#' \item{thesis_project}{}
#' \item{experiment}{}
#' \item{sample}{}
#' \item{project_variation}{}
#' \item{anecdote_variation}{}
#' \item{anecdote_between}{}
#' \item{current_project_display_order}{}
#' \item{PROLIFIC_PID}{}
#' \item{STUDY_ID}{}
#' \item{SESSION_ID}{}
#' \item{url}{}
#' \item{anecdote_within}{}
#' \item{similarity}{}
#' \item{valence}{}
#' \item{business_name}{}
#' \item{type}{}
#' \item{npv_amount}{}
#' \item{reliability}{}
#' \item{detail_1_description}{}
#' \item{detail_1_value}{}
#' \item{detail_2_description}{}
#' \item{detail_2_value}{}
#' \item{detail_3_description}{}
#' \item{detail_3_value}{}
#' \item{detail_4_description}{}
#' \item{detail_4_value}{}
#' \item{project_type}{}
#' \item{allocation}{}
#' \item{current_response}{}
#' \item{stimulus}{}
#' \item{button_pressed}{}
#' \item{similarity_rating}{}
#' \item{relevance_specific_rating}{}
#' \item{relevance_general_rating}{}
#' \item{justify}{}
#' \item{datetime}{}
#' \item{total_time}{}
#' \item{project_test_fail}{}
#' \item{interstitial_1_fail}{}
#' \item{interstitial_2_fail}{}
#' \item{check_fail_count}{}
#' \item{reject}{}
#' \item{date_rank}{}
#' }
#' @source The data was collected using Prolific.
#' @seealso
#' \link{anecdotes2}
NULL





#' Detailed description of the data
#' @name plot_simulation
#' @docType data
#' @title Descriptive data title
#' @format a \code{list} containing the following fields:
#' \describe{
#' \item{negative}{}
#' \item{positive}{}
#' }
#' @source The data comes from________________________.
#' @seealso
#' \link{anecdotes2}
#' \link{power}
NULL





#' Detailed description of the data
#' @name power
#' @docType data
#' @title Descriptive data title
#' @format a \code{list} containing the following fields:
#' \describe{
#' \item{power_curve}{}
#' \item{n}{}
#' \item{n_total}{}
#' }
#' @source The data comes from________________________.
#' @seealso
#' \link{anecdotes2}
#' \link{plot_simulation}
NULL
