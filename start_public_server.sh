#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

if [ -z "${NGROK_AUTHTOKEN:-}" ]; then
  echo "NGROK_AUTHTOKEN is not set. Export it first:"
  echo "export NGROK_AUTHTOKEN='your_token_here'"
  exit 1
fi

./ngrok authtoken "$NGROK_AUTHTOKEN"
nohup ./ngrok tcp 25565 --region eu > /tmp/mc_ngrok.log 2>&1 &

cd minecraft_server
./run.sh
