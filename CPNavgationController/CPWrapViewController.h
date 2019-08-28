//
//  CPWrapViewController.h
//  测试
//
//  Created by lk03 on 2017/8/7.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPWrapViewController : UIViewController

@property (nonatomic , strong , readonly) UIViewController *rootViewController;

+ (CPWrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController;

@end
