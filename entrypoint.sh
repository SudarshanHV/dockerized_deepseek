#!/bin/bash

echo "Starting Ollama server..."
ollama serve &

echo "Waiting for Ollama server to be active..."
while [ "$(ollama list | grep 'NAME')" == "" ]; do
  sleep 1
done

echo "Pulling models..."
ollama pull deepseek-r1:7b

echo "Starting Python service..."
python3 /app/app.py
