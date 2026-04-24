#!/usr/bin/env bash
set -euo pipefail

DATA_DIR="/cockroach/cockroach-data"
DB_NAME="${COCKROACH_DATABASE:-defaultdb}"
INSECURE="${COCKROACH_INSECURE:-true}"

mkdir -p "$DATA_DIR"

if [[ "$INSECURE" == "true" ]]; then
  exec cockroach start-single-node \
    --insecure \
    --store="$DATA_DIR" \
    --listen-addr=0.0.0.0:26257 \
    --http-addr=0.0.0.0:8080 \
    --background=false \
    --sql-addr=0.0.0.0:26257 \
    --cache=.25 \
    --max-sql-memory=.25
fi

echo "COCKROACH_INSECURE=false was set, but this minimal template does not ship TLS cert bootstrapping."
echo "Provide your own cert workflow before switching to secure mode."
echo "Starting in insecure compatibility mode instead."

exec cockroach start-single-node \
  --insecure \
  --store="$DATA_DIR" \
  --listen-addr=0.0.0.0:26257 \
  --http-addr=0.0.0.0:8080 \
  --background=false \
  --sql-addr=0.0.0.0:26257 \
  --cache=.25 \
  --max-sql-memory=.25
