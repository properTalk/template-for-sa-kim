FROM cepgbaseacr.azurecr.io/docker.io/openjdk:17-slim

WORKDIR /app

COPY ./mvnw ./mvnw
COPY ./pom.xml ./pom.xml
COPY ./src ./src

RUN chmod +x ./mvnw

RUN ./mvnw package -DskipTests

RUN chmod +x ./target/template-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "./target/template-0.0.1-SNAPSHOT.jar"]