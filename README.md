# About
* Dockerを利用したRuby on Rails/MySQLローカル開発環境を構築するためのテンプレートリポジトリです。
* docker-composeを利用しているためrbenvでのRubyのバージョン・Gem管理は不要で、必要な時に必要なコンテナを作ります。
* Ruby, Railsのバージョンを書き換えれば好みのバージョンで開発をすることができます。

<br><br>

# How to use
* cloneしてください。
```
git clone git@github.com:urawa72/rails_docker_template.git
```

* docker-compose build & up
```
docker-compose build
docker-compose up # init.shの処理経過がわかるので-dはつけない
```

* `localhost:5000`にアクセスすればrailsの画面を確認することができます（ポート番号をデフォルトの3000から変更しています）。


<br><br>

# Customize

* `dockerfile/rails/Dockerfile`を編集してrubyのバージョンを変える
```
FROM ruby:2.6.3 # ここを書き換えればOK
```

* `src/Gemfile`を編集してRailsのバージョンを変える。
```
gem 'rails', '5.2.3'
```

* `init.sh`でコンテナ内でRailsの起動準備をしています。必要に応じて処理を追加・削除・修正します。
