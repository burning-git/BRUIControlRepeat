//
//  UIBarButtonItem+Repeat.m
//  BRUIControlRepeat
//
//  Created by gitBurning on 16/1/8.
//  Copyright © 2016年 BR. All rights reserved.
//

#import "UIBarButtonItem+Repeat.h"
#import "UIControl+BR_Repeat.h"
#import <objc/runtime.h>
static const char *BarItem_acceptEventInterval = "bar_acceptEventInterval";

static const char *BarItem_selectedStatus = "br_ItemSetSelectedBlock";
static const char *BarItem_unSelectedStatus = "br_ItemSetDefaultSelectedBlock";

@implementation UIBarButtonItem (Repeat)
#pragma mark - 增加方法
-(NSTimeInterval)br_barItemAcceptEventInterval
{
    return [objc_getAssociatedObject(self, BarItem_acceptEventInterval) doubleValue];

}
-(void)setBr_barItemAcceptEventInterval:(NSTimeInterval)br_barItemAcceptEventInterval
{
    objc_setAssociatedObject(self, BarItem_acceptEventInterval, @(br_barItemAcceptEventInterval), OBJC_ASSOCIATION_ASSIGN);

    if (br_barItemAcceptEventInterval>0) {
        
        UIButton * sender = [self getButton];
        sender.br_controllAcceptEventInterval = br_barItemAcceptEventInterval;
    }

    
}


-(br_ItemSetSelectedBlock)selectedBlcok
{
    return objc_getAssociatedObject(self, BarItem_selectedStatus);
}
-(void)setSelectedBlcok:(br_ItemSetSelectedBlock)selectedBlcok
{
    objc_setAssociatedObject(self, BarItem_selectedStatus, selectedBlcok, OBJC_ASSOCIATION_COPY);
    if (selectedBlcok) {
        UIButton * sender = [self getButton];
        sender.selectedBlcok = selectedBlcok;

    }
}

-(br_ItemSetDefaultSelectedBlock)unSelectedBlock
{
    return objc_getAssociatedObject(self, BarItem_unSelectedStatus);

}
-(void)setUnSelectedBlock:(br_ItemSetDefaultSelectedBlock)unSelectedBlock
{
    objc_setAssociatedObject(self, BarItem_unSelectedStatus, unSelectedBlock, OBJC_ASSOCIATION_COPY);
    if (unSelectedBlock) {
        UIButton * sender = [self getButton];
        sender.selectedBlcok = unSelectedBlock;
        
    }

}
-(UIButton*)getButton
{
    UIButton * sender = [[self target] valueForKey:@"button"]; //获取 按钮
    sender = nil;
    return sender;
}
#pragma mark - 外部api
-(void)itemAddSelectedBlcokStatus:(br_ItemSetSelectedBlock)selectedBlcok unSelectedBlock:(br_ItemSetDefaultSelectedBlock)unSelectedBlock
{
    if (selectedBlcok) {
        self.selectedBlcok = selectedBlcok;
    }
    
    if (unSelectedBlock) {
        self.unSelectedBlock = unSelectedBlock;
    }
    
    if (selectedBlcok && unSelectedBlock) {
        UIButton * sender = [self getButton];
        [sender addSelectedBlcokStatus:selectedBlcok unSelectedBlock:unSelectedBlock];
    }
    
    
}


@end
