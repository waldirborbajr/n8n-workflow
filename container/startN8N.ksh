#!/usr/bin/env bash

ADDR=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "[-.0-9a-z]*\.ngrok-free.app")

# Check if ADDR was found
if [ -z "$ADDR" ]; then
  echo "ngrok not started."
  exit 1
fi

docker volume create   postgres_data
docker volume create   redis_data
docker volume create   n8n_data
docker volume create   letsencrypt_data
docker volume create   chatwoot_data
docker volume create   evolution_data
docker volume create   pgvector_data

sed -i "s/^N8N_HOST=.*/N8N_HOST=$ADDR/" .env

docker compose up --remove-orphans
