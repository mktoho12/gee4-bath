# README

ギークハウス新宿四ツ谷のお風呂が空いてるかどうかを取得するAPIです。

## 開発する
ソースコードを取得する
```
git clone https://github.com/mktoho12/gee4-bath.git
```

`.env_example`ファイルをコピーして`.env`ファイルを作ります。

```
cp .env_example .env
```

Dockerコンテナをビルドします。
これは初回起動時のみでオッケーです。

```
docker-compose build
```

起動します

```
docker-compose up
```

テーブルを作って開発用データを入れます。
これも初回起動時のみでオッケーです。

```
docker-compose exec app bundle exec rails db:migrate
docker-compose exec app bundle exec rails db:seed
```

http://localhost:3000/ を開いて、以下のようなJSONが出力されたら準備完了です。細かいところは違うかも。

```
{"status":"using","time":"2019-05-23T14:39:02.000+09:00"}
```

## ドキュメント
https://hackmd.io/@mktoho/BkUuosm6E
