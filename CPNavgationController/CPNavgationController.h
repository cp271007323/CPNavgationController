//
//  CPNavgationController.h
//  测试
//
//  Created by lk03 on 2017/8/7.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+CPNavgationExtension.h"

@interface CPNavgationController : UINavigationController

@property (nonatomic, strong) UIImage *backButtonImage;

@property (nonatomic, assign) BOOL fullScreenPopGestureEnabled;

@property (nonatomic, copy, readonly) NSArray<UIViewController *> *cp_viewControllers;

+ (instancetype)rootViewController:(__kindof UIViewController *)viewController;
@end
