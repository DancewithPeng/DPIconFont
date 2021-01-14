//
//  ViewController.m
//  DPIconFontExample
//
//  Created by 张鹏 on 2021/1/14.
//

#import "ViewController.h"
#import <DPIconFont/DPIconFont.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textLabel.font = ICFFont(32);
    self.textLabel.text = @"\U0000e602";
    self.textLabel.text = ICFSymbol(@"&#xe602");
    
    self.imageView.image = ICFSymbolImage(@"\U0000e602", 30);
    self.imageView.tintColor = UIColor.redColor;
}

@end
