#!/usr/bin/env bash
# scripts/sysinfo.sh - prints basic system info

echo "===== System Information ====="
echo "Current user: $(whoami)"
echo "Date: $(date)"
echo ""
echo "===== Disk Usage (human) ====="
df -h
echo ""
echo "===== End ====="
