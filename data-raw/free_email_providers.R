## code to prepare `free_email_providers` dataset goes here
# free_email_providers_longlist <- readLines(
#   "https://gist.githubusercontent.com/tbrianjones/5992856/raw/93213efb652749e226e69884d6c048e595c1280a/free_email_provider_domains.txt"
#   )

arnt_freemail <- readLines("https://raw.githubusercontent.com/arnt/freemail/master/freemail.txt")
stopforumspam_domains <- readLines("https://www.stopforumspam.com/downloads/toxic_domains_whole.txt")

free_email_providers_domains <- c(readLines(
  here::here("data-raw/free_email_providers_domains.txt")
), "email.gmx", "arcor.de")

# These are not necessarily offering email accounts explicitly in their
# webpage, but they were used in illegal activities
shady_domains <- c(
  "zuzo.de", "rakers.net", "boou.de"
)

toxic_email_provider_domains <- unique(c(shady_domains, stopforumspam_domains))

free_providers <- unique(
  c(arnt_freemail, free_email_providers_domains)
)

free_emails <- data.frame(
  type = "free non-burner",
  domain = c(free_email_providers_domains, "duck.com", "info.net")
)


burner_email_provider_domains <- readLines(
  "https://raw.githubusercontent.com/wesbos/burner-email-providers/master/emails.txt"
)

burner_emails <- data.frame(
  type = "burner",
  domain = unique(c(burner_email_provider_domains))
)

toxic_emails <- data.frame(
  type = "toxic",
  domain = unique(c(shady_domains, stopforumspam_domains))
)

all_providers <- unique(
  c(free_email_providers_domains, burner_email_provider_domains, toxic_email_provider_domains)
)

all_providers <- all_providers[order(all_providers)]

free_email_providers <- do.call(
  "rbind",
  list(free_emails, burner_emails, toxic_emails)
)

free_email_providers <- free_email_providers[free_email_providers$type %in% c("burner", "free non-burner", "toxic"), ]

writeLines(
  all_providers,
  here::here("data-raw/free_email_providers_domains.txt")
)

usethis::use_data(free_email_providers, overwrite = TRUE, internal = TRUE)
