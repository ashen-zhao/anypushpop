//
//  AViewController.m
//  AnyPushPopDemo
//
//  Created by Ashen on 15/12/5.
//  Copyright © 2015年 Ashen. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
#import "BtnView.h"

@interface AViewController ()

@end

@implementation AViewController


#pragma mark - life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"A控制器";
    self.view.backgroundColor = [UIColor yellowColor];
    BtnView *btnView = [[BtnView alloc] initWithFrame:self.view.bounds];
    btnView.ClickBtn = ^() {
        [self.navigationController pushViewController:[BViewController new] animated:YES];
    };
    [self.view addSubview:btnView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
