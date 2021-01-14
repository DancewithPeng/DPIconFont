//
//  ICFUtilities.m
//  DPIconFont
//
//  Created by 张鹏 on 2021/1/14.
//

#import "ICFUtilities.h"
#import <CoreText/CoreText.h>

static NSString *_iconFontName = @"iconfont";

/// 配置IconFont字体名称，不配置的情况下，默认是 "iconfont"
/// @param icfName IconFont字体名称
void ICFSetupIconFontName(NSString *icfName) {
    _iconFontName = icfName;
}

/// 返回指定尺寸的IconFont图标字体对象
/// @param size 图标尺寸
UIFont * ICFFont(CGFloat size) {
    return [UIFont fontWithName:_iconFontName size:size];
}

/// 根据代码返回符号的unicode编码
/// @param code IconFont代码
NSString * ICFSymbol(NSString *code) {
    if ([code hasPrefix:@"&#x"] == NO) {
        return code;
    }
    
    NSString *hexCode = [code stringByReplacingOccurrencesOfString:@"&#x" withString:@""];
    NSScanner *scanner = [[NSScanner alloc] initWithString:hexCode];
    unsigned int hexValue = 0;
    [scanner scanHexInt:&hexValue];
    if (hexValue == 0) {
        return code;
    }
    
    unichar utf16char = hexValue;
    
    return [[NSString alloc] initWithCharacters:&utf16char length:1];
}

/// 返回IconFont图片
/// @param symbol unicode编码
/// @param size 尺寸
UIImage * ICFSymbolImage(NSString *symbol, CGFloat size) {
    return ICFSymbolImageWithColor(symbol, size, nil);
}

/// 返回带颜色的IconFont图片
/// @param symbol 符号的unicode编码
/// @param size 尺寸
/// @param color 颜色
UIImage * ICFSymbolImageWithColor(NSString *symbol, CGFloat size, UIColor * _Nullable color) {
    UIGraphicsImageRenderer *imageRenderer = [[UIGraphicsImageRenderer alloc] initWithSize:CGSizeMake(size, size)];
    UIImage *image = [imageRenderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
                        
        NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
        
        UIFont *font = ICFFont(size);
        attributes[NSFontAttributeName] = font;
        
        if (color) {
            attributes[NSForegroundColorAttributeName] = color;
        }
        
        [symbol drawAtPoint:CGPointZero withAttributes:attributes];
    }];
    return image;
}
