
# speedtest-cliを実行してelasticsearchに送るスクリプト

## 参考サイト
- https://github.com/h-mineta/speedtest-es
- https://nbailey.ca/post/wan-speedtest-elasticsearch/

## 注意点
- localhost:9200でelasticsearchを動かしておく。
- kibanaの時刻設定をbrowserからAsia/Tokyoにしておく。
- 数値がbps単位で大きいので、スクリプトフィールドで 1250000で割ってMbit/sにしてる。