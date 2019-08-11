#!/bin/bash

DIR="app"
cd /myapp

# app/がないときだけ初回のrailsアプリ生成処理
if [ ! -d $DIR ]; then
  rails new . --force --database=mysql --skip-bundle
  # database.yml設定
  cat config/database.yml | sed 's/password:$/password: root/' | sed 's/host: localhost/host: db/' > __tmpfile__
  cat __tmpfile__ > config/database.yml
  rm __tmpfile__
  # rails起動
  bundle install --path vendor/bundle
  bundle exec rails db:create
  bundle exec rails db:migrate
  bundle exec rails s -b 0.0.0.0
else
  cd /
  exec bin/bash
fi
