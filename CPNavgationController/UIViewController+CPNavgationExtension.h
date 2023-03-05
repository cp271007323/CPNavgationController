//
//  UIViewController+CPNavigationExtension.h
//  测试
//
//  Created by lk03 on 2017/8/7.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPNavgationController;

@interface UIViewController (CPNavigationExtension)

@property (nonatomic , assign) BOOL cp_fullScreenPopGestureEnabled;

@property (nonatomic , assign) BOOL cp_isPrenset;

@property (nonatomic , assign) BOOL cp_popGestureDisenabled;

@property (nonatomic , strong) CPNavgationController *cp_navigationController;

- (UIImageView *)hiddenHairlineImageViewUnder:(UIView *)view;

/// 从当前的导航跳转中移除当前控制器
- (void)removeCurrentViewControFromCP_viewControllers;

/// 从当前的导航跳转中移除全部控制器，仅留RootViewController
- (void)removeAllViewControFromCP_viewControllers;

@end
