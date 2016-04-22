## 简介
- 使用64(2^6)个可打印字符表示二进制数据。`A-Z a-z 0-9 + /`，依次为0-63
- 每6比特编码为一个字符
- 若二进制数据长度不是6的倍数，末尾补0。每补两个0，编码后文本最后加一个`=`

## base62
- 比base64少了`+ /`，可以用于URL和文件路径中