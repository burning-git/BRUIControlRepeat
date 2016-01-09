//
//  ViewController.m
//  RepeatSeletdButtonObject_C
//
//  Created by gitBurning on 15/9/26.
//  Copyright © 2015年 BR. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+BR_Repeat.h"
#import "UIBarButtonItem+Repeat.h"


#warning ps UIBarButtonItem+Repeat 目前无作用，请使用 UIControl ！ 作者继续研究中...

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Burning_git";
  //  self.button.br_controllAcceptEventInterval = 10;
    BRRepeatWeak(ws);
//    self.button.unSelectedBlock=^(){
//        
//        ws.button.backgroundColor=[UIColor lightGrayColor];
//        
//    };
//    
//    self.button.selectedBlcok = ^()
//    {
//        ws.button.backgroundColor=[UIColor orangeColor];
//
//    };
    [self.button addSelectedBlcokStatus:^(UIButton*sender){
        
        ws.button.backgroundColor=[UIColor orangeColor];
        
    } unSelectedBlock:^(UIButton*sender){
        
         ws.button.backgroundColor=[UIColor lightGrayColor];
    }];
    
    
//    UIBarButtonItem * bar = [[UIBarButtonItem alloc] initWithCustomView:[self addRightItemWithImage:@"feedBack矢量智能对象" action:@selector(sleedsjasdakdjad:)]];
    
//   UIBarButtonItem *  bar = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(sleedsjasdakdjad:)];
//    self.navigationItem.rightBarButtonItem = bar;
//    bar.br_barItemAcceptEventInterval = 5;
    
    
    //[bar setValue:@(5) forKey:@"br_controllAcceptEventInterval"];
    // Do any additional setup after loading the view, typically from a nib.
}
- (UIButton *)addRightItemWithImage:(NSString *)imageName action:(SEL)action {
    UIButton *button = [[UIButton alloc] init];
    UIImage *image = [UIImage imageNamed:imageName];
    button.frame = CGRectMake(10, 0, 30, 30);
    
    // 这里需要注意：由于是想让图片右移，所以left需要设置为正，right需要设置为负。正在是相反的。
    // 让按钮图片右移15
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:16];

    return button;
}

-(void)sleedsjasdakdjad:(UIBarButtonItem*)bar
{
    NSLog(@"dasjdlasdjasld");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)send:(UIButton *)sender {
    
    NSLog(@"点击了 按钮");
}
@end
