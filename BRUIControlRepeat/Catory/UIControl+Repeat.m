//
//  UIControl+Repeat.m
//  RepeatSeletdButtonObject_C
//
//  Created by gitBurning on 15/9/26.
//  Copyright © 2015年 BR. All rights reserved.
//

#import "UIControl+Repeat.h"
#import <objc/runtime.h>
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_selectdAction = "UIControl_action";

static const char *UIControl_selectedStatus = "UIControl_selectedStatus";
static const char *UIControl_unSelectedStatus = "UIControl_unSelectedStatus";

@interface UIControl ()
@property (assign,nonatomic) BOOL br_hadSelectedButton;

@end
@implementation UIControl (Repeat)
+ (void)load
{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(br_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
    
    
    Method c  = class_getInstanceMethod(self, @selector(addTarget:action:forControlEvents:));
    Method d = class_getInstanceMethod(self, @selector(br_addTarget:action:forControlEvents:));
    method_exchangeImplementations(c, d);

}



#pragma mark - property
- (NSTimeInterval)br_controllAcceptEventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}
- (void)setBr_controllAcceptEventInterval:(NSTimeInterval)br_controllAcceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(br_controllAcceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setBr_hadSelectedButton:(BOOL)br_hadSelectedButton
{
    self.enabled=!br_hadSelectedButton;
    
    if (br_hadSelectedButton) {
        
        if (self.selectedBlcok) {
            self.selectedBlcok(self);
        }
    }
    else
        {
        if (self.unSelectedBlock) {
            self.unSelectedBlock(self);
        }
    }
    
    objc_setAssociatedObject(self, UIControl_selectdAction, @(br_hadSelectedButton), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)br_hadSelectedButton
{
    return [objc_getAssociatedObject(self, UIControl_selectdAction) boolValue];

}

-(void)setSelectedBlcok:(br_SetSelectedBlock)selectedBlcok
{
       objc_setAssociatedObject(self, UIControl_selectedStatus, selectedBlcok, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}
-(br_SetSelectedBlock)selectedBlcok
{
    
    
    br_SetSelectedBlock blcok = objc_getAssociatedObject(self, UIControl_selectedStatus);
    
    if (!blcok) {
        blcok = ^(UIButton * sender){
            self.layer.opacity = 0.5;
        };
    }

    return  blcok;
}

-(void)setUnSelectedBlock:(br_SetDefaultSelectedBlock)unSelectedBlock
{
    if (unSelectedBlock) {
        unSelectedBlock(self);
    }
    objc_setAssociatedObject(self, UIControl_unSelectedStatus, unSelectedBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}
-(br_SetDefaultSelectedBlock)unSelectedBlock
{
    
    br_SetDefaultSelectedBlock blcok = objc_getAssociatedObject(self, UIControl_unSelectedStatus);
    
    if (!blcok) {
        blcok = ^(UIButton*sender){
            self.layer.opacity = 1.0;
        };
    }
    
    return blcok;

}
#pragma mark -action

- (void)br_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.br_hadSelectedButton) return;
    
    self.br_controllAcceptEventInterval = 5;
    if (self.br_controllAcceptEventInterval > 0)
        {
        self.br_hadSelectedButton = YES;
        [self performSelector:@selector(setBr_hadSelectedButton:) withObject:@(NO) afterDelay:self.br_controllAcceptEventInterval];
    }
    [self br_sendAction:action to:target forEvent:event];
}
- (void)br_addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
{
    
    [self br_addTarget:target action:action forControlEvents:controlEvents];
    
}


#pragma mark - public
-(void)addSelectedBlcokStatus:(br_SetSelectedBlock)selectedBlcok unSelectedBlock:(br_SetDefaultSelectedBlock)unSelectedBlock
{
    if (selectedBlcok) {
        self.selectedBlcok=selectedBlcok;
    }
    if (unSelectedBlock) {
        self.unSelectedBlock=unSelectedBlock;
    }
}


@end
