FROM bioconductor/bioconductor_docker:RELEASE_3_17

LABEL maintainer="Victoria Flanary <flanary@uab.edu>"
LABEL description="Container for ..."

##----------------------------------------------------------------------------##
## SYSTEM PACKAGES
##----------------------------------------------------------------------------##

RUN apt-get update --yes && \
  apt-get upgrade --yes

RUN apt-get install --yes \
  python-dev-is-python3 \ 
  python3-pip \
  python3-dev \
  python3-pip \
  python3-tk


RUN apt-get install --yes \
  libcurl4-openssl-dev \
  libssl-dev \
  libcairo2-dev libxt-dev \
  libxml2-dev \
  libudunits2-dev \
  libhdf5-dev \
  libv8-dev \
  libgdal-dev \
  xorg libx11-dev libglu1-mesa-dev \
  samtools libboost-all-dev \
  libgsl-dev

##----------------------------------------------------------------------------##
## PYTHON PACKAGES
##----------------------------------------------------------------------------##

RUN pip3 install

##----------------------------------------------------------------------------##
##  R PACKAGES
##----------------------------------------------------------------------------##

#### General CRAN Packages ####
RUN R -e 'install.packages(c("tidyverse", "remotes",  "BiocManager", "devtools", "knitr", "lintr", "styler", "here", "markdown")
RUN R -e 'install.packages(c("ggfortify", "ggthemes", "ggpubr", "patchwork", "RColorBrewer", "colorspace"))'

#### Project Specific CRAN Packages ####
RUN R -e 'install.packages(c())'

##----------------------------------------------------------------------------##
## GitHub Packages
##----------------------------------------------------------------------------##

RUN R -e 'devtools::install_github()'
