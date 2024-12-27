# **使用说明：**  
## 一、请先打开下面网站，一键生成ALLINONE部署命令：
## **[点击打开命令生成器](https://imgtool.v1.mk/allinone.html)**
### 设置自动更新ALLINONE，如果你使用Docker部署方式，在部署完成后，建议再配置watchtower自动监听allinone镜像更新，同步Docker-Hub仓库！！！注意，你需要先去生成器生成部署命令执行后再配置自动更新：
```
docker run -d --name watchtower --restart=always -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower allinone  --cleanup --interval 3600
```
## 二、详细使用方法
## **Gaoma和Itv以及Tptv聚合M3U获取：**
**声明：如果你是在公网服务器部署，不愿意开启聚合TV直播服务，在运行裸程序或者Docker时，加上参数 -tv=false 即可不开启直播服务（仅对gaoma、itv、tptv生效，migu走的是302重定向，没有代理流量），具体可[点击参考命令生成器](https://imgtool.v1.mk/allinone.html)**
```
http://你的IP:35455/tv.m3u
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/tv.m3u(?url=https://你的反代域名)   举个例子：https://www.feiyang.com/tv.m3u?url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
## **单独Tptv列表获取** 
```
http://你的IP:35455/tptv.m3u
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/tptv.m3u(?url=https://你的反代域名)   举个例子：https://www.feiyang.com/tptv.m3u?url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
## **单独MiguTv列表获取** 
```
http://你的IP:35455/migu.m3u?userid=你的userid&usertoken=你的usertoken
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/migu.m3u?userid=你的userid&usertoken=你的usertoken(&url=https://你的反代域名)   举个例子：https://www.feiyang.com/migu.m3u?userid=123456789&usertoken=nlpED8GH64G9H&url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
## **单独Migu赛事列表获取** 
```
http://你的IP:35455/miguevent.m3u?userid=你的userid&usertoken=你的usertoken
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/miguevent.m3u?userid=你的userid&usertoken=你的usertoken(&url=https://你的反代域名)   举个例子：https://www.feiyang.com/miguevent.m3u?userid=123456789&usertoken=nlpED8GH64G9H&url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
## **获取Migu Token方法如下（在电脑浏览器打开 https://www.miguvideo.com/ ，登录你的账号后按F12在控制台粘贴以下代码获取，需要注意，migutv需要开通钻石VIP才能1080P,migu赛事需要开通对应体育或者NBA会员，否则你只能看到测试视频）：** 
```
function generateSubscriptionUrl() {
    const getCookie = (name) => {
        const value = '; ' + document.cookie;
        const parts = value.split('; ' + name + '=');
        if (parts.length === 2) {
            return parts.pop().split(';').shift();
        }
    };

    const user_info = JSON.parse(decodeURIComponent(getCookie('userInfo')));

    if (user_info) {
        let url;
        const user_id = user_info.userId;
        const user_token = user_info.userToken;
        if (user_id && user_token) {
            url = `http://你的IP:35455/miguevent.m3u?userid=${user_id}&usertoken=${user_token}`;
            console.log('你的订阅配置为：', url);
            return url;
        } else {
            console.log('用户Cookie缺失');
        }

    } else {
        console.log('用户Cookie找不到');
    }
}
generateSubscriptionUrl();
```
## **单独TX体育赛事列表获取**
```
QQ扫码登录：
http://你的IP:35455/txevent.m3u?main_login=具体mainLogin&vqq_appid=vqqAppId值&vqq_openid=vqqOpenId值&vqq_access_token=vqqAccessToken值
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/txevent.m3u?main_login=具体mainLogin&vqq_appid=vqqAppId值&vqq_openid=vqqOpenId值&vqq_access_token=vqqAccessToken值(&url=https://你的反代域名)   举个例子：https://www.feiyang.com/txevent.m3u?main_login=具体mainLogin&vqq_appid=vqqAppId值&vqq_openid=vqqOpenId值&vqq_access_token=vqqAccessToken值&url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议

微信扫描登录：
http://你的IP:35455/txevent.m3u?main_login=mainLogin值&appid=appId值&openid=openId值&access_token=accessToken值&vuserid=vUserId值&refresh_token=refreshToken值
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/txevent.m3u?main_login=mainLogin值&appid=appId值&openid=openId值&access_token=accessToken值&vuserid=vUserId值&refresh_token=refreshToken值(&url=https://你的反代域名)   举个例子：https://www.feiyang.com/txevent.m3u?main_login=mainLogin值&appid=appId值&openid=openId值&access_token=accessToken值&vuserid=vUserId值&refresh_token=refreshToken值&url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
## **获取TxSport鉴权信息方法如下（在电脑浏览器打开 https://sports.qq.com/ ，登录你的账号后按F12在控制台粘贴以下代码获取,不建议使用微信扫码登录，因为cookie极其容易失效，建议使用qq扫码登录，高画质必须开通TX体育超级会员，另外，TX体育只会在比赛前才给提供直播源链接，所以平时你大多数情况下看到的只是本群的测试源）：**
```
function generateSubscriptionUrl() {
    const getCookie = (name) => {
        const cookieString = '; ' + document.cookie;
        const cookieParts = cookieString.split('; ' + name + '=');
        if (cookieParts.length === 2) {
            return cookieParts.pop().split(';').shift();
        }
    };

    const mainLogin = getCookie('main_login');

    if (mainLogin) {
        let subscriptionUrl;

        if (mainLogin === 'qq') {
            const vqqAppId = getCookie('vqq_appid');
            const vqqOpenId = getCookie('vqq_openid');
            const vqqAccessToken = getCookie('vqq_access_token');

            if (vqqAppId && vqqOpenId && vqqAccessToken) {
                subscriptionUrl = `http://你的IP:35455/txevent.m3u?main_login=${mainLogin}&vqq_appid=${vqqAppId}&vqq_openid=${vqqOpenId}&vqq_access_token=${vqqAccessToken}`;
                console.log('腾讯体育订阅链接为：', subscriptionUrl);
                return subscriptionUrl;
            } else {
                console.log('缺少QQ登录所需的Cookie');
            }

        } else if (mainLogin === 'wx') {
            const appId = getCookie('appid');
            const openId = getCookie('openid');
            const accessToken = getCookie('access_token');
            const vUserId = getCookie('vuserid');
            const refreshToken = getCookie('refresh_token');
            const vUsession = getCookie('vusession');

            if (appId && openId && accessToken && vUserId && refreshToken) {
                subscriptionUrl = `http://你的IP:35455/txevent.m3u?main_login=${mainLogin}&appid=${appId}&openid=${openId}&access_token=${accessToken}&vuserid=${vUserId}&refresh_token=${refreshToken}&vusession=${vUsession}`;
                console.log('腾讯体育订阅链接为：', subscriptionUrl);
                return subscriptionUrl;
            } else {
                console.log('缺少微信登录所需的Cookie');
            }
        }

    } else {
        console.log('缺少 main_login Cookie');
    }
}

generateSubscriptionUrl();
```
## **单独Iqiyi赛事列表获取** 
```
http://你的IP:35455/iqyevent.m3u?uid=你的uid&userid=你的userid&usertoken=你的usertoken
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/iqyevent.m3u?uid=你的uid&userid=你的userid&usertoken=你的usertoken(&url=https://你的反代域名)   举个例子：https://www.feiyang.com/iqyevent.m3u?uid=你的uid&userid=123456789&usertoken=nlpED8GH64G9H&url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
## **获取IqiyiSport鉴权信息方法如下（在电脑浏览器打开 https://ssports.iqiyi.com/ ，登录你的账号后按F12在控制台粘贴以下代码获取，大部分赛事必须开通爱足球会员，另外Iqiyi体育赛事未开播前获取不到直播源，默认本群测试源，建议勿看）：**
```
function generateSubscriptionUrl() {
    const getCookie = (name) => {
        const value = '; ' + document.cookie;
        const parts = value.split('; ' + name + '=');
        if (parts.length === 2) {
            return parts.pop().split(';').shift();
        }
    };

    const uid = getCookie('P00010');
    const user_id = getCookie('userId');
    const user_token = getCookie('P00001');
    if (user_id && user_token) {
        url = `http://你的IP:35455/iqyevent.m3u?uid=${uid}&userid=${user_id}&usertoken=${user_token}`;
        console.log('你的订阅配置为：', url);
        return url;
    } else {
        console.log('Cookie缺失');
    }
}
generateSubscriptionUrl();
```
## **直播源格式化工具**
**[点击查看直播源格式化工具，将重复频道格式化处理](https://hub.docker.com/r/yuexuangu/allinone_format)**
## **BiliBili、虎牙、斗鱼、YY实时M3U获取：**
### BiliBili生活：
```
http://你的IP:35455/bililive.m3u
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/bililive.m3u(?url=https://你的反代域名)   举个例子：https://www.feiyang.com/bililive.m3u?url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
### 虎牙一起看：
```
http://你的IP:35455/huyayqk.m3u
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/huyayqk.m3u(?url=https://你的反代域名)   举个例子：https://www.feiyang.com/huyayqk.m3u?url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
### 斗鱼一起看：
```
http://你的IP:35455/douyuyqk.m3u
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/douyuyqk.m3u(?url=https://你的反代域名)   举个例子：https://www.feiyang.com/douyuyqk.m3u?url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
### YY轮播：
```
http://你的IP:35455/yylunbo.m3u
如果你的allinone服务被部署至服务器上，并且使用https域名反代了IP+端口，那么你的链接要变成：
https://你的反代域名/yylunbo.m3u(?url=https://你的反代域名)   举个例子：https://www.feiyang.com/yylunbo.m3u?url=https://www.feiyang.com
括号中为可选参数，用来方便替换列表前缀为https的，如果反代域名中含有特殊符号的，先去urlencode，如果反代后的域名依旧存在端口，那就把端口照样加上去，比如url=https://feiyang.com:12345，不加url参数默认是http协议
```
## **抖音：**
### 默认最高画质，浏览器打开并复制`(live.douyin.com/)xxxxxx`，只需要复制后面的xxxxx即可（可选flv和hls两种种流媒体传输方式，默认flv）：
```
http://你的IP:35455/douyin/xxxxx(?stream=hls)
```
## **斗鱼：**
### 1，可选m3u8和flv以及xs三种流媒体传输方式【`(www.douyu.com/)xxxxxx 或 (www.douyu.com/xx/xx?rid=)xxxxxx`，默认flv】：
```
http://你的IP:35455/douyu/xxxxx(?stream=flv)
```
## **BiliBili`(live.bilibili.com/)xxxxxx`：**
### 1，平台platform参数选择（默认web，如果有问题，可以切换h5平台）：
```
"flv"   => "FLV"
"hls"    => "M3U8"
```
### 2，线路line参数选择（默认线路二，如果卡顿/看不了，请切换线路一或者三，一般直播间只会提供两条线路，所以建议线路一/二之间切换）：
```
"first"  => "线路一"
"second" => "线路二"
"third"  => "线路三"
```
### 3，画质quality参数选择（默认原画，可以看什么画质去直播间看看，能选什么画质就能加什么参数，参数错误一定不能播放）：
```
"4" => "原画质"
"3" => "低画质"
```
### 4，最后的代理链接示例：
```
http://你的IP:35455/bilibili/xxxxxx(?platform=hls&line=first&quality=4)
```
## **虎牙`(huya.com/)xxxxxx`：**  
### 1，查看可用CDN：
```
http://你的IP:35455/huya/xxxxx?type=json
```
### 2，切换媒体类型（默认flv，可选flv、hls）： 
```
http://你的IP:35455/huya/xxxxx?media=hls
```
### 3，切换CDN（默认hwcdn，可选hycdn、alicdn、txcdn、hwcdn、hscdn、wscdn，具体可先访问1获取）：
```
http://你的IP:35455/huya/xxxxx?cdn=alicdn
```
### 4，最后的代理链接示例：
```
http://你的IP:35455/huya/xxxxx(?media=xxx&cdn=xxx)
```
## **YouTube:**
```
https://www.youtube.com/watch?v=cK4LemjoFd0
Rid: cK4LemjoFd0
http://你的IP:35455/youtube/cK4LemjoFd0(?quality=1080/720...)
```
## **YY（默认最高画质，参数为4）:**
```
https://www.yy.com/xxxx
http://你的IP:35455/yy/xxxx(?quality=1/2/3/4...)
```
## 更多平台后续会酌情添加
# 免责声明：本程序仅供学习交流，源码均搜集自互联网，禁止使用其谋取利益或者进行不正当行为，否则本程序不背任何责任，如有侵权请联系，将会直接下架移除！
