先放demo 地址  github 库太大，我传不上去。哪位大神教我一下。百度网盘也能先凑活一下了。链接: http://pan.baidu.com/s/1sljIVTj 密码: ctak
基友demo2 抽出来的小项目 把库抽出来了不然太大，可以把库直接放进去使用。
链接: https://pan.baidu.com/s/1hrETkAo 密码: 5u6k
###  1.VLC 介绍
[VLC](http://www.videolan.org/vlc/) 是什么？(借的，这个比较全)
>[VLC](https://code.videolan.org/videolan/VLCKit.git) VLC媒体播放器（VideoLAN的）为Windows，Linux和OS X，Android版，iOS版的Windows Phone等平台提供一个视频播放器，解码器，它可以播放来自网络，摄像头，磁盘，光驱的文件，支持包括MPEG 1 / 2/4，H264，VC-1，DivX的，WMV，Vorbis格式，AC3，AAC等格式的解码。在windows和linux上的VLC是使用C ++ / Qt的写成，提供了一致的用户体验。同时VLC还专门为OS X提供了原生版本，Mac OS X版的VLC的用户界面使用可可框架编写，在OS X下拥有卓越的原生体验。
 - VLC还有一个非常好的功能 - 播放那些没有下载完整的视频文件。
 - VLC几乎覆盖所有媒体格式。


PS:   以前也没做过，最近公司要做一个关于火车摄像头的App，没办法，找轮子吧，先找了ijkplayer，听说还是比较好使的，但由于在实现过程中经历了很多曲折，编译老失败，无奈之下，在一篇文章评论区看到这个VLC，然后就开始了研究，找了几篇文章之后，竟然成功了。哈哈 感觉好开心，大概折腾了两天，中间头疼过好多次，不过最终还是成功了，记录一下，聊作慰藉，也给后来用的人一个前车之鉴，
希望能有用。come on baby ！！！

####2.怎么下载使用
这是一款强大的全平台播放器, 几乎支持所有的音频、视频格式文件播放, 官网地址:[http://www.videolan.org/](http://www.videolan.org/)
- 在iOS 中也可以集成 VLC 的 SDK 进行开发, 使用之前需要先去官网下载 SDK, 然后编译成 iOS 中使用的库文件才能使用, 这种集成方法在编译的过程中需要 VPN 翻墙进行联网编译, 如果网速不好或者不稳定, 很容易编译出错, 如果网速好, 可以按照 wiki 的说明去编译: [https://wiki.videolan.org/iOSCompile]
-  第二种方式，不用编译，直接下载这个玩意。拖到项目里就可以了。记得选copy第一个选项打钩。然后添加依赖库就可以啦。
![1D14D4AD-3085-4603-91E5-EF59A17A1D97.png](http://upload-images.jianshu.io/upload_images/1761100-ceb93b8e704cd91a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![D84FA38B-F24B-4614-B298-B4F9965810CF.png](http://upload-images.jianshu.io/upload_images/1761100-3ca1153dfb85b558.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 - so，这道题太难了，我不想编译了。百度云下载了行不- 链接: https://pan.baidu.com/s/1sk9QvxV 密码: trf4

> 我被ijkplayer编译弄怕了，不敢再编译，再加上当时比较急，就选了第二种方式，简单粗暴。也可以cocoapods集成或者是直接在网上下载下来-->下载地址:[http://nightlies.videolan.org/build/ios/](http://nightlies.videolan.org/build/ios/).打开页面之后, 拉到网页最下面可以看到最新的MobileVLCKit.framework,如果最新的报错，可以尝试其他的。我用的是2.2.2版本，pod search 可以搜到。

#####3.如何集成
关于如何集成，推荐大家去看这篇文章 [VLC集成与使用](http://www.jianshu.com/p/178627b085c3)，大神讲的已经很明白了。
在项目中添加依赖库(有一点不一样，大神用的比较少，我也不知道用的会不会错，我的是这样)

![A5D3E673-8451-4C98-9E9F-60B8978B5FE8.png](http://upload-images.jianshu.io/upload_images/1761100-6fe5c89244b68e6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

我想说的只是自己遇到的一些问题，可能运气不好只有我遇到，但是还是希望写下来。
集成之后，第一次编译，报了个错误，说是bitcode 错误，然后把bitcode改为NO，还有VLC这个库用到了C++，所以把appdelegate.m 改为 .mm 文件。还有c++ standard library 改为第一个选项，都在build Settings里面。关于这个，请参考这篇文章，[基于iOS 的 VLC简单 Demo](http://blog.csdn.net/crash_zo/article/details/51459604)，这位博主写了两篇关于VLC的文章，图文并茂，写的还是不错的。
##### 4.具体用法
因为我们这个项目对摄像头要求比较低，所以写的比较的简单，只要在用到的界面，导入头文件：
```
#import<MobileVLCKit/MobileVLCKit.h>
```
再声明上一个属性：
```
@property (nonatomic, strong)VLCMediaPlayer *player;

```
然后就可以简单使用了。
```
- (void)viewDidLoad {  
  UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 400)];
    videoView.backgroundColor = [UIColor blackColor];//我自己给他一个背景色，好认
    [self.view addSubview:videoView];
    VLCMediaPlayer *player = [[VLCMediaPlayer alloc] initWithOptions:nil];
    self.player = player;
   // 播放时候的载体
    self.player.drawable = videoView;
    //我们的RTSP 测试地址（估计你们也用不了）
    NSURL *url = [NSURL URLWithString:@"rtsp://10.0.0.89/session0.mpg"];
    // 对象给他
    self.player.media = [VLCMedia mediaWithURL:url];
    //开始播放
    [self.player play];
}
```
####不想看字就看图
![A275803E-4879-4199-8D1A-830C960618C7.png](http://upload-images.jianshu.io/upload_images/1761100-a4582d074b315b3d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#####但这是初级使用，之前那篇博主写的很详细，需要复杂使用的同学可以去找他，地址----> [VLC集成与使用](http://www.jianshu.com/p/178627b085c3)
,还有这个遇到问题可以看一下参考这篇文章，[基于iOS 的 VLC简单 Demo](http://blog.csdn.net/crash_zo/article/details/51459604)。

OK ！ 写完了，下次就好说了，一回生，二回熟。😝 喜欢这张图

![智障.gif](http://upload-images.jianshu.io/upload_images/1761100-25e2c10313385653.gif?imageMogr2/auto-orient/strip)
