//
//  LHAnimation.h
//  EasyJoy
//
//  Created by LiHong on 13-12-2.
//  Copyright (c) 2013年 李红(410139419@qq.com). All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @brief 动画类型
 */
typedef NS_ENUM(NSInteger, LHAnimationType){
    LHAnimationTypeNone,
    LHAnimationTypeFadeTo,
    LHAnimationTypeFadeBy,
    LHAnimationTypeTranslationTo,
    LHAnimationTypeTranslationBy,
    LHAnimationTypeScaleTo,
    LHAnimationTypeScaleBy,
    LHAnimationTypeRotationTo,
    LHAnimationTypeRotationBy
};

typedef void (^LHAnimationCompleted)(id obj);

@class LHAnimation;

/**
 * @brief 动画协议
 */
@protocol LHAnimationProtocol  <NSObject>
@required
- (CGFloat)duration;
- (CGFloat)delay;
- (LHAnimationType)animationType;
- (LHAnimation *)animationInstance;

@end

/**
 * @brief 基类
 */
@interface LHAnimation : NSObject <LHAnimationProtocol>
{
    @private
    CGFloat _duration;
    CGFloat _delay;
    LHAnimationType _animationType;
}

/**
 * 动画完成时候回调此Block。回调前应该进行非空检查
 */
@property (nonatomic, copy) LHAnimationCompleted acHandler;

- (id<LHAnimationProtocol>)animationInstance;

- (CGFloat)duration;
- (CGFloat)delay;
- (void)setDelay:(CGFloat)delay;
- (void)setDuration:(CGFloat)duration;
- (LHAnimationType)animationType;
- (void)setAnimationType:(LHAnimationType)type;

@end

/**
 * @brief 淡入淡出动画
 */
@interface LHFadeAnimation : LHAnimation

@property (nonatomic, assign) CGFloat alpha;

+ (LHFadeAnimation *)actionTo:(CGFloat)alpha duration:(CGFloat)duration delay:(CGFloat)delay;
+ (LHFadeAnimation *)actionBy:(CGFloat)alpha duration:(CGFloat)duration delay:(CGFloat)delay;

@end


/**
 * @brief 平移动画
 */
@interface LHTranslationAnimation : LHAnimation

@property (nonatomic, assign) CGPoint point;

+ (LHTranslationAnimation *)actionTo:(CGPoint)point duration:(CGFloat)duration delay:(CGFloat)delay;
+ (LHTranslationAnimation *)actionBy:(CGPoint)point duration:(CGFloat)duration delay:(CGFloat)delay;

@end

/**
 * @brief 缩放动画
 */
@interface LHScaleAnimation : LHAnimation

@property (nonatomic, assign) CGPoint sclae;

+ (LHScaleAnimation *)actionTo:(CGPoint)scale duration:(CGFloat)duration delay:(CGFloat)delay;
+ (LHScaleAnimation *)actionBy:(CGPoint)scale duration:(CGFloat)duration delay:(CGFloat)delay;

@end


/**
 * @brief 旋转动画
 */
@interface LHRotationAnimation : LHAnimation

@property (nonatomic,assign) CGFloat angle;

+ (LHRotationAnimation *)actionTo:(CGFloat)angle duration:(CGFloat)duration delay:(CGFloat)delay;
+ (LHRotationAnimation *)actionBy:(CGFloat)angle duration:(CGFloat)duration delay:(CGFloat)delay;

@end


/**
 * @brief 动画队列。如果未设置循环队列动画，那么加入到队列中的动画会被按照FIFO的方式执行
 */
@interface LHAnimationQueue : LHAnimation
{
    @private
    BOOL _loop;
    NSUInteger _index;
    NSMutableArray *_queue;
}

+ (LHAnimationQueue *)action:(BOOL)loop;

- (void)pushAction:(id<LHAnimationProtocol>)action;

@end

