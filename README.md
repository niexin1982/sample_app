# サンプルアプリケーション

このリポジトリは ECS や CI/CD の学習のためのサンプルアプリケーションです。

DB 接続などはなく、シンプルに環境変数を変更することで動作が変わるアプリケーションを作りたかったので用意しました。

ほぼこちらのリポジトリを参考にさせていただいております。

https://github.com/kodekloudhub/webapp-color

## 動作確認

ビルドとrunをしてください

```bash
docker build -t color:latest .
docker run -e APP_COLOR=blue -p 8080:8080  color
```
