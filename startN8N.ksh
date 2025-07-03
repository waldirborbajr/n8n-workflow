#!/usr/bin/env bash

ADDR=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "[-.0-9a-z]*\.ngrok-free.app")

# Check if ADDR was found
if [ -z "$ADDR" ]; then
  echo "ngrok not started."
  exit 1
fi

# echo "https://"${ADDR}
# exit

export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
export N8N_RUNNERS_ENABLED=true
export N8N_PROTOCOL=https
export N8N_HOST=${ADDR}
export WEBHOOK_URL=https://${ADDR}

# echo ${WEBHOOK_URL}
# exit

npx n8n
