# Use a base image with common tools (you might need to expand this)
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /github/workspace

# Install necessary tools, dependencies, or language runtimes here
RUN apt update && \
    apt install -y python3 python3-pip nodejs npm
    
# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run the entrypoint script when the container starts
ENTRYPOINT ["/entrypoint.sh"]
