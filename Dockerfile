# Stage 1: Build the application using Maven with Java 17
FROM maven:3.9.0-eclipse-temurin-17-alpine AS builder
WORKDIR /app
# Copy Maven configuration and source code
COPY pom.xml mvnw* /app
COPY src ./src
# Build the project (skip tests if desired)
RUN mvn wrapper:wrapper
RUN ./mvnw clean package -DskipTests

# Stage 2: Create a runtime image with Java 17
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# Copy the jar file built in the previous stage.
# Replace "myapp.jar" with the name of your jar file generated under target/
COPY --from=builder /app/target/demo-0.0.1-SNAPSHOT.jar myapp.jar
# Run the jar file
CMD ["java", "-jar", "myapp.jar"]
