
## Environment Setup

1. NodeJS minimum version 18.
2. Install pnpm:
   ```bash
   npm install -g pnpm
   ```
3. Create `.env` files in `apps/api` and `apps/web` with appropriate environment variables.

## Database Sync

In the `apps/api` directory, sync the database schema with the following command:
```bash
pnpm db:push
```

## Installation

In the project root, install all dependencies:
```bash
pnpm install
```

## Development

### Backend API

To start the backend API server:
```bash
pnpm -F @compromise-vault/api start

# Alternative
make api-dev

# Alternative
cd apps/api
pnpm dev
```

## Database Schema

### Table: SSHKeys

| Column Name          | Data Type                   | Max Length | Default           | Nullable |
|----------------------|-----------------------------|------------|-------------------|----------|
| id                   | serial                      | -          | -                 | NO       |
| privKey              | text                        | -          | null              | YES      |
| pubKey               | text                        | -          | null              | YES      |
| keyType              | character varying           | 255        | null              | YES      |
| ipAddress            | character varying           | 255        | null              | YES      |
| userAgent            | text                        | -          | null              | YES      |
| submissionDate       | timestamp without time zone | -          | CURRENT_TIMESTAMP | YES      |
| referer              | text                        | -          | null              | YES      |
| fingerprintValidated | boolean                     | -          | null              | YES      |

### Table Creation Script:

```sql
CREATE TABLE SSHKeys (
    id SERIAL PRIMARY KEY,
    privKey TEXT NULL,
    pubKey TEXT NULL,
    keyType CHARACTER VARYING(255) NULL,
    ipAddress CHARACTER VARYING(255) NULL,
    userAgent TEXT NULL,
    submissionDate TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP NULL,
    referer TEXT NULL,
    fingerprintValidated BOOLEAN NULL,
    fingerprint TEXT NOT NULL
);


```


