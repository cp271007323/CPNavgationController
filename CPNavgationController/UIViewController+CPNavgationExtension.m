//
//  UIViewController+CPNavigationExtension.m
//  测试
//
//  Created by lk03 on 2017/8/7.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import "UIViewController+CPNavgationExtension.h"
#import "CPNavgationController.h"
#import <objc/runtime.h>

@implementation UIViewController (CPNavigationExtension)

- (BOOL)cp_fullScreenPopGestureEnabled{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCp_fullScreenPopGestureEnabled:(BOOL)cp_fullScreenPopGestureEnabled{
    objc_setAssociatedObject(self, @selector(cp_fullScreenPopGestureEnabled), @(cp_fullScreenPopGestureEnabled), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)cp_isPrenset{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCp_isPrenset:(BOOL)cp_isPrenset{
    objc_setAssociatedObject(self, @selector(cp_isPrenset), @(cp_isPrenset), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)cp_popGestureDisenabled{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCp_popGestureDisenabled:(BOOL)cp_popGestureDisenabled{
    objc_setAssociatedObject(self, @selector(cp_popGestureDisenabled), @(cp_popGestureDisenabled), OBJC_ASSOCIATION_RETAIN);
}

- (CPNavgationController *)cp_navigationController{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCp_navigationController:(CPNavgationController *)cp_navigationController{
    objc_setAssociatedObject(self, @selector(cp_navigationController), cp_navigationController, OBJC_ASSOCIATION_ASSIGN);
}

- (UIImageView *)hiddenHairlineImageViewUnder:(UIView *)view{
    
    if([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
        {
        view.hidden = YES;
        return(UIImageView *)view;
    }
    for(UIView *subview in view.subviews)
        {
        UIImageView *imageView = [self hiddenHairlineImageViewUnder:subview];
        if(imageView)
        {
            imageView.hidden = YES;
            return imageView;
        }
    }
    return nil;
    
}

- (void)removeCurrentViewControFromCP_viewControllers
{
    __weak UIViewController *weakself = self;
    NSMutableArray *controllersmArr = [[NSMutableArray alloc]initWithArray:self.cp_navigationController.viewControllers];
    [self.cp_navigationController.cp_viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong UIViewController *strongself = weakself;
        if ([obj isEqual:strongself]) {
            [controllersmArr removeObjectAtIndex:idx];
            *stop = YES;
        }
    }];
    self.cp_navigationController.viewControllers = controllersmArr;
}

- (void)removeAllViewControFromCP_viewControllers
{
  NSMutableArray *controllersmArr = [[NSMutableArray alloc] initWithObjects:self.cp_navigationController.viewControllers.firstObject,self.cp_navigationController.viewControllers.lastObject, nil];
  self.cp_navigationController.viewControllers = controllersmArr;
}


@end
