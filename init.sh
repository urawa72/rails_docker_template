#!/bin/bash

rails new . --force --database=mysql --skip-bundle

# bundle install
bundle install --path vendor/bundle

# yarn & webpacker
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install yarn
bundle exec rails webpacker:install

# database.yml設定
cat config/database.yml | sed 's/password:$/password: root/' | sed 's/host: localhost/host: db/' > __tmpfile__
cat __tmpfile__ > config/database.yml
rm __tmpfile__
bundle exec rails db:create
bundle exec rails db:migrate

# rails起動
bundle exec rails s -b 0.0.0.0
