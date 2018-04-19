//
//  STFAutoLayoutDebugManager.m
//  dadaShop
//
//  Created by zhujinhui on 2018/4/17.
//  Copyright © 2018年 DaDa Inc. All rights reserved.
//

#import "STFAutoLayoutDebugManager.h"
#import "UIViewController+AutoLayoutDebugging.h"

@implementation STFAutoLayoutDebugManager


+ (instancetype)defaultManger
{
    static STFAutoLayoutDebugManager *_manger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_manger == nil) {
            _manger = [[self alloc] init];
        }
    });
    return _manger;
}

-(BOOL)enableDebugMode
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"enableAutolayoutdebug"];
}

-(void)setEnableDebugMode:(BOOL)enableDebugMode
{
    [[NSUserDefaults standardUserDefaults] setBool:enableDebugMode forKey:@"enableAutolayoutdebug"];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.enableDebugMode = YES;
    }
    return self;
}

@end
