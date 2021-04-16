test_that("validation works", {
  expect_true(is_valid_email("picard@starfleet.ufp"))
})

test_that("extracting domain works", {
  expect_equal(
    extract_email_domain("picard@starfleet.ufp"),
    "starfleet.ufp"
  )

  expect_equal(
    extract_email_domain("julius-caeser_1@empire.gov"),
    "empire.gov"
  )
})
