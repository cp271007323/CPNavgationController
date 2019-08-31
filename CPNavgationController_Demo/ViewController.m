//
//  ViewController.m
//  CPNavgationController_Demo
//
//  Created by 陈平 on 2019/8/31.
//  Copyright © 2019 陈平. All rights reserved.
//

#import "ViewController.h"
#import "CPNavgationController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self.navigationController pushViewController:[ViewController new] animated:YES];
    ViewController *vc = [ViewController new];
    vc.cp_isPrenset = YES;
    [self presentViewController:[CPNavgationController rootViewController:vc] animated:YES completion:nil];
    
}


@end
