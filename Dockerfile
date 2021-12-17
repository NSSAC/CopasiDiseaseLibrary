FROM ghcr.io/copasi/shiny-copasi:latest

RUN apt-get update
RUN apt-get install --yes build-essential chrpath libssl-dev libxft-dev
RUN apt-get install --yes libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
RUN Rscript -e 'install.packages("tinytex", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'tinytex::install_tinytex()'
RUN Rscript -e 'install.packages("webshot", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'install.packages("wordcloud2", repos="http://cran.r-project.org", dependencies = TRUE)'
RUN Rscript -e 'webshot::install_phantomjs()'
COPY --chown=shiny:shiny COPASI_web_mat3kk/ /srv/shiny-server/
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
WORKDIR /srv/shiny-server/overleaf_doc
RUN Rscript -e 'tinytex::pdflatex("main.tex", pdf_file="../www/dismolib.pdf")'
WORKDIR /srv/shiny-server
RUN sed -i "s/BUILD_TIMESTAMP/$(TZ=":America/New_York" date -Iseconds)/" ui.R
RUN chown -R shiny:shiny /srv/shiny-server
