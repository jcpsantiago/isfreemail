## code to prepare `free_email_providers` dataset goes here
# free_email_providers_longlist <- readLines(
#   "https://gist.githubusercontent.com/tbrianjones/5992856/raw/93213efb652749e226e69884d6c048e595c1280a/free_email_provider_domains.txt"
#   )

free_email_providers_domains <- c(
  "gmail.com", "zohomail.eu", "zohomail.de", "zohomail.com", "zoho.com", "zoho.de", "gmx.de", "gmx.biz", "gmx.org", "gmx.net", "firemail.eu", "firemail.de", "ok.de", "vip-client.de", "outlook.de", "outlook.com", "web.de", "mail.de", "yahoo.de", "yahoo.com", "aol.com", "aol.de", "icloud.com", "freenet.de",
  "mailbox.org", "posteo.de", "t-online.de", "hotmail.com", "hotmail.de", "aim.com", "googlemail.com",
  "tuta.io", "protonmail.com", "online.de", "email.de", "mein.gmx",
  "wp.pl", "yopmail.com", "vodafonemail.de", "tutanota.com", "skymail.de",
  "bizz.de", "gmx-topmail.de", "maills.de", "magenta.de", "bossmail.de", "emailn.de", "bk.ru", "yandex.ru", "hey.com", "live.com", "yandex.mail", "mail.ru", "list.ru", "inbox.ru"
)

free_emails <- data.frame(
  type = "free non-burner",
  domain = free_email_providers_domains
)

writeLines(
  unique(free_email_providers_domains[order(free_email_providers_domains)]),
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
