#https://hub.docker.com/r/rocker/shiny/
#https://towardsdatascience.com/how-to-dockerize-an-r-shiny-app-part-1-d4267659312a
#https://www.bjoern-hartmann.de/post/learn-how-to-dockerize-a-shinyapp-in-7-steps/

#1/ build image:
#docker build -t impute-me:v0.0.1 .

#2/ run image:
#as deamon:
#docker run -d -p 3838:3838 impute-me:v0.0.1
#in inter-active mode:
#docker run --rm -p 3838:3838 impute-me:v0.0.1

#3/ Access site localhost
#http://localhost:3838

#Issues
#https://github.com/rstudio/shiny/issues/1929

#Look at root@e271f73656ce:/srv/shiny-server/imputeme# cat server_setup.R (from within the container)

#consider multistage build

FROM rocker/shiny
COPY . //srv/shiny-server/
RUN mkdir -p ~//srv/misc_files

RUN mkdir -p //srv/shiny-server/impute_dir
WORKDIR //srv/shiny-server/impute_dir

#get impute2
RUN wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz
RUN gunzip impute_v2.3.2_x86_64_static.tgz
RUN tar -xvf impute_v2.3.2_x86_64_static.tar



#get the reference from 1kgenomes
RUN wget https://mathgen.stats.ox.ac.uk/impute/ALL_1000G_phase1integrated_v3_impute.tgz
RUN gunzip ALL_1000G_phase1integrated_v3_impute.tgz
RUN tar xf ALL_1000G_phase1integrated_v3_impute.tar
RUN rm ALL_1000G_phase1integrated_v3_impute.tar 
RUN wget https://mathgen.stats.ox.ac.uk/impute/ALL_1000G_phase1integrated_v3_annotated_legends.tgz
RUN gunzip ALL_1000G_phase1integrated_v3_annotated_legends.tgz
RUN tar xf ALL_1000G_phase1integrated_v3_annotated_legends.tar
RUN rm ALL_1000G_phase1integrated_v3_annotated_legends.tar 
RUN mv ALL_1000G_phase1integrated_v3_annotated_legends/* ALL_1000G_phase1integrated_v3_impute/
RUN rmdir ALL_1000G_phase1integrated_v3_annotated_legends
