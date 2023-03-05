//
//  CPNavgationController.m
//  测试
//
//  Created by lk03 on 2017/8/7.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import "CPNavgationController.h"
#import "UIViewController+CPNavgationExtension.h"
#import "CPWrapViewController.h"

@interface CPNavgationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *popPanGesture;

@property (nonatomic, strong) id popGestureDelegate;

@end

@implementation CPNavgationController

+ (instancetype)rootViewController:(__kindof UIViewController *)viewController{
    return [[self alloc] initWithRootViewController:viewController];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if (self = [super init])
        {
        rootViewController.cp_navigationController = self;
        self.viewControllers = @[[CPWrapViewController wrapViewControllerWithViewController:rootViewController]];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self)
        {
        self.viewControllers.firstObject.cp_navigationController = self;
        self.viewControllers = @[[CPWrapViewController wrapViewControllerWithViewController:self.viewControllers.firstObject]];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setNavigationBarHidden:YES];
    self.delegate = self;
    
    self.popGestureDelegate = self.interactivePopGestureRecognizer.delegate;
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    self.popPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.popGestureDelegate action:action];
    self.popPanGesture.maximumNumberOfTouches = 1;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //根视图
    BOOL isRootVC = viewController == navigationController.viewControllers.firstObject;
    //是否禁止右滑
    CPWrapViewController *wrapViewController = (CPWrapViewController *)viewController;
    BOOL popEnable = wrapViewController.rootViewController.cp_popGestureDisenabled;
    
    //右滑
    if (!popEnable)
        {
        //全屏滑动
        if (viewController.cp_fullScreenPopGestureEnabled)
        {
            //根视图、移除手势
            if (isRootVC)
        {
                [self.view removeGestureRecognizer:self.popPanGesture];
            }
            //非根视图、添加手势
            else{
                [self.view addGestureRecognizer:self.popPanGesture];
            }
            self.interactivePopGestureRecognizer.delegate = self.popGestureDelegate;
            self.interactivePopGestureRecognizer.enabled = NO;
        }
        //非全屏滑动
        else{
            [self.view removeGestureRecognizer:self.popPanGesture];
            self.interactivePopGestureRecognizer.delegate = self;
            self.interactivePopGestureRecognizer.enabled = !isRootVC;
        }
    }
    //禁止右滑
    else{
        [self.view removeGestureRecognizer:self.popPanGesture];
        self.interactivePopGestureRecognizer.delegate = nil;
        self.interactivePopGestureRecognizer.enabled = NO;
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

#pragma mark - get
- (NSArray<UIViewController *> *)cp_viewControllers{
    NSMutableArray *viewcontrollers = [NSMutableArray array];
    for (CPWrapViewController *wrapViewController in self.viewControllers)
    {
        [viewcontrollers addObject:wrapViewController.rootViewController];
    }
    return viewcontrollers.copy;
}

@end
