FROM rocker/shiny

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
RUN Rscript -e 'install.packages("tinytex", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN pwd
RUN ls -l
COPY COPASI_web_mat3kk/ /srv/shiny-server/
WORKDIR /srv/shiny-server
RUN ls -l 
WORKDIR overleaf_doc
RUN ls -l
RUN Rscript -e 'require(tinytex); pdflatex("main.tex", pdf_file="www/main.pdf")'
