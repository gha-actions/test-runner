#!/bin/bash

# config
language=${APP_LANGUAGE:-}

# Run test commands based on the provided language
case $language in
    python)
        # Example: Run Python tests using pytest
        pip install -r requirements.txt
        pytest
        ;;
    node | react | javascript)
        # Install NPM dependencies 📦
        npm install
        # Unit tests 🧪
        npm test -- --coverage
        ;;
    # Add more cases for other languages and frameworks
    *)
        echo "Unsupported language: $language"
        exit 1
        ;;
esac
