#https://hub.docker.com/r/rocker/shiny/
#https://towardsdatascience.com/how-to-dockerize-an-r-shiny-app-part-1-d4267659312a
#https://www.bjoern-hartmann.de/post/learn-how-to-dockerize-a-shinyapp-in-7-steps/

#1/ build image:
#docker build -t impute-me:v0.0.1 .

#2/ run image:
#docker run -d -p 3838:3838 impute-me:v0.0.1

#3/ Access site localhost
#http://localhost:3838/impute-me

FROM rocker/shiny
COPY . //srv/shiny-server/impute-me