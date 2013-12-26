//
//  UIView+EJAnimation.h
//  EasyJoy
//
//  Created by LiHong on 13-12-2.
//  Copyright (c) 2013年 李红(410139419@qq.com). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHAnimation.h"

@interface UIView (EJAnimation)

- (void)runAction:(id<LHAnimationProtocol>)action;

@end
