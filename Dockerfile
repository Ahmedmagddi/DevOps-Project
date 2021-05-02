FROM centos:7
WORKDIR /app
COPY . /app
RUN yum -y install maven
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el7_9.x86_64/jre" >> ~/.bash_profile
RUN echo "export PATH=$JAVA_HOME/jre/bin:$PATH" >> ~/.bash_profile
EXPOSE 8080
RUN ["chmod", "+x", "mvnw"]
RUN source ~/.bash_profile && ./mvnw clean verify
RUN ["chmod", "+x", "/app/start-app.sh"]
ENTRYPOINT ["/app/start-app.sh"]
