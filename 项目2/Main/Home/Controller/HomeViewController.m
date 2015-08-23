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
#import "BaseNavigationController.h"
@interface HomeViewController () <SinaWeiboRequestDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    BaseNavigationController* naviVC = (BaseNavigationController*)self.navigationController;
    [self setbaseBarItem];
    
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
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    SinaWeibo* weibo = [self sinaweibo];
    weibo.delegate = self;
    [params setValue:@"2" forKey:@"count"];

    if ([weibo isAuthValid]) {
        
        NSLog(@"已经登录");
      [weibo requestWithURL:@"statuses/home_timeline.json" params:nil httpMethod:@"GET" delegate:self];
        
    }else{
        
        [weibo logIn];
        if ([weibo isAuthValid]) {
         [weibo requestWithURL:@"statuses/home_timeline.json" params:nil httpMethod:@"GET" delegate:self];
            
        }
    }
//    [params setValue:@"2.00ge6PGG2LtYiDa7bc9398cdcPfoAB" forKey:@"access_token"];
    
}



- (void)request:(SinaWeiboRequest *)request didReceiveResponse:(NSURLResponse *)response{
    
    
    NSLog(@"%@",response);
    
    
}

- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error{
    
    NSLog(@"error  %@ \n %li" ,error,error.code);
}


-(void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    
    
    NSLog(@"%@",result);
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
