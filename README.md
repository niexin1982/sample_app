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

## ECRリポジトリへイメージをプッシュ

### ECRリポジトリの用意

以下命名規則でECRのリポジトリを用意しておく

```
${AWSアカウントID}.dkr.ecr.ap-northeast-1.amazonaws.com/${任意のプロジェクト名}-app:v1
```

### イメージビルド・プッシュ

以下のようにコマンドを実行。

```bash
./push_image.sh ${プロジェクト名}
```

