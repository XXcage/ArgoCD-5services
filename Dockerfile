#builder

FROM eclipse-temurin:20.0.1_9-jdk-alpine as builder

WORKDIR /app
COPY . .

#Run “./mvnw package” to build the artifact
RUN ./mvnw package

FROM eclipse-temurin:17-jdk-alpine as runtime

WORKDIR /code
COPY --from=builder /app/target/*.jar /code
RUN chmod a+rx /code -R

#Make sure your CMD is:  java -jar code/*.jar
CMD ["java", "-jar", "/code/spring-petclinic-3.1.0-SNAPSHOT.jar"]
