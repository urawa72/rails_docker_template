# About
* DockerでRuby on Rails/MySQLローカル開発環境を構築するためのテンプレート

<br><br>

# How to use
* clone
```
git clone git@github.com:urawa72/rails_docker_template.git
```

* docker-compose build & up
```
docker-compose build
docker-compose up
```

* コンテナに入って初期処理を実行
```
docker exec app bash
init.sh
```

* `localhost:5000`にアクセス（ポート番号をデフォルトの3000から変更）

