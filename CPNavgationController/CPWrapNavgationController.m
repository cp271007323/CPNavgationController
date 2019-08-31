//
//  CPWrapNavgationController.m
//  测试
//
//  Created by lk03 on 2017/8/7.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import "CPWrapNavgationController.h"
#import "CPNavgationController.h"
#import "UIViewController+CPNavgationExtension.h"
#import "CPWrapViewController.h"
#import "NSBundle+CPNavgationController.h"

@interface CPWrapNavgationController ()

@end

@implementation CPWrapNavgationController

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    return [self.navigationController popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    return [self.navigationController popToRootViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    CPNavgationController *cp_NavigationController = viewController.cp_navigationController;
    NSInteger index = [cp_NavigationController.cp_viewControllers indexOfObject:viewController];
    return [self.navigationController popToViewController:cp_NavigationController.viewControllers[index] animated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.cp_navigationController = (CPNavgationController *)self.navigationController;
    viewController.cp_fullScreenPopGestureEnabled = viewController.cp_navigationController.fullScreenPopGestureEnabled;
    
    UIImage *defaultBackImage = viewController.cp_navigationController.backButtonImage;
    if (!defaultBackImage)
    {
        defaultBackImage = [NSBundle cp_backImage];
    }
    
    if (self.childViewControllers.count > 0)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:defaultBackImage forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 40, 40);
        [btn addTarget:self action:@selector(didTapBackButton) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:btn]];
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
    }
    
    [self.navigationController pushViewController:[CPWrapViewController wrapViewControllerWithViewController:viewController] animated:animated];
}

- (void)didTapBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    [self.navigationController dismissViewControllerAnimated:flag completion:completion];
    self.viewControllers.firstObject.cp_navigationController = nil;
}

@end

