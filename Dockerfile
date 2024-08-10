
# Stage 1: Build the application
FROM maven:3.8.6-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml ./
COPY src ./src

# Run Maven to build the application
RUN mvn clean install

# Set the working directory
WORKDIR /app

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-alpine


# Copy the WAR file from the build stage
COPY --from=build /app/target/spring-mvc.war /app/spring-mvc.war


# Use the official Tomcat base image
#FROM tomcat:9.0

# Remove the default webapps to avoid conflicts
#RUN rm -rf /usr/local/tomcat/webapps

# Copy the WAR file to the webapps directory
#COPY target/spring-mvc.war /usr/local/tomcat/webapps/spring-mvc.war

# Expose port 8080
EXPOSE 8080

# Run the JAR file
#ENTRYPOINT ["java", "-jar", "/app/your-app-name.war"]