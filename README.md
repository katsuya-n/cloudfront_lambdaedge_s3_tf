### 最初の準備

tfstateファイル管理用のS3バケットを作成する。

### apply

```bash
$ cd env/dev/
$ terraform apply
```

作成したstaticのS3バケットにhello.jsonとnot_found.jsonをアップロード。
アクセスできるか確認してみる。

```
https://[ID].cloudfront.net/hello.json
https://[ID].cloudfront.net/not_found.json
```
