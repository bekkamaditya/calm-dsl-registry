#!/usr/bin/env bash
set -euo pipefail

echo "=== Linux Health Check: Disk + CPU + Memory ==="

echo "--- CPU (top snapshot) ---"
if command -v top >/dev/null 2>&1; then
  top -bn1 | head -n 15
else
  echo "top not found"
fi

echo "--- Memory ---"
if command -v free >/dev/null 2>&1; then
  free -h
else
  echo "free not found; showing /proc/meminfo"
  head -n 30 /proc/meminfo || true
fi

echo "--- Disk ---"
df -hT

echo "=== Done ==="