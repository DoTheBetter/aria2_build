## aria 2_build

### 魔改 aria 2 编译

+ OpenSSL for Linux (64/32-bit)
+ Schannel for Windows (64/32-bit)
+ AppleTLS for macOS (64-bit)

### 修改内容

#### 1. `option max-connection-per-server: change maximum value to \*, default value to 16`

  + **解释**：修改 `max-connection-per-server` 选项，将最大连接数上限改为 `*`（无限制），默认值改为 `16`。
  + **作用**：允许用户根据需要设置更高的连接数，以提高下载速度。默认值 `16` 是一个合理的起点，适合大多数场景。

#### 2. `option min-split-size: change minimum value to 1K, default value to 1M`

  + **解释**：修改 `min-split-size` 选项，将最小分片大小的最小值改为 `1K`，默认值改为 `1M`。
  + **作用**：允许更小的分片大小（最小 `1K`），适合网络环境较差或需要更精细控制分片的场景。默认值 `1M` 是一个平衡选择，适合大多数下载任务。

#### 3. `option piece-length: change minimum value to 1K, default value to 1M`

  + **解释**：修改 `piece-length` 选项，将分片长度的最小值改为 `1K`，默认值改为 `1M`。
  + **作用**：与 `min-split-size` 类似，允许更小的分片长度，适合需要更精细控制分片的场景。默认值 `1M` 是一个常用值。

#### 4. `option connect-timeout: change default value to 30`

  + **解释**：修改 `connect-timeout` 选项，将连接超时的默认值改为 `30` 秒。
  + **作用**：延长连接超时时间，避免在网络较慢或服务器响应较慢时过早放弃连接。

#### 5. `option split: change default value to 128`

  + **解释**：修改 `split` 选项，将分片数的默认值改为 `128`。
  + **作用**：增加默认分片数，适合需要更高并发下载的场景，可以提高下载速度。

#### 6. `option continue: change default value to true`

  + **解释**：修改 `continue` 选项，将默认值改为 `true`。
  + **作用**：默认启用断点续传功能，避免因网络中断或其他问题导致下载任务需要重新开始。

#### 7. `option retry-wait: change default value to 1`

  + **解释**：修改 `retry-wait` 选项，将重试等待时间的默认值改为 `1` 秒。
  + **作用**：缩短重试等待时间，使下载任务在遇到临时问题时更快恢复。

#### 8. `option max-concurrent-downloads: change default value to 16`

  + **解释**：修改 `max-concurrent-downloads` 选项，将最大并发下载数的默认值改为 `16`。
  + **作用**：增加默认并发下载数，适合需要同时下载多个文件的场景。

#### 9. `option netrc-path conf-path dht-file-path dht-file-path6: change default value to sub-folder of current directory`

  + **解释**：修改 `netrc-path`、`conf-path`、`dht-file-path` 和 `dht-file-path6` 选项，将这些配置文件的默认路径改为当前目录的子文件夹。
  + **作用**：简化配置文件的管理，避免与系统其他文件冲突。

#### 10. `option deamon: make use of it on mingw`

  + **解释**：修改 `deamon` 选项，使其在 MinGW 环境下可用。
  + **作用**：使 aria 2 在 Windows 的 MinGW 环境下支持守护进程模式。

### 11. `download: retry on slow speed and connection close`

  + **解释**：在下载速度过慢或连接关闭时自动重试。
  + **作用**：提高下载任务的稳定性，避免因网络波动或服务器问题导致下载失败。

#### 12. `download: add option retry-on-400 to retry on http 400 bad request, which only effective if retry-wait > 0`

  + **解释**：添加 `retry-on-400` 选项，在 HTTP 400 Bad Request 错误时重试（仅在 `retry-wait > 0` 时生效）。
  + **作用**：提高对服务器错误响应的容错能力，避免因临时问题导致下载失败。

#### 13. `download: add option retry-on-403 to retry on http 403 forbidden, which only effective if retry-wait > 0`

  + **解释**：添加 `retry-on-403` 选项，在 HTTP 403 Forbidden 错误时重试（仅在 `retry-wait > 0` 时生效）。
  + **作用**：提高对权限问题的容错能力，避免因临时权限问题导致下载失败。

#### 14. `download: add option retry-on-406 to retry on http 406 not acceptable, which only effective if retry-wait > 0`

  + **解释**：添加 `retry-on-406` 选项，在 HTTP 406 Not Acceptable 错误时重试（仅在 `retry-wait > 0` 时生效）。
  + **作用**：提高对服务器内容协商问题的容错能力，避免因临时问题导致下载失败。

### 感谢

https://github.com/P3TERX/Aria2-Pro-Core

https://github.com/myfreeer/aria2-build-msys2

https://git.q3aql.dev/q3aql/aria2-static-builds
