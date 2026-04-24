# CockroachDB on Railway

A simple Railway template for CockroachDB using the official image in **single-node insecure mode**.

## Install

1. Deploy this template to Railway.
2. Keep the default volume attached to `/cockroach/cockroach-data`.
3. Open the Admin UI on port `8080`.

## Environment Variables

- `COCKROACH_DATABASE` (default: `defaultdb`)
- `COCKROACH_USER` (default: `root`)
- `COCKROACH_PASSWORD` (unused in insecure mode, kept for future secure setups)

## Ports

- `26257` , SQL / PostgreSQL wire protocol
- `8080` , Admin UI

## Connection String

Use this format:

```text
postgresql://root@<host>:26257/defaultdb?sslmode=disable
```

If you set a non-root user, use:

```text
postgresql://<user>:<password>@<host>:26257/<database>?sslmode=disable
```

## Notes

- This template is intentionally **insecure** for easy Railway deployment and local development.
- For production, CockroachDB should run as a multi-node cluster with TLS.
