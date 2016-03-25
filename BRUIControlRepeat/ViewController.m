//
//  ViewController.m
//  RepeatSeletdButtonObject_C
//
//  Created by gitBurning on 15/9/26.
//  Copyright © 2015年 BR. All rights reserved.
//

#import "ViewController.h"
#import "UIBarButtonItem+Repeat.h"
//#import "UIButton+BRRepeat.h"
#import "UIControl+BR_Repeat.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Burning_git";
    BRDefineSetRepeatInterval(10);
 //   [UIControl setDefualtInterval:10]; //总开关， 所有的 设置 为 10s
   // self.button.br_controllAcceptEventInterval = 10;
    BRRepeatWeak(ws);

    [self.button addSelectedBlcokStatus:^(UIButton*sender){
        
        ws.button.backgroundColor=[UIColor orangeColor];
        
    } unSelectedBlock:^(UIButton*sender){
        
         ws.button.backgroundColor=[UIColor lightGrayColor];
    }];
    
    
    
   UIBarButtonItem *  bar = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(sleedsjasdakdjad:)];
    self.navigationItem.rightBarButtonItem = bar;
    bar.br_barItemAcceptEventInterval = 5;

//    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithCustomView:[self addRightItemWithImage:@"rightItem" action:@selector(sleedsjasdakdjad:)]];
//     self.navigationItem.rightBarButtonItem = bar;
//    
//    bar.br_barItemAcceptEventInterval = 5;
    // Do any additional setup after loading the view, typically from a nib.
}
- (UIButton *)addRightItemWithImage:(NSString *)imageName action:(SEL)action {
    
    
    UIView *outView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 30, 30)];
    UIButton *button = [[UIButton alloc] init];
    UIImage *image = [UIImage imageNamed:imageName];
    button.frame = outView.bounds;
    // 这里需要注意：由于是想让图片右移，所以left需要设置为正，right需要设置为负。正在是相反的。
    // 让按钮图片右移15
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:16];

    [outView addSubview:button];
    return outView;
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
