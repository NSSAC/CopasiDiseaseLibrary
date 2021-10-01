FROM rocker/shiny:4.0.3

RUN apt-get update
RUN apt-get install --yes libxml2-dev
RUN Rscript -e 'install.packages("shinyjs", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'install.packages("remotes", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'remotes::install_github("jpahle/CoRC")'
RUN Rscript -e 'install.packages("reshape2", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'install.packages("ggplot2", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'install.packages("shinyTree", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'install.packages("formattable", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'install.packages("XML", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'install.packages("DT", repos="http://cran.r-project.org", dependencies = TRUE)'

COPY COPASI_web_mat3kk/ /srv/shiny-server/
