# Compromise Vault

A secure platform for managing and distributing compromised SSH keys.

## Docker Deployment Guide

### 1. Running with Docker Compose

The simplest way to run the entire application stack:

```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f
```

### 2. Running Individual Containers

Alternatively, you can run each service separately using Docker run:

```bash
# Create a network
docker network create compromise-vault-network

# Start PostgreSQL
docker run -d \
  --name compromise-vault-db \
  --network compromise-vault-network \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=compromise_vault \
  -v postgres_data:/var/lib/postgresql/data \
  -p 5432:5432 \
  postgres:14-alpine

# Start API
docker run -d \
  --name compromise-vault-api \
  --network compromise-vault-network \
  -e APP_ENV=production \
  -e APP_PORT=3001 \
  -e DATABASE_URL=postgresql://postgres:postgres@compromise-vault-db:5432/compromise_vault?schema=public \
  -v ./Compromise-Vault-Backend-main/apps/api/assets:/app/assets \
  -p 3001:3001 \
  compromise-vault-api

# Start Web
docker run -d \
  --name compromise-vault-web \
  --network compromise-vault-network \
  -e VITE_APP_URL=http://localhost:80 \
  -e VITE_API_URL=http://localhost:3001 \
  -p 80:80 \
  compromise-vault-web
```

### 3. Publishing to Docker Hub

To make your images available on Docker Hub:

```bash
# Build images with your Docker Hub username
docker build -t username/compromise-vault-api ./Compromise-Vault-Backend-main/apps/api
docker build -t username/compromise-vault-web ./Compromise-Vault-main/apps/web

# Push to Docker Hub
docker push username/compromise-vault-api
docker push username/compromise-vault-web
```

### 4. AWS ECS Deployment

1. Create an ECS cluster
2. Create task definitions for each service:
   - compromise-vault-db
   - compromise-vault-api
   - compromise-vault-web
3. Configure security groups and load balancers
4. Create ECS services using the task definitions

Key configurations:

- Use Application Load Balancer for web service
- Configure environment variables in task definitions
- Set up service discovery for inter-service communication
- Use EFS for persistent storage (API assets)
- Use RDS instead of container for production database
