# AWS WAFv2 and CloudFront

## Prerequisites

- [AWS CLI](https://aws.amazon.com/cli/) がインストールされていること
- [Terraform](https://developer.hashicorp.com/terraform/downloads) がインストールされていること
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/) がインストールされていること
- Amazon Route53 にパブリックホストゾーンが登録済みであること

## Requirements

| Name       | Version   |
| ---------- | --------- |
| terraform  | ~> 1.4.4  |
| terragrunt | ~> 0.45.2 |

## Providers

| Name | Version   |
| ---- | --------- |
| aws  | ~> 4.62.0 |

## Architecture

<div align="center">
  <img src="https://user-images.githubusercontent.com/44653717/236705599-2d8ef0df-c742-484b-a9cb-e3144917e4a1.png" />
</div>

- インターネットからのアクセスは AWS WAF を経由して CloudFront に到達する
- `/api/*` へのアクセスは ALB を Origin とする。
- その他のパスへのアクセスは S3 を Origin とする
- ALB・S3 へのアクセスは AWS WAF、CloudFront を経由したアクセスのみを許可する

## 事前準備

1. AWS CLI を使用して、AWS アカウントにログインします。

```bash
aws configure
```

2. このリポジトリをクローンします。

```bash
git clone https://github.com/maishio/aws-wafv2-and-cloudfront.git
cd aws-wafv2-and-cloudfront/terraform/enviroments/prod
```

3. [env.hcl](terraform/environments/prod/env.hcl) のローカル変数を、自分の環境に合わせて設定してください。

```hcl
locals {
  aws_account_id = "123456789012"
  aws_region_id  = "us-east-1"
  env            = "myEnv"
  hostzone       = "example.com"
  service        = "myService"
}
```

## デプロイ方法

1. 以下のコマンドを実行して、初期化します。

```bash
terragrunt run-all init --terragrunt-non-interactive
```

2. 以下のコマンドを実行して、インフラをデプロイします。

```bash
terragrunt run-all plan
terragrunt run-all apply
```

## デプロイの確認

1. [サンプル API のデプロイ手順](app/README.md) に従ってサンプル API を Amazon ECR にプッシュしてください。

- `/health` ヘルスチェックパス
- `/api/hello` サンプル API のパス。`{"message":"Hello World"}` を返します。

2. デプロイ直後はタスク数が`0`です。以下のコマンドを実行してタスク数を`1`に変更してください。

```bash
aws ecs update-service --cluster YOUR_CLUSTER_NAME --service YOUR_SERVICE_NAME --desired-count 1
```

3. ALB へのアクセスが CloudFront 経由のみ許可されていることを確認します。

```bash
# CloudFront 経由でアクセス
$ curl https://cdn.${YOUR_DOMAIN}/api/hello
{"message":"Hello World"}

# ALB のドメイン名でアクセス
$ curl http://${YOUR_ALB_DNS_NAME}/api/hello
curl: (52) Empty reply from server
```

4. S3 へのアクセスが CloudFront 経由のみ許可されていることを確認します。

```bash
# CloudFront 経由でアクセス
$ curl https://cdn.${YOUR_DOMAIN}/test.json
{"result": "OK"}

# S3 のドメイン名でアクセス
$ curl https://${YOUR_S3_DNS_NAMe}/test.json
<?xml version="1.0" encoding="UTF-8"?>
<Error><Code>AccessDenied</Code><Message>Access Denied</Message>・・・</Error>
```

## References

- [Amazon CloudFront を活用したウェブサイトの可用性向上](https://aws.amazon.com/jp/blogs/news/improve-your-website-availability-with-amazon-cloudfront/)
