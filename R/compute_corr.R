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
  stats::cor.test(
    x = data %>% dplyr::pull({{var1}}),
    y = data %>% dplyr::pull({{var2}})
  ) %>%
    broom::tidy() %>%
    dplyr::select(
      correlation = .data$estimate,
      pval = .data$p.value
    )
}
