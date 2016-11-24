CORS(Cross-Origin Resource Sharing)
=================
## 是什么
- 出于安全考虑，浏览器对脚本中的非同源请求作出了限制
- 同源请求仅限同域名(可以不同路径，但不能不同二级域名)、同协议、同端口
- 非同源请求可以发起，服务器可以收到并返回。浏览器会根据Response的header来决定是否拦截。
- HTML标签中的src不受限制

## 服务器如何允许跨域请求


## 如何访问跨域资源



## 参考资料
- [Cross-Origin Resource Sharing by W3C](https://www.w3.org/TR/cors/)
- [JavaScript跨域总结与解决办法](http://www.cnblogs.com/rainman/archive/2011/02/20/1959325.html)
- [跨域资源共享 CORS 详解](http://www.ruanyifeng.com/blog/2016/04/cors.html)
- [理解 CORS (Cross-Origin Resource Sharing)](https://segmentfault.com/a/1190000005125790?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io)
