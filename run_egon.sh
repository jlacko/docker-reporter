docker run \
 -e DISABLE_AUTH=true \
 -v $(pwd)/output:/home/rstudio/output \
 --rm \
 -p 8787:8787 \
 egon

