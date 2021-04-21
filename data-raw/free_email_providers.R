## code to prepare `free_email_providers` dataset goes here
# free_email_providers_longlist <- readLines(
#   "https://gist.githubusercontent.com/tbrianjones/5992856/raw/93213efb652749e226e69884d6c048e595c1280a/free_email_provider_domains.txt"
#   )

arnt_freemail <- readLines("https://raw.githubusercontent.com/arnt/freemail/master/freemail.txt")

free_email_providers_domains <- readLines(
  here::here("data-raw/free_email_providers_domains.txt")
)

# These are not necessarily offering email accounts explicitly in their
# webpage, but they were used in illegal activities
shady_domains <- c(
  "zuzo.de", "rakers.net", "boou.de"
)

free_providers <- unique(
  c(arnt_freemail, free_email_providers_domains, shady_domains)
  )

free_emails <- data.frame(
  type = "free non-burner",
  domain = free_email_providers_domains
)

writeLines(
  unique(free_providers[order(free_providers)]),
  here::here("data-raw/free_email_providers_domains.txt")
)


burner_email_provider_domains <- readLines(
  "https://raw.githubusercontent.com/wesbos/burner-email-providers/master/emails.txt"
)

burner_emails <- data.frame(
  type = "burner",
  domain = burner_email_provider_domains
)

free_email_providers <- rbind(free_emails, burner_emails)

usethis::use_data(free_email_providers, overwrite = TRUE, internal = TRUE)
