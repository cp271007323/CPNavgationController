//
//  NSBundle+CPNavgationController.m
//  CPNavgationController_Demo
//
//  Created by 陈平 on 2019/8/31.
//  Copyright © 2019 陈平. All rights reserved.
//

#import "NSBundle+CPNavgationController.h"
#import "CPNavgationController.h"

@implementation NSBundle (CPNavgationController)

+ (instancetype)cp_refreshBundle
{
    static NSBundle *refreshBundle = nil;
    if (refreshBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        refreshBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[CPNavgationController class]] pathForResource:@"CPNavgationController" ofType:@"bundle"]];
    }
    return refreshBundle;
}

+ (UIImage *)cp_backImage
{
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
        arrowImage = [UIImage imageWithContentsOfFile:[[self cp_refreshBundle] pathForResource:@"fanhui@2x" ofType:@"png"]];
    }
    return arrowImage;
}

+ (UIImage *)cp_closeImage
{
    static UIImage *arrowImage = nil;
    if (arrowImage == nil) {
        arrowImage = [UIImage imageWithContentsOfFile:[[self cp_refreshBundle] pathForResource:@"guanbi@2x" ofType:@"png"]];
    }
    return arrowImage;
}

@end
