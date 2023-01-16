
### 初期設定

```bash
$ touch env/dev/terraform.tfvars
```

terraform.tfvarsに次を追記。

```
lambda_arn = "arn:aws:lambda:us-east-1:[アカウントID]:function:[Lambda関数名]"
```

### apply

```bash
$ cd env/dev/
$ terraform apply
```