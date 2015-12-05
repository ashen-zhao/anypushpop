//
//  BViewController.m
//  AnyPushPopDemo
//
//  Created by Ashen on 15/12/5.
//  Copyright © 2015年 Ashen. All rights reserved.
//

#import "BViewController.h"
#import "DViewController.h"
#import "CViewController.h"
#import "BtnView.h"

@interface BViewController ()

@end

@implementation BViewController

#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"B控制器";
    self.view.backgroundColor = [UIColor blueColor];
    BtnView *btnView = [[BtnView alloc] initWithFrame:self.view.bounds];
    btnView.ClickBtn = ^() {
        
        [self.navigationController pushViewController:[DViewController new] animated:YES];
        
        NSMutableArray*tempMarr =[NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        
        [tempMarr insertObject:[CViewController new] atIndex:tempMarr.count- 2];
        
        [tempMarr removeObject:self]; //此时 的self 就是指 B ,因为在 B 中呢
        
        [self.navigationController setViewControllers:tempMarr animated:YES];
        
    };
    [self.view addSubview:btnView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end