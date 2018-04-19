//
//  UIViewController+AutoLayoutDebugging.m
//  dadaShop
//
//  Created by zhujinhui on 2018/4/17.
//  Copyright © 2018年 DaDa Inc. All rights reserved.
//

#import "UIViewController+AutoLayoutDebugging.h"
#import "UIView+AutoLayoutDebugging.h"
#import "STFAutoLayoutDebugManager.h"

@implementation UIViewController (AutoLayoutDebugging)

#ifdef DEBUG
+ (void)load
{
    Method m1;
    Method m2;
    
    m1 = class_getInstanceMethod(self, @selector(ald_ViewDidAppear:));
    m2 = class_getInstanceMethod(self, @selector(viewDidAppear:));
    method_exchangeImplementations(m1, m2);
}

- (void)ald_ViewDidAppear:(BOOL)animated
{
    if (STFAutoLayoutDebugManager.defaultManger.enableDebugMode) {
        [self debug_exerciseAmbiguityInLayout];
    }
    
    [self ald_ViewDidAppear:animated];
}


- (void)debug_exerciseAmbiguityInLayout{
    [self TraverseAllSubviews:self.view];
}

//遍历父视图的所有子视图，包括嵌套的子视图
-(void)TraverseAllSubviews:(UIView *)view
{
    for (UIView *subView in view.subviews)
    {
        if (subView.subviews.count) {
            [self TraverseAllSubviews:subView];
        }
        
        if (subView.hasAmbiguousLayout) {
            subView.layer.borderColor = UIColor.redColor.CGColor;
            subView.layer.borderWidth = 1.f;
            
            [subView exerciseAmbiguityInLayoutRepeatedly:YES];
        }
    }
}

#endif

@end
