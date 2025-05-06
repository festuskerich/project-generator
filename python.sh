#!/bin/bash

# Prompt the user for the project name
read -p "Enter your project name: " PROJECT_NAME

# Check if the folder already exists
if [ -d "$PROJECT_NAME" ]; then
   echo "❌ Error: A folder named '$PROJECT_NAME' already exists!"
   exit 1
fi

# Ensure Python is installed
if ! command -v python3 &>/dev/null; then
    echo "❌ Error: Python3 is not installed. Please install it and try again."
    exit 1
fi

# Create main project directory and subdirectories
mkdir -p "$PROJECT_NAME"/{src,tests,docs,data}

# Navigate into the project folder
cd "$PROJECT_NAME" || exit 1

# Create virtual environment
python3 -m venv env

# Create essential files
touch src/__init__.py  # Make 'src' a package
touch requirements.txt .gitignore README.md config.py

# Populate .gitignore
echo "env/" >> .gitignore
echo "__pycache__/" >> .gitignore
echo "*.pyc" >> .gitignore
echo "*.pyo" >> .gitignore

# Write a simple README.md
echo "# $PROJECT_NAME" > README.md
echo "This is a Python project generated using a Bash script." >> README.md

# Print success message and activation instructions
echo "✅ Project '$PROJECT_NAME' created successfully!"
echo "👉 Now inside '$PROJECT_NAME' folder."
echo "👉 To activate the virtual environment, run: source env/bin/activate"

# Keep the user inside the project directory
exec bash

