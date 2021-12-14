 # syntax=docker/dockerfile:1
FROM rocker/verse:4.1.2

# other required packages; standard versions suffice... + Fira Code font
RUN apt-get update && apt-get install -y \
    libudunits2-dev \
    libxml2-dev \
    libv8-dev \ 
    libjq-dev \
    libprotobuf-dev \
    protobuf-compiler \
    fonts-firacode
    
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
 RUN R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-06-30')); install.packages(c('markdown'))"
