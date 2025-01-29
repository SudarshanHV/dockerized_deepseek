FROM python:3.11-slim

# Install necessary system dependencies
RUN apt-get update && apt-get install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Copy your application code and entrypoint script into the container
COPY . /app
COPY ./entrypoint.sh /entrypoint.sh

# Set the working directory
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Expose the necessary port
EXPOSE 11434

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
