## aria2_build

魔改aria2编译：

- 选项`max-connection-per-server`：将最大值更改为`∞`，默认值更改为`16`
- 选项`min-split-size`：将最小值更改为`1K`，默认值更改为`1M`
- 选项`piece-length`：将最小值更改为`1K`，默认值更改为`1M`
- 选项`connect-timeout`：将默认值更改为`30`
- 选项`split`：将默认值更改为`128`
- 选项`continue`：将默认值更改为`true`
- 选项`retry-wait`：将默认值更改为`1`
- 选项`max-concurrent-downloads`：将默认值更改为`16`
- 选项`netrc-path` `conf-path` `dht-file-path` `dht-file-path6`：将默认值更改为当前目录的子文件夹
- 选项`deamon`：在 mingw 上使用它
- 下载：速度慢时重试并关闭连接
- 下载：添加`retry-on-400`在 http 400 错误请求时重试的选项，仅当 retry-wait > 0 时才有效
- 下载：增加`retry-on-403`http 403 禁止重试选项，仅当 retry-wait > 0 时有效
- 下载：添加`retry-on-406`在 http 406 不可接受时重试的选项，仅当 retry-wait > 0 时才有效







## 感谢

https://github.com/P3TERX/Aria2-Pro-Core

https://github.com/myfreeer/aria2-build-msys2

https://git.q3aql.dev/q3aql/aria2-static-builds
