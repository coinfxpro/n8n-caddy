FROM naskio/n8n-python:latest

# Copy scripts
COPY scripts /home/node/scripts
RUN chmod -R 755 /home/node/scripts
