#!/bin/bash
PROJECT=$1
if [ -z "${PROJECT}" ]; then
  echo "第1引数にプロジェクト名を指定してください"
  exit 1
fi
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --out text)
INIT_TAG=v1
ECR_BASE_URI=${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-1.amazonaws.com
ECR_PREFIX=${ECR_BASE_URI}/${PROJECT}
# ログイン
aws ecr get-login-password --region ap-northeast-1 | \
 docker login --username AWS --password-stdin ${ECR_BASE_URI}
# build app
APP_IMAGE_FULL_NAME="${ECR_PREFIX}-app"
docker build --platform linux/amd64 -t ${APP_IMAGE_FULL_NAME}:${INIT_TAG} .
docker push ${APP_IMAGE_FULL_NAME}:${INIT_TAG}