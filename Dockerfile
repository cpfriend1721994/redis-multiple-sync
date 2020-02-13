FROM ruby
RUN apt update && \
    apt install -y wget ruby-dev && \
    wget https://github.com/stickermule/rump/releases/download/1.0.0/rump-1.0.0-linux-amd64 && \
    chmod +x rump-1.0.0-linux-amd64 && \
    mv rump-1.0.0-linux-amd64 /usr/local/bin/rump && \
    gem install god
COPY . .
CMD god -c config.god -D