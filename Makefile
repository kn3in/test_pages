USER := kn3in
REPO := test_pages

slides: index.html

setup_gh_pages :
    git init
    git commit --allow-empty -m 'initial commit'
    git checkout -b gh-pages
    touch index.Rmd
    git add .
    git commit -a -m 'set up deck as gh-pages branch'

add_gh_remote:
    git remote add github https://github.com/$(USER)/$(REPO).git

deploy: slides
    git push origin gh-pages

%.html: %.Rmd
    Rscript -e "library(slidify); slidify('$<', '$@')"
