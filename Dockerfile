FROM cadcuceus/cmp-chain-full-node:1.0.1

# Install ca-certificates
RUN apk add --no-cache --update ca-certificates py3-setuptools supervisor wget lz4 gzip

# Temp directory for copying binaries
RUN mkdir -p /tmp/bin
WORKDIR /tmp/bin


#WORKDIR $GAIAD_HOME

# Expose ports
EXPOSE 26656 26657 26658
EXPOSE 8545

# Add entrypoint script
COPY ./scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./fullnode /tmp
RUN chmod u+x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

STOPSIGNAL SIGINT
