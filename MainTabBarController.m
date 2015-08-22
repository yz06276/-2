//
//  MainTabBarController.m
//  项目2
//
//  Created by ios on 15/8/19.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *names = @[@"Discover",@"Home",@"Message",@"More",@"Profile"];
    NSMutableArray *navs = [[NSMutableArray alloc] init];
    
    for(NSString *name in names)
    {
        UIStoryboard *storyBoard= [UIStoryboard storyboardWithName:name bundle:nil];
        UINavigationController *nav = [storyBoard instantiateInitialViewController];
        [navs addObject:nav];
    }
    self.viewControllers = navs;
    self.tabBar.hidden = YES;
    // Do any additional setup after loading the view.
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
