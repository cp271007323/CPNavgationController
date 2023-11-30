//
//  CPWrapViewController.m
//  测试
//
//  Created by lk03 on 2017/8/7.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import "CPWrapViewController.h"
#import "CPWrapNavgationController.h"
#import "UIViewController+CPNavgationExtension.h"
#import "NSBundle+CPNavgationController.h"

@interface CPWrapViewController ()
@property (nonatomic , assign) CPWrapNavgationController *contentWrapNavController;
@end

static NSValue *cp_tabBarRectValue;

@implementation CPWrapViewController

+ (CPWrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController{
    CPWrapNavgationController *wrapNavController = [[CPWrapNavgationController alloc] init];
    wrapNavController.viewControllers = @[viewController];
    CPWrapViewController *wrapViewController = [[CPWrapViewController alloc] init];
    wrapViewController.contentWrapNavController = wrapNavController;
    [wrapViewController addChildViewController:wrapNavController];
    return wrapViewController;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (self.tabBarController && !cp_tabBarRectValue)
    {
        cp_tabBarRectValue = [NSValue valueWithCGRect:self.tabBarController.tabBar.frame];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.tabBarController && [self rootViewController].hidesBottomBarWhenPushed)
    {
        self.tabBarController.tabBar.frame = CGRectZero;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (![self.view.subviews containsObject:self.contentWrapNavController.view])
    {
        [self.view addSubview:self.contentWrapNavController.view];
    }
    
    self.tabBarController.tabBar.translucent = YES;
    if (self.tabBarController && !self.tabBarController.tabBar.hidden && cp_tabBarRectValue)
    {
        self.tabBarController.tabBar.frame = cp_tabBarRectValue.CGRectValue;
    }
    [self addPresentBackItem];
}

- (void)addPresentBackItem{
    if (self.rootViewController.cp_isPrenset)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[NSBundle cp_closeImage] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 40, 40);
        [btn addTarget:self action:@selector(dissMiss) forControlEvents:UIControlEventTouchUpInside];
        self.rootViewController.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:btn]];
    }
}

- (void)dissMiss{
    [self.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)cp_fullScreenPopGestureEnabled {
    return [self rootViewController].cp_fullScreenPopGestureEnabled;
}

- (BOOL)hidesBottomBarWhenPushed {
    return [self rootViewController].hidesBottomBarWhenPushed;
}

- (UITabBarItem *)tabBarItem {
    return [self rootViewController].tabBarItem;
}

- (NSString *)title {
    return [self rootViewController].title;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return [self rootViewController];
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return [self rootViewController];
}

- (UIViewController *)rootViewController {
    CPWrapNavgationController *wrapNavController = self.childViewControllers.firstObject;
    return wrapNavController.viewControllers.firstObject;
}

@end

