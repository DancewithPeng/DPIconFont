# DPIconFont

[TOC]

IconFont使用工具，方便进行开发



## 导入

### CocoaPods

在`Podfile`文件中加入

```ruby
pod 'DPIconFont', '~> 1.0'
```



## 使用

首先需要在项目的Info.plist文件中加入自定义字体文件配置

<img src="http://markdownimages.dpdev.cn/images/image-20210114173310493.png" alt="image-20210114173310493" style="zoom:50%;" />

默认的字体名字是`iconfont`，如果是采用了其他的字体名字，请在启动时指定自定义的字体名字

```objc
#import <DPIconFont/DPIconFont.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ICFSetupIconFontName(@"my font name");
    return YES;
}
```

在需要显示iconfont的UILabel控件上设置字体为iconfont，然后指定text为图标对应的编码

```objc
textLabel.font = ICFFont(32);
textLabel.text = @"\U0000e634";
```

> 这里也提供了直接指定iconfont上编码的方式，通过`ICFSymbol`方法
>
> ```objc
> textLabel.text = ICFSymbol(@"&#xe634");
> ```
>
> 提供此方式的原意是提供一种更便捷的方式，让开发更方便，但是相对于手动替换，此方式的性能要差一些
>
> 如果采用手动替换`&#x`为`\U0000`，的方式，可以采用搜索替换的方式，效率和很高

如果是某些场景需要用到UIImage对象，可以通过以下两个方法来生成对应的图片

- ICFSymbolImage()
- ICFSymbolImageWithColor()

这两个方法的区别仅仅是后者可以指定渲染的颜色

```objc
imageView.image = ICFSymbolImage(@"\U0000e634", 30);
```

第二个参数用于指定生成图片的尺寸，生成的图片永远是正方形



## LICENSE

此项目采用**MIT**开源协议，[点击查看详情](LICENSE)

