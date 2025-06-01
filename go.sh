#!/bin/bash

# Prompt for project name
read -p "Enter your project name: " PROJECT_NAME

# Check if input is empty
if [ -z "$PROJECT_NAME" ]; then
  echo "Project name cannot be empty."
  exit 1
fi

# Define the root directory
ROOT_DIR="$PROJECT_NAME"

# Create the root directory
mkdir -p "$ROOT_DIR"
cd "$ROOT_DIR" || exit 1

# Create main directory structure
mkdir -p \
    cmd/api \
    internal/{app,config,domain/{models,services},infrastructure/{database,auth,repositories},interfaces,handlers/middleware} \
    pkg/{logger,utils} \
    scripts/{migrations,seed} \
    test/{integration,unit,mocks} \
    api/swagger \
    web/{templates,static} \
    deployments/{docker,kubernetes} \
    docs

# Create initial files
touch cmd/api/main.go \
    internal/app/server.go \
    internal/config/config.go \
    internal/domain/models/types.go \
    internal/domain/services/payment_service.go \
    internal/infrastructure/database/database.go \
    internal/infrastructure/auth/jwt.go \
    internal/infrastructure/repositories/wallet_repository.go \
    internal/interfaces/repositories/wallet_repository_interface.go \
    internal/handlers/api_handler.go \
    internal/handlers/middleware/auth_middleware.go \
    pkg/logger/logger.go \
    pkg/utils/helpers.go \
    api/swagger/swagger.yaml \
    docs/API.md \
    .env.example \
    .gitignore \
    README.md \
    go.mod \
    go.sum

# Replace placeholders with actual project name in generated files
# Use heredocs with "$PROJECT_NAME" where needed
# Example:
cat <<EOF > cmd/api/main.go
package main

func main() {
	// Start your Gin server here
	println("Starting $PROJECT_NAME API...")
}
EOF

# Repeat the same replacement technique (`cat <<EOF`) for other key files
# You can also use `sed -i` later in files if placeholder replacement is needed
