# Etapa 1: Compilación con Gradle
FROM gradle:7.6-jdk21 AS builder
WORKDIR /app
COPY . .
RUN gradle bootJar --no-daemon

# Etapa 2: Ejecución con Temurin OpenJDK 21
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /app/build/libs/discografia-1.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]