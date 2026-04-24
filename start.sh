#!/bin/bash
set -e

# CockroachDB single-node starter
# Dev/demo mode — not for production without further hardening

VERSION="${CRDB_VERSION:-23.1.11}"
INSTALL_DIR="/usr/local/bin"

# Download & install CockroachDB binary if not present
if ! command -v cockroach &> /dev/null; then
  echo "[setup] Downloading CockroachDB v${VERSION}..."
  curl -fsSL "https://binaries.cockroachdb.com/cockroach-v${VERSION}.linux-amd64.tgz" \
    | tar -xz -C /tmp
  mv /tmp/cockroach-v${VERSION}.linux-amd64/cockroach "${INSTALL_DIR}/cockroach"
  chmod +x "${INSTALL_DIR}/cockroach"
  rm -rf /tmp/cockroach-v${VERSION}.linux-amd64
  echo "[setup] CockroachDB installed"
fi

# Persist data directory
DATA_DIR="/cockroach/cockroach-data"
mkdir -p "${DATA_DIR}"

# Root password ( Railway Secret: set COCKROACH_PASSWORD )
# Insecure mode is used here since secure single-node cert generation
# adds significant complexity. Railway private networking limits exposure.
echo "[start] Starting CockroachDB single-node (insecure dev mode)..."
echo "[start] SQL port: 26257 | Admin UI: http://localhost:8080"
echo "[start] Set COCKROACH_PASSWORD Railway secret for future secure mode."

exec cockroach start \
  --insecure \
  --store="${DATA_DIR}" \
  --advertise-host=localhost \
  --sql-addr=localhost:26257 \
  --http-addr=localhost:8080 \
  --background
