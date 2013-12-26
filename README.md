
#使用方法 
----------
```objective-c
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    LHTranslationAnimation *translation = [LHTranslationAnimation actionTo:CGPointMake(200, 200) duration:1 delay:0];
    LHScaleAnimation *scale = [LHScaleAnimation actionTo:CGPointMake(0.5, 0.5) duration:1 delay:0];
    LHScaleAnimation *scale2 = [LHScaleAnimation actionTo:CGPointMake(1.0, 1.0) duration:1 delay:0];
    LHRotationAnimation *roation = [LHRotationAnimation actionTo:250 duration:2 delay:0];
    LHFadeAnimation *fade = [LHFadeAnimation actionTo:0.1 duration:1 delay:0];
    LHFadeAnimation *fade2 = [LHFadeAnimation actionTo:1.0 duration:1 delay:0];
    LHTranslationAnimation *translation2 = [LHTranslationAnimation actionTo:CGPointMake(100, 100) duration:4 delay:0];
    
    LHAnimationQueue *queue = [LHAnimationQueue  action:YES];
    [queue pushAction:translation];
    [queue pushAction:scale];
    [queue pushAction:scale2];
    [queue pushAction:roation];
    [queue pushAction:fade];
    [queue pushAction:fade2];
    [queue pushAction:translation2];
    
    [view runAction:queue];
```
