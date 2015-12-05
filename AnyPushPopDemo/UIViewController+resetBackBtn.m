//
//  UIViewController+resetBackBtn.m
//  AnyPushPopDemo
//
//  Created by Ashen on 15/12/5.
//  Copyright © 2015年 Ashen. All rights reserved.
//

#import "UIViewController+resetBackBtn.h"
#import <objc/runtime.h>

Class object_getClass(id object);
@implementation UIViewController (resetBackBtn)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(mrc_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling
- (void)mrc_viewWillAppear:(BOOL)animated {
    [self mrc_viewWillAppear:animated];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    [backButton setTitle:@"返回"];
    self.navigationItem.backBarButtonItem= backButton;
}

@end
