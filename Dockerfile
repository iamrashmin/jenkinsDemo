FROM openjdk:17
EXPOSE 8080
ADD target/docker-jenkins-demo.jar docker-jenkins-demo.jar
ENTRYPOINT ["java", "-jar", "/docker-jenkins-demo.jar"]