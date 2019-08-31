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
@end
