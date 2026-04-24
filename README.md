# CockroachDB on Railway

Single-node CockroachDB template for Railway.

## Defaults

- Auth is documented as opt-in, but the template runs in insecure mode by default for reliability.
- Volume path: `/cockroach/cockroach-data`
- No health check

## Variables

- `COCKROACH_INSECURE` (default: `true`)
- `COCKROACH_DATABASE` (default: `defaultdb`)
- `COCKROACH_PASSWORD` (required only if you build your own secure cert workflow)

## Notes

CockroachDB secure single-node startup needs certs and bootstrap SQL, which is awkward for a minimal Railway template. This version keeps the template small and clearly documents that it is intended for dev use unless you add your own TLS/auth flow.
