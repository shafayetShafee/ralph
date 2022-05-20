write_rladies <- function(x) {

  if ( !(is.numeric(x) & (x >= 1)) ) {
    usethis::ui_stop("input must be numeric and greater than or equal to 1")
  }

  if ( !(x == round(x)) ) {
    usethis::ui_stop("input must be an integer number")
  }

  if (x == 1) {
    verb <- "is"
    noun <- "RLady"
  }

  if (x > 1) {
    verb <- "are"
    noun <- "RLadies"
  }

  as.character(glue::glue("There {verb} {x} awesome {noun}!"))

}


compose_rladies <- function(x) {
  purrr::map_chr(x, write_rladies)
}
