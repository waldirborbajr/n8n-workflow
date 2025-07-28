#!/usr/bin/env bash

ADDR=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "[-.0-9a-z]*\.ngrok-free.app")

# Check if ADDR was found
if [ -z "$ADDR" ]; then
  echo "ngrok not started."
  exit 1
fi

export N8N_HOST=${ADDR}

npx n8n
