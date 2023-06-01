#builder

From eclipse-temurin:20.0.1_9-jdk-alpine as builder

RUN mkdir /app
WORKDIR /app
COPY . .
RUN ./mvnw package

