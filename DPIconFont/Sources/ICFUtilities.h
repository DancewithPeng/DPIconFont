//
//  ICFUtilities.h
//  DPIconFont
//
//  Created by 张鹏 on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 配置IconFont字体名称，不配置的情况下，默认是 "iconfont"
/// @param icfName IconFont字体名称
void ICFSetupIconFontName(NSString *icfName);

/// 返回指定尺寸的IconFont图标字体对象
/// @param size 图标尺寸
UIFont * ICFFont(CGFloat size);

/// 根据代码返回符号的unicode编码
/// @param code IconFont代码
NSString * ICFSymbol(NSString *code);

/// 返回IconFont图片
/// @param symbol 符号的unicode编码
/// @param size 尺寸
UIImage * ICFSymbolImage(NSString *symbol, CGFloat size);

/// 返回带颜色的IconFont图片
/// @param symbol 符号的unicode编码
/// @param size 尺寸
/// @param color 颜色
UIImage * ICFSymbolImageWithColor(NSString *symbol, CGFloat size, UIColor * _Nullable color);

NS_ASSUME_NONNULL_END
