![React Js Next Js Remix Js Tailwind Css website development png](https://github.com/maruffahmed/Delivery-management-system/assets/39343312/ebec87ff-2595-4863-8146-0985301ca262)

# Delivery Management System

### [Demo](https://dpdms.up.railway.app/)

Demo credential

```
Merchant panel
email: maruffamd@gmail.com
password: 123456

Admin panel
URLpath: /admin
email: admin@gmail.com
password:123456

Package handler panel (Pickup man)
URLpath: /packagehandler
email: reyad@gmail.com
password:123456

Package handler panel (Delivery man)
URLpath: /packagehandler
email: tushar@gmail.com
password:123456
```

## Quick Start with Docker 🐳

The fastest way to get the Delivery Management System running is with Docker. This approach requires no local Node.js installation or manual database setup.

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) (v20.10 or higher)
- [Docker Compose](https://docs.docker.com/compose/install/) (v2.0 or higher)

### Quick Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/maruffahmed/Delivery-management-system.git
   cd Delivery-management-system
   ```

2. **Run the setup script:**
   
   **For Windows:**
   ```cmd
   docker\scripts\setup.bat
   ```
   
   **For Linux/macOS:**
   ```bash
   chmod +x docker/scripts/setup.sh
   ./docker/scripts/setup.sh
   ```

3. **Access the application:**
   - **Frontend:** http://localhost:3000
   - **Backend API:** http://localhost:8000
   - **Database:** localhost:3306

That's it! The script will automatically:
- Build all Docker containers
- Set up the MySQL database
- Run database migrations
- Seed the database with initial data
- Start all services

### Docker Management Commands

```bash
# Start all services
docker-compose -f compose.yml up -d

# Stop all services
docker-compose -f compose.yml down

# View logs
docker-compose -f compose.yml logs -f

# Rebuild containers (after code changes)
docker-compose -f compose.yml up --build -d

# Reset database (removes all data)
docker-compose -f compose.yml down -v
docker-compose -f compose.yml up -d
```

### Services Overview

| Service | Container Name | Port | Description |
|---------|---------------|------|-------------|
| Frontend | delivery-frontend | 3000 | Remix.js web application |
| Backend | delivery-backend | 8000 | NestJS API server |
| Database | delivery-db | 3306 | MySQL 8.0 database |

### Environment Configuration

The Docker setup includes preconfigured environment files:
- `backend/.env.docker` - Backend environment variables
- `frontend/.env.docker` - Frontend environment variables

These files are automatically copied to `.env` files during setup. You can modify them for custom configurations.

### Troubleshooting Docker Setup

**Issue: Port already in use**
```bash
# Check what's using the port
netstat -an | grep :3000
# Stop the conflicting service or change ports in docker-compose.yml
```

**Issue: Database connection failed**
```bash
# Check if database container is running
docker-compose -f compose.yml ps
# View database logs
docker-compose -f compose.yml logs database
```

**Issue: Frontend/Backend not accessible**
```bash
# Check container status
docker-compose -f compose.yml ps
# View service logs
docker-compose -f compose.yml logs frontend
docker-compose -f compose.yml logs backend
```

## Manual Setup (Alternative)

If you prefer not to use Docker, you can set up the project manually:

### Prerequisites

You need [Node JS](https://nodejs.org) (v18.x.x) installed on your local machine.

### Installing ⚙️

Run the following command to install all the packages:

```sh
npm run setup
```

#### Setup Environment Variable

Set the following environment variable to `backend` directory. Also, an example file is given with the name of `.env.example`:

```
PORT = 8000
DATABASE_URL = "mysql://root:password@localhost:3306/delivery"
JWT_SECRET = 'ANYTHING_YOU_LIKE'
BCRYPT_SALT_OR_ROUNDS = "10"
```

Set the following environment variable to `frontend` directory. Also, an example file is given with the name of `.env.example`:

```
SESSION_SECRET = "dearMj"
API_BASE_URL = "http://localhost:8000"
```

### Database Migration 💿

Run the following command to migrate the prisma schema:

```sh
npm run prisma:migrate
```

You only have to run this for only one time at the beginning of project setup

#### Seed Database 🌱

Run the following command to seed your database with some preset dataset. It includes delivery area info (Division, Districs, Areas), Delivery zones, Parcel pricing (for 0.5KG, 1KG, 2KG, 3KG, 4KG, 5KG), Parcel products categories, Shop products categories, a default user and admin, etc.

```sh
cd backend
npm run seed
```

#### Run 🏃🏻‍♂️

By this command your app and server will be run concurrently

```sh
npm start
```

An server will be run at http://localhost:8000 <br/>
And frontend server will be run at http://localhost:3000

## Screenshots

![screencapture-localhost-3000-dashboard-2023-06-01-12_32_30](https://github.com/maruffahmed/Delivery-management-system/assets/39343312/ccfabd6d-d373-48a7-be38-f972f5b87f55)
![screencapture-localhost-3000-create-parcel-2023-06-01-12_39_06](https://github.com/maruffahmed/Delivery-management-system/assets/39343312/7f66aaac-773e-4119-94fe-1678f8eba033)
![screencapture-localhost-3000-parcel-list-2023-06-01-12_39_44](https://github.com/maruffahmed/Delivery-management-system/assets/39343312/00bea019-8104-4ded-aa21-64e77a98c8cb)
![screencapture-localhost-3000-parcel-tracking-2023-06-01-12_38_51](https://github.com/maruffahmed/Delivery-management-system/assets/39343312/7aef905c-c465-4485-9f31-ed575910e101)
![screencapture-localhost-3000-payments-list-2023-06-01-12_39_52](https://github.com/maruffahmed/Delivery-management-system/assets/39343312/3c69f6cc-7e6d-4cf0-a806-4922c6da8b7d)
![screencapture-localhost-3000-shop-list-2023-06-01-12_39_59](https://github.com/maruffahmed/Delivery-management-system/assets/39343312/13e29ab3-26f4-4d2a-977b-b5af724d3752)
![screencapture-localhost-3000-shop-list-2023-06-01-12_40_11](https://github.com/maruffahmed/Delivery-management-system/assets/39343312/442cd9fb-8558-44ff-8013-1388e32f8584)
![screencapture-localhost-3000-settings-password-2023-06-01-12_40_33](https://github.com/maruffahmed/Delivery-management-system/assets/39343312/a1017fd5-d649-4c92-92fb-cbde1d49090c)

## Built With 🏗️👷🏻

-   [NodeJs](https://nodejs.org/en/) - Node.js® is an open-source, cross-platform JavaScript runtime environment.
-   [NestJs](https://nestjs.com/) - A progressive Node.js framework for building efficient, reliable and scalable server-side applications.
-   [Prisma](https://nestjs.com/) - Next-generation Node.js and TypeScript ORM
-   [Remix](https://remix.run/) - Remix is a full stack web framework
-   [Tailwind CSS](https://tailwindcss.com/) - A utility-first CSS framework packed with classes
-   [Chakra UI](https://chakra-ui.com/) - Chakra UI is a simple, modular and accessible component library

## Credit

## Authors

-   **Md Maruf Ahmed** - _Software Engineer_
