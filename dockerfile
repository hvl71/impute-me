#https://towardsdatascience.com/how-to-dockerize-an-r-shiny-app-part-1-d4267659312a
#https://www.bjoern-hartmann.de/post/learn-how-to-dockerize-a-shinyapp-in-7-steps/

#1/ build image:
#docker build -t <some-tag> .

#2/ run image:
#docker run -d -p 8080:80 <some-tag>

#3/ Access site localhost
#http://localhost:8080

FROM nginx
COPY . /usr/share/nginx/html