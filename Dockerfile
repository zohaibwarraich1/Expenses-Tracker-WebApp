FROM maven:3.9.5-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . ./

RUN mvn clean install -DskipTests=true

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/ExpensesTracker-0.0.1-SNAPSHOT.jar /app/target/ExpensesTracker-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/target/ExpensesTracker-0.0.1-SNAPSHOT.jar"]

