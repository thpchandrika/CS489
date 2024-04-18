#use jdk base images
#create a folder inside container
#copy executable folder into container
#set the working directory
#define command to run

FROM openjdk:17
RUN mkdir /app
COPY target/helloworlddocker-1.0-SNAPSHOT.jar /app
WORKDIR /app
CMD ["java", "-jar", "./helloworlddocker-1.0-SNAPSHOT.jar"]
