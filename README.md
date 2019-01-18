# kong-plugin-upstream-auth-signature

>适用于上游API采用HMAC-SHA256签名认证场景

#### 下载

``` bash
$ git clone https://github.com/xiaomastack/kong-plugin-upstream-auth-signature.git
```

#### 安装

``` bash
$ cd kong-plugin-upstream-auth-signature
$ luarocks make
kong-plugin-upstream-auth-signature 1.0.0-1 is now installed in /usr/local (license: Apache-2.0)

```

#### 配置kong.conf

``` bash
$ vi /etc/kong/kong.conf
plugins = bundled, upstream-auth-signature
```

#### restart kong

``` bash
$ kong restart
```

#### 实例
例如为`activemap` api开启该插件，参数`key`和`secret`是上游API认证公密钥对。

``` bash
$ curl -X POST http://127.0.0.1:8001/apis/activemap/plugins \
      --data "name=upstream-auth-signature" \
      --data "config.key=cd2341dserdke" \
      --data "config.secret=dkckd02jlwjdkqk2k1jdlwdkej"
{"created_at":1547697630000,"config":{"secret":"dkckd02jlwjdkqk2k1jdlwdkej","key":"cd2341dserdke"},"id":"72b9cbb3-25be-4df2-b1c1-aaca3f8a5bc8","name":"upstream-auth-signature","api_id":"f3cfe35d-58f3-4a7f-a44b-47d3dbd40158","enabled":true}
$ 
```

其它Service、Route、Global开启插件方法类似。

#### 其它
<a href="https://www.xiaomastack.com/2019/01/17/kong-plugin-upstream-auth-signature/" target="_blank">插件相关文章</a>

