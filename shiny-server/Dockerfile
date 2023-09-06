FROM rocker/shiny-verse:latest

# install R package dependencies
RUN apt-get update && apt-get -qq -y install curl \
    libssl-dev \
    libcurl4-openssl-dev \
    ## clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
   
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssh2-1-dev

RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"
RUN R -e "devtools::install_github('andrewsali/shinycssloaders')"
RUN R -e "devtools::install_github('rstudio/httpuv')"
RUN R -e "install.packages('lubridate', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('magrittr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('glue', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DT', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('plotly', repos='http://cran.rstudio.com/')"


# CCS DATIM Libraries
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('plyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('readxl', repos='http://cran.rstudio.com/')"
RUN R -e "devtools::install_github('andrewsali/shinycssloaders')"
RUN R -e "install.packages('dipsaus', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyWidgets', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyalert', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('fs', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyjs', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rlang', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('jsonlite', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('writexl', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('httr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('googledrive', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('callr', repos='http://cran.rstudio.com/')"

## Install packages from CRAN
# RUN install2.r --error \
#     -r 'http://cran.rstudio.com' \
#     googleAuthR \
#     ## install Github packages
#     ## clean up
#     && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
## assume shiny app is in build folder /shiny

## ADD ccs_dhis_datim  /srv/shiny-server/ccs_dhis_datim/
## docker run -d --name shiny-server -p3838:3838 -v /home/agnaldo/R/projects:/srv/shiny-server/  crysiscore/shiny-server:1.0
# RUN rm -rf /srv/shiny-server/sample-apps

# select port
EXPOSE 3838
# run app

# Copy further configuration files into the Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh

RUN chmod -R 755 /usr/bin/shiny-server.sh

CMD ["/usr/bin/shiny-server.sh"]

# Build to Google Cloud 
 #gcloud builds submit --timeout=3600 --tag gcr.io/shiny-server-gcr/shiny-server:1.0  .
 # docker build -t  crysiscore/rsconnect:1.0 .