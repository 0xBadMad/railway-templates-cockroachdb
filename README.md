# CockroachDB — Railway Template

Single-node CockroachDB cluster for development and prototyping on Railway.

## Ports

| Service    | Port |
|------------|------|
| SQL        | 26257 |
| Admin UI   | 8080  |

## Setup

1. **Provision → Deploy** — Railway auto-detects `nixpacks.toml` and installs CockroachDB.
2. **Set secret** — Add `COCKROACH_PASSWORD` in Railway Variables (required for secure mode upgrade path).
3. **Connect** — Link your app service or use the Admin UI at port 8080.

## Secure Mode (Production)

This template runs `--insecure` for simplicity. To upgrade:

```bash
cockroach cert create-cluster \
  --certs-dir=/cockroach/cockroach-data/certs \
  --ca-key=/cockroach/cockroach-data/ca.key \
  --node-addr=localhost:26257
```

Then remove `--insecure` from `start.sh` and set:
```bash
export COCKROACH_CERTS_DIR=/cockroach/cockroach-data/certs
export COCKROACH_PASSWORD=your-secret
```

## Volume

Data persists at `/cockroach/cockroach-data` — backed by Railway's persistent volumes.

## Connect from another Railway service

```bash
DATABASE_URL="postgresql://root@cockroach:26257/defaultdb?sslmode=disable"
```

> Note: Replace `cockroach` with your service name. `sslmode=disable` is for insecure mode.

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `CRDB_VERSION` | `23.1.11` | CockroachDB release version |
| `COCKROACH_PASSWORD` | _(set in Railway)_ | Root password (future secure mode) |
