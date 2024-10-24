FROM debian:stable-slim

ARG NET=false
ARG IMAGEMAGICK=false
ARG GDCM=false
ARG DCMTK=false

RUN apt-get update && \
    if [ "$DCMTK" = "true" ]; then \
        apt-get install -y --no-install-recommends dcmtk; \
    fi && \
    if [ "$IMAGEMAGICK" = "true" ]; then \
        apt-get install -y --no-install-recommends imagemagick; \
    fi && \
    if [ "$GDCM" = "true" ]; then \
        apt-get install -y --no-install-recommends gdcm; \
    fi && \
    if [ "$NET" = "true" ]; then \
        apt-get install -y --no-install-recommends curl \
            net-tools iproute2 traceroute mtr \
            nmap wget tcpdump iperf3 socat dnsutils build-essential libssl-dev; \
    if [ "$NET" = "false" ]; then \
        apt-get install -y --no-install-recommends iputils-ping; \
    fi && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/sh"]
