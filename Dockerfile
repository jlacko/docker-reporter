# syntax=docker/dockerfile:1
FROM rocker/verse:4.1.2

# packages required for the 3 spatial libraries
RUN apt-get update && apt-get install -y \
    libsqlite3-dev\
    sqlite3 
    
RUN ldconfig

# the big three spatial dependencies from source (takes about forever; should be on top of the dockerfile)

# PROJ
RUN cd \
	&& wget http://download.osgeo.org/proj/proj-8.0.0.tar.gz \
	&& tar zxvf proj-8.0.0.tar.gz  \
	&& cd proj-8.0.0/ \
	&& ./configure \
	&& make -j4 \
	&& make install

# GDAL	
RUN	cd \
	&& wget http://download.osgeo.org/gdal/3.2.2/gdal-3.2.2.tar.gz \
	&& tar zxvf gdal-3.2.2.tar.gz  \
	&& cd gdal-3.2.2 \
	&& ./configure \
	&& make -j4 \
	&& make install
	
# GEOS
RUN	cd \
	&& wget http://download.osgeo.org/geos/geos-3.9.1.tar.bz2 \
	&& bunzip2  geos-3.9.1.tar.bz2  \
	&& tar xvf geos-3.9.1.tar  \
	&& cd geos-3.9.1 \
	&& ./configure \
	&& make -j4 \
	&& make install
	
# other required packages; standard versions suffice... + necessary fonts
RUN apt-get update && apt-get install -y \
    libudunits2-dev \
    libxml2-dev \
    libv8-dev \ 
    libjq-dev \
    libprotobuf-dev \
    protobuf-compiler \
    fonts-firacode \
    fonts-roboto
    
RUN ldconfig


# install required LaTeX packages
RUN tlmgr update --self && \
    tlmgr install babel-english && \
    tlmgr install fancyhdr && \
    tlmgr install euenc && \
    tlmgr install fontspec && \
    tlmgr install iftex && \
    tlmgr install tipa && \
    tlmgr install xunicode && \
    tlmgr install titling && \
    tlmgr install roboto && \
    tlmgr install auxhook && \
    tlmgr install bigintcalc && \
    tlmgr install bitset && \
    tlmgr install etexcmds && \
    tlmgr install gettitlestring && \
    tlmgr install hycolor && \
    tlmgr install hyperref && \
    tlmgr install intcalc && \
    tlmgr install kvdefinekeys && \
    tlmgr install kvsetkeys && \
    tlmgr install letltxmacro && \
    tlmgr install ltxcmds && \
    tlmgr install pdfescape && \
    tlmgr install refcount && \
    tlmgr install rerunfilecheck && \
    tlmgr install stringenc && \
    tlmgr install uniquecounter && \
    tlmgr install zapfding && \
    tlmgr install pdftexcmds && \
    tlmgr install infwarerr && \
    tlmgr install kvoptions && \
    tlmgr install geometry && \
    tlmgr install booktabs && \
    tlmgr install multirow && \
    tlmgr install xcolor && \
    tlmgr install colortbl && \
    tlmgr install wrapfig && \
    tlmgr install float && \
    tlmgr install pdflscape && \
    tlmgr install varwidth && \
    tlmgr install threeparttable && \
    tlmgr install etoolbox && \
    tlmgr install fancyvrb && \
    tlmgr install framed  && \
    tlmgr install tabu
    
 # install required R packages
 RUN R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-09-30')); install.packages(c('markdown'))"
 RUN R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-09-30')); install.packages(c('readr', 'dplyr', 'ggplot2', 'knitr',  'kableExtra', 'lubridate', 'extrafont', 'readxl', 'RCzechia', 'DBI', 'RSQLite', 'stringr'))"
 
 # as final step: add required code + tex templates
 COPY /R/* /home/rstudio/R/
 COPY --chown=rstudio:rstudio /src/* /home/rstudio/src/
