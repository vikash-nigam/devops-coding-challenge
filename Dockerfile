FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENV SPRING_DATASOURCE_URL=jdbc:mysql://springboot-mysql.cdu0wim8ibl6.ap-southeast-1.rds.amazonaws.com:3306/springboot-mysql?createDatabaseIfNotExist=true
ENV SPRING_DATASOURCE_USERNAME=admin
ENV SPRING_DATASOURCE_PASSWORD=Welcome123

ENTRYPOINT ["java", "-jar", "app.jar"]
