#' Computes a tidy correlation
#'
#' @param data input data set
#' @param var1 name of variable 1 (unquoted)
#' @param var2 name of variable 2 (unquoted)
#'
#' @return A tibble with the Pearson Correlation and the p-value
#' @export
#'
#' @examples
#' compute_corr(data=faithful, var1=eruptions, var2 = waiting)
#'
#' @importFrom rlang .data
compute_corr <- function(data, var1, var2) {
  var1_chr <- rlang::as_label(rlang::ensym(var1))
  var2_chr <- rlang::as_label(rlang::ensym(var2))

  if (!(var1_chr %in% names(data))) {
    # stop(glue::glue("{var1_chr} is not in the data-set."))
    usethis::ui_stop("{var1_chr} is not in the data-set.")
  }

  if (!(var2_chr %in% names(data))) {
    # stop(glue::glue("{var2_chr} is not in the data-set."))
    usethis::ui_stop("{var2_chr} is not in the data-set.")
  }

  result <- stats::cor.test(
    x = data %>% dplyr::pull({{ var1 }}),
    y = data %>% dplyr::pull({{ var2 }})
  ) %>%
    broom::tidy() %>%
    dplyr::select(
      correlation = .data$estimate,
      pval = .data$p.value
    )

  attr(result$correlation, "names") <- NULL
  return(result)
}
