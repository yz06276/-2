//
//  HomeViewController.m
//  项目2
//
//  Created by ios on 15/8/19.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "ThemeManager.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SinaWeibo *)sinaweibo
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaWeibo;
}
- (IBAction)logAction:(id)sender {
    
    ThemeManager *themeManager = [ThemeManager sharedThemeManager];
 
    themeManager.themeName = @"Blue Moon";
    
}


- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    NSLog(@"登陆成功");
    NSLog(@"sinaweiboDidLogIn userID = %@ accesstoken = %@ expirationDate = %@ refresh_token = %@", sinaweibo.userID, sinaweibo.accessToken, sinaweibo.expirationDate,sinaweibo.refreshToken);
}
- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo
{
    NSLog(@"注销");
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
