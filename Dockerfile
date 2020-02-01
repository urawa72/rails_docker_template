FROM ruby:2.6.3
ENV LANG C.UTF-8

# nodejsとrails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN gem install bundler
RUN gem install rails -v '6.0.0'

# 初期設定shell
COPY ./init.sh /usr/bin/
RUN chmod +x /usr/bin/init.sh

WORKDIR /myapp
