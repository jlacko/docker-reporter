docker run \
 -e DISABLE_AUTH=true \
 -v $(pwd)/output:/home/rstudio/output \
 -v $(pwd)/rmd:/home/rstudio/rmd \
 -v $(pwd)/R:/home/rstudio/R \
 --rm \
 -p 8787:8787 \
 egon

