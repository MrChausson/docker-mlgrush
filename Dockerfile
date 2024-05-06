# Use a base image with Java installed
FROM openjdk:21-slim-bullseye

# install unzip dependency
RUN apt-get update && apt-get install -y unzip

# Set the working directory
WORKDIR /app

# Copy the server.zip file to the working directory
COPY server.zip .

# Unzip the server.zip file
RUN unzip server.zip

RUN mv server/* .

# Set the start.sh file as executable
RUN chmod +x start.sh

# Expose the necessary ports for your Minecraft server
EXPOSE 25565

# Set the entrypoint to start the Minecraft server
ENTRYPOINT ["./start.sh"]