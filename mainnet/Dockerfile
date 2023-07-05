FROM  caduceus/cmp-chain-block-node:1.0.1

# Expose ports
EXPOSE 26656 26657 26658
EXPOSE 8545

# Add entrypoint script
COPY ./scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./mainnet-config /tmp
RUN chmod u+x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

STOPSIGNAL SIGINT
