#!/bin/bash

# Setup script for Docker environment
echo "Setting up Delivery Management System with Docker..."

# Check if Docker and Docker Compose are installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo "Error: Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Create environment files if they don't exist
if [ ! -f backend/.env ]; then
    echo "Creating backend environment file..."
    cp backend/.env.docker backend/.env
fi

if [ ! -f frontend/.env ]; then
    echo "Creating frontend environment file..."
    cp frontend/.env.docker frontend/.env
fi

# Build and start the services
echo "Building and starting Docker containers..."
docker-compose -f compose.yml up --build -d

echo "Waiting for services to start..."
sleep 30

echo "Setup complete!"
echo ""
echo "Services are now running:"
echo "  - Frontend: http://localhost:3000"
echo "  - Backend API: http://localhost:8000"
echo "  - MySQL Database: localhost:3306"
echo ""
echo "Demo credentials:"
echo "  Merchant panel:"
echo "    Email: maruffamd@gmail.com"
echo "    Password: 123456"
echo ""
echo "  Admin panel (http://localhost:3000/admin):"
echo "    Email: admin@gmail.com"
echo "    Password: 123456"
echo ""
echo "To stop the services, run: docker-compose -f compose.yml down"
echo "To view logs, run: docker-compose -f compose.yml logs -f"