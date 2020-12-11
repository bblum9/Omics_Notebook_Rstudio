FROM rocker/rstudio:3.6.2

RUN echo "uiPrefs={\"theme\" : \"Cobalt\"}" >> \
  /home/rstudio/.rstudio/monitored/user-settings/user-settings

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libnetcdf-dev \
        libxml2-dev \
        libssl-dev \
        libxt-dev \
        libcairo2-dev \
        pandoc \
        python3 \
        python3-tk \
        r-base-dev \
        && rm -rf /var/lib/apt/lists/*

# Install R libraries
COPY install.R /home/install.R
RUN Rscript home/install.R

RUN R -e "install.packages('ActivePathways')"
RUN R -e "devtools::install_version('openxlsx', version = '4.1.2', repos = 'http://cran.us.r-project.org')"
