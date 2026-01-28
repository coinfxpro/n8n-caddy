FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Install any additional tools you might need (e.g., python, requests for custom scripts)
RUN apt-get update && \
    apt-get install -y python3 python3-pip build-essential && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install --no-cache-dir --break-system-packages yfinance pandas ta requests

# Copy scripts
COPY scripts /home/node/scripts
RUN chmod -R 755 /home/node/scripts

USER node
