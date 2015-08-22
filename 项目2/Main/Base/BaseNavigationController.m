//
//  BaseNavigationController.m
//  项目2
//
//  Created by ios on 15/8/19.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "BaseNavigationController.h"
#import "ThemeManager.h"
#import "ThemeImageView.h"
#define ChangeThemeNotification @"ChangeTheme"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeImage];
    // Do any additional setup after loading the view.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ChangeThemeNotification object:nil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeImage) name:ChangeThemeNotification object:nil];
    }
    
    return self;
}


- (void)changeImage
{
    
    ThemeManager *themeManager = [ThemeManager sharedThemeManager];
    ThemeImageView* bgImageView = [[ThemeImageView alloc] initWithFrame:CGRectMake(0, 0, kwth, kheight)];
    
    bgImageView.image = [themeManager getImage:@"bg_home.jpg"];
    
    
    [self.view insertSubview:bgImageView atIndex:0];
    UIImage *image = [themeManager getImage:@"mask_titlebar64.png"];
    UIColor *titleColor = [themeManager getThemeColor:@"Mask_Title_color"];
    
    NSLog(@"%@",titleColor);
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName:
                                     titleColor
                                 };
    
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:attributes];
    
    
    
    self.navigationBar.tintColor = [themeManager getThemeColor:@"Mask_Title_color"];
    
    
#warning 添加navi 的背景
//    self.navigationController.view

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
