//
//  UIView+AutoLayoutDebugging.m
//  dadaShop
//
//  Created by zhujinhui on 2018/4/17.
//  Copyright © 2018年 DaDa Inc. All rights reserved.
//

#import "UIView+AutoLayoutDebugging.h"

@implementation UIView (AutoLayoutDebugging)


- (void)exerciseAmbiguityInLayoutRepeatedly:(BOOL)recursive
{
#ifdef DEBUG
    if (self.hasAmbiguousLayout) {
        [NSTimer scheduledTimerWithTimeInterval:.5
                                         target:self
                                       selector:@selector(exerciseAmbiguityInLayout)
                                       userInfo:nil
                                        repeats:YES];
    }
    if (recursive) {
        for (UIView *subview in self.subviews) {
            [subview exerciseAmbiguityInLayoutRepeatedly:YES];
        }
    }
#endif
}


@end
