//
//  STFAutoLayoutDebugManager.h
//  dadaShop
//
//  Created by zhujinhui on 2018/4/17.
//  Copyright © 2018年 DaDa Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STFAutoLayoutDebugManager:NSObject

/**
 开启Debug模式
 
 */
@property(nonatomic,assign) BOOL enableDebugMode;

/**
 *  STFAutoLayoutDebugManager
 *
 *  @return STFAutoLayoutDebugManager
 */
+ (instancetype)defaultManger;


@end
