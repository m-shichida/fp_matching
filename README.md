## セットアップ
### まずはレポジトリをローカルにもってくる

```
$ git clone git@github.com:m-shichida/fp_matching.git
```

### ビルドとリスタートする

```
$ mv .env.docker .env
```

```
$ docker-compose up --build
```

```
$ docker-compose restart
```

### Webpackerをインストール

```
$ docker-compose run --rm web rails webpacker:install
```

### データベースの作成

```
$ docker-compose run --rm web rails db:create
```

### 起動

```
$ docker-compose up -d(これはなくても良い)
```

localhost: 3000にアクセスで完了です。

### Rubocopによるlint

```
$ docker-compose run --rm web bundle exec rubocop
```

### db/fixtures以下のファイルについて
seed-fuを使ってサンプルデータを反映できます。

```
$ docker-compose run --rm web rails db:seed_fu
```

ユーザー側でログインするなら`customer@example.com`
ファイナンシャルプランナー側でログインするなら`fp@example.com`でログインしてください。

### Dockerfileやdocker-compose.ymlを変更したとき
再ビルドしてください。

```
$ docker-compose up --build
```

### bundle installするとき

```
$ docker-compose run --rm web bundle install
```

### bootsnapの影響でrailsコマンドを実行できないとき
tmp/cache以下の

- bootsnap-compile-cache
- bootsnap-load-path-cache

を削除する必要があります。

```
$ docker-compose run --rm web bash
$ cd tmp/cache
```

```
$ rm -rf bootsnap-compile-cache
$ rm bootsnap-load-path-cache
```

でキャッシュを削除してください。
