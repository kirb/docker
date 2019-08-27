FROM ubuntu:18.04

COPY build.sh /

RUN chmod +x /build.sh && /build.sh

CMD dnsmasq -d
