RPC(Remote Procedure Call) 远程过程调用
=========
## 定义
客户端A上的应用，通过网络，调用服务端B的函数/方法。

> 进程间通信的远程化版本

<img src='http://7xkbey.com1.z0.glb.clouddn.com/RPC%E5%8E%9F%E7%90%86.png' style="width: 450px"/>

## 协议
CORBA，Java RMI，Web Service，Hessian，Thrift，**Restful**

## 相关技术
#### 1. 通讯
TCP或HTTP
- [Netty](http://netty.io/): Asynchronous event-driven(NIO) network application framework.
- [MINA](https://mina.apache.org/): A network application framework.

#### 2. 服务寻址
域名或IP(URI)，配置（服务端服务注册 ＋ 客户端服务寻址）
- UDDI(Universal Description Discovery and Integration)
- [Zookeeper](http://zookeeper.apache.org/): A centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services.

#### 3. 序列化/反序列化
将**（内存中的）参数和返回值**转换成能够在网络中传递的**字符串或二进制**数据。
- 字符串：JSON, XML
- 二进制：[hessian](http://hessian.caucho.com/), [Protocol Buffers](https://github.com/google/protobuf), [Thrift](https://thrift.apache.org/), [Avro](https://avro.apache.org/)

#### 4. 负载均衡、容灾与安全性
略

## 常见框架
- [hessian](http://hessian.caucho.com/)
- [Thrift](https://thrift.apache.org/)
- [Finagle](https://twitter.github.io/finagle/)
- [DUBBO](http://dubbo.io/)
- [GRPC](http://www.grpc.io/): A high performance, open source, general RPC framework that puts mobile and HTTP/2 <first class=""></first>


## 参考资料
- [Remote Procedure Calls](https://www.cs.rutgers.edu/~pxk/417/notes/03-rpc.html)
- [RPC是什么](http://blog.brucefeng.info/post/what-is-rpc)
