//
//  NSBundle+CPNavgationController.h
//  CPNavgationController_Demo
//
//  Created by 陈平 on 2019/8/31.
//  Copyright © 2019 陈平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (CPNavgationController)

+ (instancetype)cp_refreshBundle;

+ (UIImage *)cp_backImage;

+ (UIImage *)cp_closeImage;


@end

NS_ASSUME_NONNULL_END
