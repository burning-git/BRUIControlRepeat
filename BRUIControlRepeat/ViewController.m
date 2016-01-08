//
//  ViewController.m
//  RepeatSeletdButtonObject_C
//
//  Created by gitBurning on 15/9/26.
//  Copyright © 2015年 BR. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+Repeat.h"
#import "UIBarButtonItem+Repeat.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Burning_git";
    self.button.br_controllAcceptEventInterval = 10;
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
    
    
    UIBarButtonItem * bar = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(sleedsjasdakdjad:)];
    self.navigationItem.rightBarButtonItem = bar;
    bar.br_barItemAcceptEventInterval = 5;
    //[bar setValue:@(5) forKey:@"br_controllAcceptEventInterval"];
    // Do any additional setup after loading the view, typically from a nib.
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
