//
//  UIBarButtonItem+Repeat.m
//  BRUIControlRepeat
//
//  Created by gitBurning on 16/1/8.
//  Copyright © 2016年 BR. All rights reserved.
//

#import "UIBarButtonItem+Repeat.h"
#import "BRRepeatDefine.h"


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
        
        if (self.customView) {
            
            id sender = [self getButton];

            if ([sender isKindOfClass:[UIButton class]]) {
                UIButton *tempSender = sender;
                tempSender.br_controllAcceptEventInterval = br_barItemAcceptEventInterval;
                
            }
            else if ([sender isKindOfClass:[UIView class]]){
                
                UIView *tempView = sender;

                [tempView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[UIButton class]]) {
                        UIButton *tempSender = (id)obj;
                        tempSender.br_controllAcceptEventInterval = br_barItemAcceptEventInterval;
                        
                        *stop = YES;
                    }
                }];
            }
            
        }else{
           
            UIButton * sender = [self getButton];
            if ([sender isKindOfClass:[UIButton class]]) {
                sender.br_controllAcceptEventInterval = br_barItemAcceptEventInterval;

            }
        }
       
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
    /*!
     *  @brief (lldb) po [self valueForKey:@"_view"]
     <UINavigationButton: 0x7f8673c13c10; frame = (280 7; 32 30); opaque = NO; layer = <CALayer: 0x7f8673c141e0>>
     
     UINavigationButton 是 私有的 但是 是继承 UIbutton
     */
    id  sender = [self valueForKey:@"_view"]; //获取 按钮  UIBarButtonItem
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
