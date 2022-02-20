# docker-reporter

A tool for producing pdf reports in a reliable & reproducible manner using a containerized interactive RStudio session.

It is intended as an one trick pony - building pdf versions of R Markdown documents from version controlled source, using a set of helper R scripts as required.

While a working internet connection is required for building the image, the dockerfile is set up to contain all the required R and LaTeX packages; no more of the dreaded `! LaTeX Error: Environment tabu undefined.` messages, thank you! The image, once built, is perfectly capable of running behind a firewall.

The dockerfile is built on a versioned [Rocker](https://www.rocker-project.org/) image and installs R packages from daily snapshots at the [MRAN](https://mran.microsoft.com/) (instead of CRAN, which is more current but less reproducible).

<hr>

The repo contains 3 directories:

* /src: contains source R Markdown document for the reporting in question (currently a placeholder - [Cicero's First Catiline Oration](https://en.wikipedia.org/wiki/Catiline_Orations#Oratio_in_Catilinam_Prima_in_Senatu_Habita) in Czech translation) + latex_template.tex for a somewhat tidier output than the LaTeX default allows
* /R: a placeholder directory for helper R scripts, to be sourced from R Markdown files at build time as required
* /output: target directory for the final output

In addition the project root contains two files:

* Dockerfile for building the docker image; to be run with `docker build -t egon .`
* run_egon.sh for running the docker image; used to run the `egon` docker image at port 8787 as technical `rstudio` user, sidestepping the need for authorization and linking the /output sub-directory of current working directory to the /output directory of the docker image.

<hr>

A fun fact: the image is named after *Der Rasende Reporter* Egon Erwin Kisch, famous (among other things) for reporting on the Golem of Prague and [failing a dictation test in Gaelic](https://en.wikipedia.org/wiki/Attempted_exclusion_of_Egon_Kisch_from_Australia#Dictation_test) - a non-negotiable requirement for entering Australia.
