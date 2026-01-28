FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Install any additional tools you might need (e.g., python, requests for custom scripts)
RUN apk add --update --no-cache python3 py3-pip build-base && \
    pip3 install --no-cache-dir yfinance pandas ta requests

# Copy scripts
COPY scripts /home/node/scripts
RUN chmod -R 755 /home/node/scripts

USER node
