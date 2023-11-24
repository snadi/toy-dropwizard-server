# Get the Gradle image so we can build JAR file first
FROM gradle:8.4.0-jdk21-alpine AS build

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle wrapper
RUN ./gradlew shadowJar

FROM openjdk:21

WORKDIR /app
COPY --from=build /home/gradle/src/build/libs/hello-friends-1.0-SNAPSHOT-all.jar /app
COPY hello-world.yml /app

# "EXPOSE" only exposes the container's port to be visible to others, but not to host.
# We will map ports inside docker-compose.yml
EXPOSE 8085
EXPOSE 8081

CMD ["java", "-jar","hello-friends-1.0-SNAPSHOT-all.jar","server","hello-world.yml"]

