## 提升页面（首屏）加载速度checklist

0. 减少页面加载需要的请求数量
    - 使用CSS Sprites合图 或 Base64 data-uri
    - 合并js和css文件
0. 减少需下载资源的大小
    - 对图片进行合理压缩，控制大小和质量
    - 对js和css进行压缩/混淆
    - 启用gzip
0. 关于加载
    - 按需加载和异步加载
    - lazyload
    - 滚屏加载
0. 使用CDN
0. 合理安排CSS和js文件位置
  - CSS放在`<head>`内，减少浏览器加载和重绘页面元素
  - js通常放在页面底部, `</body>`前
0. 利用浏览器缓存

0. 减少DNS查询，较少页面中资源分布的不同域名数量。
0. 减少重定向



#### 参考资料
- [H5性能优化方案](http://ddtalk.github.io/blog/2015/09/07/dingding-first/)
- [移动H5前端性能优化指南](http://isux.tencent.com/h5-performance.html)
