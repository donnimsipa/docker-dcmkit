FROM debian:stable-slim

ARG NET=false
ARG GDCM=false
ARG DCMTK=false

RUN apt-get update && apt-get install -y --no-install-recommends imagemagick && \
    if [ "$DCMTK" = "true" ]; then \
        apt-get install -y --no-install-recommends dcmtk libssl-dev; \
    fi && \
    if [ "$GDCM" = "true" ]; then \
        apt-get install -y --no-install-recommends libgdcm-tools; \
    fi && \
    if [ "$NET" = "true" ]; then \
        apt-get install -y --no-install-recommends curl \
        net-tools iproute2 traceroute mtr \
        nmap wget tcpdump iperf3 socat dnsutils build-essential libssl-dev; \
    fi && \
    if [ "$NET" = "false" ]; then \
        apt-get install -y --no-install-recommends iputils-ping; \
    fi && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
CMD ["/bin/sh"]