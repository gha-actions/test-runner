# Use a base image that has the necessary tools for running the shell script
FROM alpine:latest as builder


ARG APP_LANGUAGE
ENV APP_LANGUAGE=${APP_LANGUAGE}

# Run the shell script to determine the Dockerfile and image name
RUN if [ "$APP_LANGUAGE" = "node" ]; then \
      echo "Using Dockerfile.node"; \
      export DOCKERFILE="Dockerfile.node"; \
      export IMAGE_NAME="my-node-app"; \
    elif [ "$APP_LANGUAGE" = "python" ]; then \
      echo "Using Dockerfile.python"; \
      export DOCKERFILE="Dockerfile.python"; \
      export IMAGE_NAME="my-python-app"; \
    else \
      echo "Invalid app language specified: $APP_LANGUAGE"; \
      exit 1; \
    fi

# Use the selected Dockerfile to build the application
FROM $DOCKERFILE as final

# # Copy the entrypoint script into the container
# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# # Run the entrypoint script when the container starts
# ENTRYPOINT ["/entrypoint.sh"]

