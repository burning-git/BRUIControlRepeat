//
//  BRRepeatDefine.h
//  BRUIControlRepeat
//
//  Created by gitBurning on 16/3/24.
//  Copyright © 2016年 BR. All rights reserved.
//

#ifndef BRRepeatDefine_h
#define BRRepeatDefine_h

#define BRRepeatWeak(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define BRDefineSetRepeatInterval(time) [UIControl setDefualtInterval:time];
#import "UIBarButtonItem+Repeat.h"
#import "UIControl+BR_Repeat.h"
#endif /* BRRepeatDefine_h */
