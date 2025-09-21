# Use Node.js 18 LTS as base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies for building native modules if needed
RUN apk add --no-cache python3 make g++ openssl

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy Prisma schema first for better caching
COPY prisma ./prisma/

# Generate Prisma client
RUN npx prisma generate

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Expose port
EXPOSE 8000

# Start the application
CMD ["sh", "-c", "echo 'Waiting for database...' && sleep 20 && echo 'Creating database schema...' && npx prisma db push && echo 'Running seed scripts...' && npm run seed && echo 'Starting application...' && npm run start:dev"]