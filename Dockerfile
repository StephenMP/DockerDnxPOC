FROM microsoft/aspnet:latest

EXPOSE 5000  
ENTRYPOINT ["dnx", "-p", "src/DockerDnxPoc/project.json", "web"]

COPY src/DockerDnxPoc/project.json /app/  
WORKDIR /app  
RUN ["dnu", "restore"]  
COPY . /app 
