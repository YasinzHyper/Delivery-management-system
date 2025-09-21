@echo off
echo Setting up Delivery Management System with Docker...

REM Check if Docker is installed
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Docker is not installed. Please install Docker first.
    exit /b 1
)

REM Check if Docker Compose is installed
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    docker compose version >nul 2>&1
    if %errorlevel% neq 0 (
        echo Error: Docker Compose is not installed. Please install Docker Compose first.
        exit /b 1
    )
)

REM Create environment files if they don't exist
if not exist "backend\.env" (
    echo Creating backend environment file...
    copy "backend\.env.docker" "backend\.env"
)

if not exist "frontend\.env" (
    echo Creating frontend environment file...
    copy "frontend\.env.docker" "frontend\.env"
)

REM Build and start the services
echo Building and starting Docker containers...
docker-compose -f compose.yml up --build -d

echo Waiting for services to start...
timeout /t 30 /nobreak >nul

echo Setup complete!
echo.
echo Services are now running:
echo   - Frontend: http://localhost:3000
echo   - Backend API: http://localhost:8000
echo   - MySQL Database: localhost:3306
echo.
echo Demo credentials:
echo   Merchant panel:
echo     Email: maruffamd@gmail.com
echo     Password: 123456
echo.
echo   Admin panel (http://localhost:3000/admin):
echo     Email: admin@gmail.com
echo     Password: 123456
echo.
echo To stop the services, run: docker-compose -f compose.yml down
echo To view logs, run: docker-compose -f compose.yml logs -f