library(usethis)

usethis::create_github_token()
gitcreds::gitcreds_set() # set or review
usethis::gh_token_help()
usethis::git_sitrep()



# in terminal - this is great?

git config --global user.email "ajc2357@yahoo.com"
git config --global user.name "Alex-Chisholm"
git config --global --list