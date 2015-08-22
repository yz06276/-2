//
//  AppDelegate.h
//  项目2
//
//  Created by ios on 15/8/19.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import "HomeViewController.h"
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) SinaWeibo *sinaWeibo;
@property (strong,nonatomic) HomeViewController *homeViewController;

@end

