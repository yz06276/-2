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
#import "HomeTableViewController.h"
#import "WeiboContentModel.h"
@interface HomeViewController () <SinaWeiboRequestDelegate>


@property(strong,nonatomic) HomeTableViewController* tableViewController;

@end

@implementation HomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    BaseNavigationController* naviVC = (BaseNavigationController*)self.navigationController;
  
    HomeTableViewController* homeTableViewController = [[HomeTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    homeTableViewController.tableView.frame = CGRectMake(0, 64, kwth, kheight-49-64);
//    homeTableViewController.tableView.estimatedRowHeight = 50.0f;
//    homeTableViewController.tableView.rowHeight = UITableViewAutomaticDimension;
//    UINib* cellNib = [UINib nibWithNibName:@"HomeTableViewCell" bundle:nil];
//    [homeTableViewController.tableView registerNib:cellNib forCellReuseIdentifier:@"homeCell"];
    
    _tableViewController = homeTableViewController;
    [self.view addSubview:homeTableViewController.tableView];
//    _tableViewController.automaticallyAdjustsScrollViewInsets = YES;
//    _tableViewController.tableView.translatesAutoresizingMaskIntoConstraints = YES;
    
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
    [self setbaseBarItem];
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    SinaWeibo* weibo = [self sinaweibo];
    weibo.delegate = self;
//    [params setValue:@"2" forKey:@"count"];
//        [params setValue:@"2.00ge6PGG2LtYiDa7bc9398cdcPfoAB" forKey:@"access_token"];
    if ([weibo isAuthValid]) {
        
        NSLog(@"已经登录");
        [weibo requestWithURL:@"statuses/home_timeline.json" params:nil httpMethod:@"GET" delegate:self];
        
    }else{
        
        [weibo logIn];
        if ([weibo isAuthValid]) {
            [weibo requestWithURL:@"statuses/home_timeline.json" params:nil httpMethod:@"GET" delegate:self];
            
        }
    }
    [weibo requestWithURL:@"statuses/home_timeline.json" params:params httpMethod:@"GET" delegate:self];


    
}



- (void)request:(SinaWeiboRequest *)request didReceiveResponse:(NSURLResponse *)response{
    
    
    NSLog(@"%@",response);
    
    
}

- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error{
    
    NSLog(@"error  %@ \n %li" ,error,error.code);
}


-(void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result{
    
    
    NSArray* statuses = [result objectForKey:@"statuses"];
    
    NSMutableArray* weiboContentArray = [NSMutableArray array];
    
    for (NSDictionary* contentDict  in statuses) {
        
        WeiboContentModel* model = [[WeiboContentModel alloc]initWithDataDict:contentDict];
        
        [weiboContentArray addObject:model];

    }
    
    NSLog(@"%@",weiboContentArray);
    
    _tableViewController.modelArray = weiboContentArray;
    
    
    
//    NSLog(@"%@",result);
    
}



- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    NSLog(@"登陆成功");
    NSLog(@"sinaweiboDidLogIn userID = %@ accesstoken = %@ expirationDate = %@ refresh_token = %@", sinaweibo.userID, sinaweibo.accessToken, sinaweibo.expirationDate,sinaweibo.refreshToken);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary* sinaweiboInfo = @{
                                    @"AccessTokenKey":sinaweibo.accessToken,
                                    @"ExpirationDateKey":sinaweibo.expirationDate,
                                        @"UserIDKey":sinaweibo.userID
                    
                                    
                                    };
    [defaults setObject:sinaweiboInfo forKey:@"bitchInfoDict"];
    [defaults synchronize];
//    NSLog(@"autoData%@",[defaults objectForKey:@"bitchInfoDict"]);
    
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
