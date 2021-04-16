#' Is valid email?
#'
#' @param email An email address as a string.
#'
#' @return A logical.
#' @export
#'
#' @examples
#' is_valid_email("foo@mail.")
#' is_valid_email("foo@mail.com")
is_valid_email <- function(email) {
  # W3C validation as of 2021-04-16
  grepl(
    "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$",
    email
  )
}

#' Extract email domain
#'
#' @param email An email address as a string.
#'
#' @return A string with the domain part of an email address.
#' @export
#'
#' @examples
#' extract_email_domain("foo@mail.com") # mail.com
extract_email_domain <- function(email) {
  gsub(".*@", "", email)
}

#' Is email free?
#'
#' @param email An email address as a string.
#' @param include_burner Should domains for burner emails be included. Default: TRUE
#'
#' @return A logical.
#' @export
#'
#' @examples
#' is_free_email("foo@gmail.com") # TRUE
#' is_free_email("foo@myownservermeh.com") # FALSE
is_free_email <- function(email, include_burner = TRUE) {
  stopifnot(is_valid_email(email))

  if (isFALSE(include_burner)) {
    free_email_providers <- free_email_providers[
      free_email_providers$type != "burner",
    ]
  }

  email_domain <- extract_email_domain(email)

  email_domain %in% free_email_providers$domain
}

#' Is email burner?
#'
#' @param email An email address as a string.
#'
#' @return A logical.
#' @export
#'
#' @examples
#' is_burner_email("foo@cuvox.de") # TRUE
#' is_burner_email("foo@gmail.com") # FALSE
is_burner_email <- function(email) {
  stopifnot(is_valid_email(email))

  email_domain <- extract_email_domain(email)

  email_domain %in% free_email_providers[
    free_email_providers$type == "burner",
  ]$domain
}
