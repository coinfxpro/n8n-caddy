FROM alpine:3.19 AS alpine

FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Install any additional tools you might need (e.g., python, requests for custom scripts)
# n8n image doesn't ship with a package manager, so we copy apk from Alpine
COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /lib/ld-musl-*.so* /lib/
COPY --from=alpine /lib/libz.so* /lib/
COPY --from=alpine /lib/libcrypto.so* /lib/
COPY --from=alpine /lib/libssl.so* /lib/
COPY --from=alpine /lib/libapk.so* /lib/
COPY --from=alpine /usr/lib/libcrypto.so* /usr/lib/
COPY --from=alpine /usr/lib/libssl.so* /usr/lib/

RUN apk add --no-cache python3 py3-pip build-base && \
    pip3 install --no-cache-dir yfinance pandas ta requests

# Copy scripts
COPY scripts /home/node/scripts
RUN chmod -R 755 /home/node/scripts

USER node
