# isfreemail ✉️🎐
R package to check if an email is from a provider offering free or burner accounts.

Burner email data comes from https://github.com/wesbos/burner-email-providers.

## Usage
The workhorses are `is_free_email` and `is_burner_email`:
```r
is_free_email("foo@gmail.com") # TRUE
is_free_email("foo@cuvox.de") # TRUE
is_free_email("foo@cuvox.de", include_burners = FALSE) # FALSE
is_burner_email("foo@cuvox.de") # TRUE
```
