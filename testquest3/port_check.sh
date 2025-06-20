#!/bin/bash

host=$1
port=$2

if timeout 1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null; then
    echo "✅ $host:$port доступен"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $host:$port недоступен" >> port_check.log
    echo "❌ $host:$port недоступен - записано в лог"
fi
