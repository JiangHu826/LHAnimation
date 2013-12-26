//
//  UIView+LHAnimation.m
//  EasyJoy
//
//  Created by LiHong on 13-12-2.
//  Copyright (c) 2013年 李红(410139419@qq.com). All rights reserved.
//

#import "UIView+LHAnimation.h"

@implementation UIView (Animation)

- (void)runAction:(id<LHAnimationProtocol>)action
{
    LHAnimation *animation = [action animationInstance];
    if(animation == nil){
        return;
    }
    
    CGPoint center = self.center;
    CGFloat alpha = self.alpha;
    CGAffineTransform transform = self.transform;
    
    switch([animation animationType]){
        case LHAnimationTypeFadeTo:{
            LHFadeAnimation *fadeA = (LHFadeAnimation *)animation;
            alpha = fadeA.alpha;
            break;
        }
            
        case LHAnimationTypeFadeBy:{
            LHFadeAnimation *fadeA = (LHFadeAnimation *)animation;
            alpha += fadeA.alpha;
            break;
        }
            
        case LHAnimationTypeTranslationTo:{
            LHTranslationAnimation *translationA = (LHTranslationAnimation *)animation;
            center = translationA.point;
            break;
        }
            
        case LHAnimationTypeTranslationBy:{
            LHTranslationAnimation *translationA = (LHTranslationAnimation *)animation;
            center.x += translationA.point.x;
            center.y += translationA.point.y;
            break;
        }
            
        case LHAnimationTypeScaleTo:{
            LHScaleAnimation *scaleA = (LHScaleAnimation *)animation;
            transform = CGAffineTransformMakeScale(scaleA.sclae.x, scaleA.sclae.y);
            break;
        }
            
        case LHAnimationTypeScaleBy:{
            LHScaleAnimation *scaleA = (LHScaleAnimation *)animation;
            transform = CGAffineTransformScale(transform, scaleA.sclae.x, scaleA.sclae.y);
            break;
        }
            
        case LHAnimationTypeRotationTo:{
            LHRotationAnimation *rotationA = (LHRotationAnimation *)animation;
            transform = CGAffineTransformMakeRotation(rotationA.angle * (M_PI / 180.0));
            break;
        }
            
        case LHAnimationTypeRotationBy:{
            LHRotationAnimation *rotationA = (LHRotationAnimation *)animation;
            transform = CGAffineTransformRotate(transform, rotationA.angle * (M_PI / 180.0));
            break;
        }
        
        default:break;
    }
    
    
    [UIView animateWithDuration:[animation duration]
                          delay:[animation delay]
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.center    = center;
                         self.alpha     = alpha;
                         self.transform = transform;
    } completion:^(BOOL finished) {
        if(finished){
            if(animation.acHandler){
                animation.acHandler(NULL);
            }
            
            if ([action isKindOfClass:[LHAnimationQueue class]]){
                LHAnimationQueue *AQ  = (LHAnimationQueue*)action;
                [self runAction:AQ];
            }
        }
    }];
}

@end
