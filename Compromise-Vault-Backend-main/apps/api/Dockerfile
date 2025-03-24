FROM node:18-alpine AS base

# Install necessary dependencies for Prisma
RUN apk add --no-cache openssl

WORKDIR /app

# Copy package files first for better caching
COPY package.json ./

# Install dependencies
RUN npm install

# Generate Prisma client before copying the rest of the app
COPY prisma ./prisma/
RUN npx prisma generate

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Create directory for assets/keys
RUN mkdir -p assets/keys

# Expose the port the app runs on
EXPOSE 3001

# Command to run the application
CMD ["npm", "start"]