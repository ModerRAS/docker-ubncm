FROM alpine:3.11

WORKDIR /opt

RUN wget https://github.com/cnsilvan/UnblockNeteaseMusic/releases/download/0.2.0/UnblockNeteaseMusic-linux-amd64.zip && \
    unzip UnblockNeteaseMusic-linux-amd64.zip && \
    mv UnblockNeteaseMusic /usr/local/bin/ && \
    chmod +x /usr/local/bin/UnblockNeteaseMusic && \
    rm -rf UnblockNeteaseMusic-linux-amd64.zip && \
    bash createCertificate.sh 
    
    
ENTRYPOINT ["/usr/local/bin/UnblockNeteaseMusic"]
CMD ["-c", "/opt/server.crt", "-k", "/opt/server.key"]
