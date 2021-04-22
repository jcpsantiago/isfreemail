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


burner_email_provider_domains <- readLines(
  "https://raw.githubusercontent.com/wesbos/burner-email-providers/master/emails.txt"
)

burner_emails <- data.frame(
  type = "burner",
  domain = unique(c(burner_email_provider_domains, extra_burner, b))
)

all_providers <- unique(
  c(free_email_providers_domains, burner_email_provider_domains)
)

all_providers <- all_providers[order(all_providers)]

free_email_providers <- rbind(free_emails, burner_emails)

writeLines(
  all_providers,
  here::here("data-raw/free_email_providers_domains.txt")
)

usethis::use_data(free_email_providers, overwrite = TRUE, internal = TRUE)
