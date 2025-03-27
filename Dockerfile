FROM eclipse-temurin:17-jre-alpine AS main
WORKDIR /app
COPY target/demo-0.0.1-SNAPSHOT.jar /app/myapp.jar
CMD java -jar myapp.jar & tail -f /dev/null
