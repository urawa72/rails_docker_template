FROM ruby:2.6.3
ENV LANG C.UTF-8

# nodejsとbundler
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN gem install bundler

# rails準備
WORKDIR /tmp
COPY ./init.sh init.sh
RUN chmod +x /tmp/init.sh
COPY ./src/Gemfile Gemfile
COPY ./src/Gemfile.lock Gemfile.lock
RUN bundle install
ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# コンテナ起動後の初期処理実行
CMD ["/tmp/init.sh"]
