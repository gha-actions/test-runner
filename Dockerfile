# Use a base image that has the necessary tools for running the shell script
FROM alpine:latest as builder

ARG APP_LANGUAGE=python

# Copy the necessary Dockerfiles into the build stage
COPY Dockerfile.node Dockerfile.node
COPY Dockerfile.python Dockerfile.python

# Run the shell script to determine the Dockerfile and image name
RUN if [ "$APP_LANGUAGE" = "node" ]; then \
      echo "Using Dockerfile.node"; \
      cp Dockerfile.node Dockerfile; \
      export IMAGE_NAME="my-node-app"; \
    elif [ "$APP_LANGUAGE" = "python" ]; then \
      echo "Using Dockerfile.python"; \
       cp Dockerfile.python Dockerfile; \
      export IMAGE_NAME="my-python-app"; \
    else \
      echo "Invalid app language specified: $APP_LANGUAGE"; \
      exit 1; \
    fi

# Export APP_LANGUAGE environment variable for use in entrypoint.sh
ENV APP_LANGUAGE=${APP_LANGUAGE}

# Use the selected Dockerfile to build the application
FROM builder as final

# Optionally, you may need to copy files or perform other setup steps here, based on your Dockerfiles for node and python.

# Copy the entrypoint script into the container (uncomment if needed)
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

# Run the entrypoint script when the container starts (uncomment if needed)
#ENTRYPOINT ["/entrypoint.sh"]
