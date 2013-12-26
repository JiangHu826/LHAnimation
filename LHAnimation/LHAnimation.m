//
//  LHAanimation.m
//  EasyJoy
//
//  Created by LiHong on 13-12-2.
//  Copyright (c) 2013年 李红(410139419@qq.com). All rights reserved.
//

#import "LHAnimation.h"

@implementation LHAnimation

- (CGFloat)duration
{
    return _duration;
}

-(void)setDuration:(CGFloat)duration
{
    _duration = duration;
}

- (CGFloat)delay
{
    return _delay;
}

- (void)setDelay:(CGFloat)delay
{
    _delay = delay;
}

- (LHAnimationType)animationType
{
    return _animationType;
}

- (void) setAnimationType:(LHAnimationType)type
{
    _animationType = type;
}

- (LHAnimation *)animationInstance
{
    return self;
}

@end


@implementation LHFadeAnimation

+ (LHFadeAnimation *)actionTo:(CGFloat)alpha duration:(CGFloat)duration delay:(CGFloat)delay
{
    LHFadeAnimation *animation  = [LHFadeAnimation new];
    animation.alpha = alpha;
    [animation setDelay:delay];
    [animation setDuration:duration];
    [animation setAnimationType:LHAnimationTypeFadeTo];
    return animation;
}

+ (LHFadeAnimation *)actionBy:(CGFloat)alpha duration:(CGFloat)duration delay:(CGFloat)delay
{
    LHFadeAnimation *animation  = [LHFadeAnimation new];
    animation.alpha = alpha;
    [animation setDelay:delay];
    [animation setDuration:duration];
    [animation setAnimationType:LHAnimationTypeFadeBy];
    return animation;
}

@end



@implementation LHTranslationAnimation

+ (LHTranslationAnimation *)actionTo:(CGPoint)point duration:(CGFloat)duration delay:(CGFloat)delay
{
    LHTranslationAnimation *animation = [LHTranslationAnimation new];
    animation.point = point;
    [animation setDelay:delay];
    [animation setDuration:duration];
    [animation setAnimationType:LHAnimationTypeTranslationTo];
    return animation;
}

+ (LHTranslationAnimation *)actionBy:(CGPoint)point duration:(CGFloat)duration delay:(CGFloat)delay
{
    LHTranslationAnimation *animation = [LHTranslationAnimation new];
    animation.point = point;
    [animation setDelay:delay];
    [animation setDuration:duration];
    [animation setAnimationType:LHAnimationTypeTranslationBy];
    return animation;
}

@end


@implementation LHScaleAnimation

+ (LHScaleAnimation *)actionTo:(CGPoint)scale duration:(CGFloat)duration delay:(CGFloat)delay
{
    LHScaleAnimation *animation = [LHScaleAnimation new];
    animation.sclae =  scale;
    [animation setDelay:delay];
    [animation setDuration:duration];
    [animation setAnimationType:LHAnimationTypeScaleTo];
    return animation;
}


+ (LHScaleAnimation *)actionBy:(CGPoint)scale duration:(CGFloat)duration delay:(CGFloat)delay
{
    LHScaleAnimation *animation = [LHScaleAnimation new];
    animation.sclae =  scale;
    [animation setDelay:delay];
    [animation setDuration:duration];
    [animation setAnimationType:LHAnimationTypeScaleBy];
    return animation;
}

@end


@implementation LHRotationAnimation

+ (LHRotationAnimation *)actionTo:(CGFloat)angle duration:(CGFloat)duration delay:(CGFloat)delay
{
    LHRotationAnimation *animation = [LHRotationAnimation new];
    animation.angle = angle;
    [animation setDelay:delay];
    [animation setDuration:duration];
    [animation setAnimationType:LHAnimationTypeRotationTo];
    return animation;
}

+ (LHRotationAnimation *)actionBy:(CGFloat)angle duration:(CGFloat)duration delay:(CGFloat)delay
{
    LHRotationAnimation *animation = [LHRotationAnimation new];
    animation.angle = angle;
    [animation setDelay:delay];
    [animation setDuration:duration];
    [animation setAnimationType:LHAnimationTypeRotationBy];
    return animation;
}

@end


@implementation LHAnimationQueue

+ (LHAnimationQueue *)action:(BOOL)loop
{
    LHAnimationQueue *aQueue = [LHAnimationQueue new];
    [aQueue setLoop:loop];
    return aQueue;
}

- (id)init
{
    if(self = [super init]){
        _loop  = NO;
        _index = 0;
        _queue = [NSMutableArray new];
    }
    return self;
}

- (void)setLoop:(BOOL)loop
{
    _loop = loop;
}

- (void)pushAction:(id<LHAnimationProtocol>)action
{
    [_queue addObject:action];
}

- (id<LHAnimationProtocol>)popAction
{
    if(_queue.count){
        id<LHAnimationProtocol> obj = _queue[0];
        [_queue removeObjectAtIndex:0];
        return obj;
    }
    return nil;
}

- (id<LHAnimationProtocol>)animationInstance
{
    id<LHAnimationProtocol> obj;
    if(_loop == NO){
        return  [self popAction];
    }
    
    obj = _queue[_index];
    _index = (_index == (_queue.count - 1)) ? 0 : _index + 1;
    return obj;
}
@end
