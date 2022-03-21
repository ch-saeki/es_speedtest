
# speedtest　cliを実行してelasticsearchに送るスクリプト

## 参考サイト
- https://dev.classmethod.jp/articles/202110-continuous-speedtest-with-mackerel/

## 注意点
- localhost:9200でelasticsearchを動かしておく。
- kibanaの時刻設定をbrowserからAsia/Tokyoにしておく。
- 数値がbps単位で大きいので、スクリプトフィールドで 125000で割ってMbit/sにしてる。

## install
```
$ curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
$ sudo apt-get install speedtest
```
