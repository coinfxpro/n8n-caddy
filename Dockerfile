FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Install any additional tools you might need (e.g., python, requests for custom scripts)
RUN apk add --update --no-cache python3 py3-pip build-base

USER node
