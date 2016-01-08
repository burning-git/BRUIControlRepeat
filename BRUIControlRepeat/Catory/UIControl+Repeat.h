//
//  UIControl+Repeat.h
//  RepeatSeletdButtonObject_C
//
//  Created by gitBurning on 15/9/26.
//  Copyright © 2015年 BR. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BRRepeatWeak(weakSelf)  __weak __typeof(&*self)weakSelf = self;

typedef void(^br_SetSelectedBlock)(id sender);
typedef void(^br_SetDefaultSelectedBlock)(id sender);

@interface UIControl (Repeat)
@property (nonatomic, assign) NSTimeInterval br_controllAcceptEventInterval;   // 可以用这个给重复点击加间隔

/**
 * 设置 点中状态 blcok
 */
@property (copy,nonatomic) br_SetSelectedBlock selectedBlcok;

/**
 *   设置 默认状态 blcok
 */
@property (copy,nonatomic) br_SetDefaultSelectedBlock unSelectedBlock;

/**
 *  增加 点击 状态 blcok
 *
 *  @param selectedBlcok   <#selectedBlcok description#>
 *  @param unSelectedBlock <#unSelectedBlock description#>
 */
-(void)addSelectedBlcokStatus:(br_SetSelectedBlock)selectedBlcok unSelectedBlock:(br_SetDefaultSelectedBlock)unSelectedBlock;

@end
