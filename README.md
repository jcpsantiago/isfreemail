# isfreemail ✉️🎐
R package to check if an email is from a provider offering free or burner accounts.

Burner email data comes from https://github.com/wesbos/burner-email-providers and is quite extensive.
Free email providers includes everything in the "burner" dataset (see [usage](#usage)) plus providers offering email inboxes for free. This one is not as extensive, because I started it from scratch with German providers for now -- I'll add more over time from the various gists that exist online.

Install `{isfreemail}` with `remotes::install_github("jcpsantiago/isfreemail")`.

## Usage
The workhorses are `is_free_email` and `is_burner_email`:
```r
is_free_email("foo@gmail.com") # TRUE
is_free_email("foo@cuvox.de") # TRUE
is_free_email("foo@cuvox.de", include_burners = FALSE) # FALSE
is_burner_email("foo@cuvox.de") # TRUE
```
