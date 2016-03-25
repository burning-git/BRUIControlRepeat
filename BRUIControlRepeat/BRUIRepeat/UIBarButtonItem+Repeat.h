//
//  UIBarButtonItem+Repeat.h
//  BRUIControlRepeat
//
//  Created by gitBurning on 16/1/8.
//  Copyright © 2016年 BR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRRepeatDefine.h"

@interface UIBarButtonItem (Repeat)
typedef void(^br_ItemSetSelectedBlock)(id info);
typedef void(^br_ItemSetDefaultSelectedBlock)(id info);

@property (nonatomic, assign) NSTimeInterval br_barItemAcceptEventInterval;   // 可以用这个给重复点击加间隔


/**
 * 设置 点中状态 blcok
 */
@property (copy,nonatomic) br_ItemSetSelectedBlock selectedBlcok;

/**
 *   设置 默认状态 blcok
 */
@property (copy,nonatomic) br_ItemSetDefaultSelectedBlock unSelectedBlock;

/**
 *  增加 点击 状态 blcok
 *
 *  @param selectedBlcok   <#selectedBlcok description#>
 *  @param unSelectedBlock <#unSelectedBlock description#>
 */
-(void)itemAddSelectedBlcokStatus:(br_ItemSetSelectedBlock)selectedBlcok unSelectedBlock:(br_ItemSetDefaultSelectedBlock)unSelectedBlock;

@end
