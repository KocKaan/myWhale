# Multi Stage Build

#Base image and name stage as builder
FROM maven:3-openjdk-11 AS builder

WORKDIR /kaan/app/src/

COPY src ./
COPY pom.xml ../

RUN mvn -f /kaan/app/pom.xml clean package

##2nd stage
FROM openjdk:11.0.15

WORKDIR /kaan/lib/

#Copy the jar from the first stage (builder) to the 2nd stage working directory
COPY --from=builder /kaan/app/target/demo-0.0.1-SNAPSHOT.jar ./sb-dockerized.jar

#Expose the port to the inner container communication
EXPOSE 3100


ENTRYPOINT ["java","-jar","/kaan/lib/sb-dockerized.jar"]






