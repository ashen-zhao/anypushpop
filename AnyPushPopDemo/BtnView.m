//
//  BtnView.m
//  AnyPushPopDemo
//
//  Created by Ashen on 15/12/5.
//  Copyright © 2015年 Ashen. All rights reserved.
//

#import "BtnView.h"

@implementation BtnView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupPushBtn];
    }
    return self;
}

#pragma mark - UI
- (void)setupPushBtn {
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.frame = CGRectMake(10, 120, self.frame.size.width - 20, 40);
    pushBtn.backgroundColor = [UIColor grayColor];
    [pushBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:pushBtn];
}

- (void)btnAction:(UIButton *)btn {
    if (self.ClickBtn) {
        _ClickBtn();
    }
}
@end
