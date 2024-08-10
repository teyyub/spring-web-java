
# Use the official Tomcat base image
FROM tomcat:9.0

# Remove the default webapps to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps

# Copy the WAR file to the webapps directory
COPY target/mvc.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080
