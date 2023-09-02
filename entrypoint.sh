#!/bin/bash

# config
language=${LANGUAGE:-}

# Run test commands based on the provided language
case $language in
    python)
        chmod u+w /github/home/.cache/pip
        apt update
        apt install -y python3-pip
        # Example: Run Python tests using pytest
        sudo -H install -r requirements.txt
        pytest
        ;;
    javascript)
        # Example: Run JavaScript tests using Jest
        npm install
        npm test
        ;;
    # Add more cases for other languages and frameworks
    *)
        echo "Unsupported language: $language"
        exit 1
        ;;
esac
