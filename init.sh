#!/bin/bash

cd /myapp

# yarn未インストールの場合の初期処理
which yarn > /dev/null 2>&1
if [ $? -eq 0 ]; then
  npm install -g yarn
  yarn install
  bundle exec rails db:create
  bundle exec rails db:migrate
else
  cd /
  exec bin/bash
fi
