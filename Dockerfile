FROM maven:3-openjdk-17-slim as builder

COPY myapp/ /myapp

WORKDIR /myapp

RUN mvn package

FROM openjdk:17-slim

WORKDIR /myapp

COPY --from=builder /myapp/target/myapp-*.jar /myapp/myapp.jar

CMD [ "java", "-jar", "/myapp/myapp.jar" ]