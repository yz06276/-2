//
//  MainViewController.m
//  项目2
//
//  Created by ios on 15/8/19.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"
#import "AppDelegate.h"
#import "ThemeButton.h"
#import "ThemeImageView.h"
@interface MainViewController ()
{
    ThemeImageView *_tabBarForBackGroundImageView;
    ThemeImageView *_selectedImageView;
    NSInteger _selectedIndex;
}

//@property(nonatomic,assign)NSUInteger selectedIndex;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedIndex = 100;
    [self configureSubViewControllers];

    [self configuretabBarBackground];
    
    // Do any additional setup after loading the view.
}

- (void)configuretabBarBackground
{
    _tabBarForBackGroundImageView = [[ThemeImageView alloc] initWithFrame:CGRectMake(0, 0, kwth, 49)];
    
    _tabBarForBackGroundImageView.userInteractionEnabled = YES;
    
    
    _tabBarForBackGroundImageView.ImgName = @"mask_navbar.png";
    NSArray *imgNames = @[
                          @"home_tab_icon_1.png",
                          @"home_tab_icon_2.png",
                          @"home_tab_icon_3.png",
                          @"home_tab_icon_4.png",
                          @"home_tab_icon_5.png",
                          ];
    
    CGFloat buttonWidth = kwth/5;
    
    
    _selectedImageView = [[ThemeImageView alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, 49)];
    _selectedImageView.image = [UIImage imageNamed:@"Skins/cat/home_bottom_tab_arrow.png"];
    _selectedImageView.ImgName = @"home_bottom_tab_arrow.png";
    [_tabBarForBackGroundImageView addSubview:_selectedImageView];
    
    
    for(int i = 0;i < 5;i++)
    {
        ThemeButton *button = [[ThemeButton alloc] initWithFrame:CGRectMake(i * buttonWidth, 0, buttonWidth, 49)];
        
        button.imageNameForNormalState = imgNames[i];
        
        [button addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = i+100;
        
        [_tabBarForBackGroundImageView addSubview:button];
    }
    
    [self.tabBar addSubview:_tabBarForBackGroundImageView];
}

- (void)configureSubViewControllers
{
    
    NSArray *names = @[@"Home",@"Message",@"Profile",@"Discover",@"More"];
    
    
    for(NSString *name in names)
    {
        UIStoryboard *storyBoard= [UIStoryboard storyboardWithName:name bundle:nil];
         BaseNavigationController *nav = [storyBoard instantiateInitialViewController];
        [self addChildViewController:nav];
    }

    UIViewController *firstVC = self.childViewControllers[0];
#warning 此处修改不确定
    [self.tabBar insertSubview:firstVC.view belowSubview:_tabBarForBackGroundImageView];
    
}
- (void)selectedAction:(UIButton *)button
{
    
    if(_selectedIndex != button.tag)
    {
        [UIView animateWithDuration:0.2 animations:^{
                
            _selectedImageView.center = button.center;
            }];
        
        
        UIViewController *lastVC = self.childViewControllers[_selectedIndex - 100];
        
        [lastVC.view removeFromSuperview];
        
        UIViewController *currentVC = self.childViewControllers[button.tag - 100];
        
        [self.view insertSubview:currentVC.view belowSubview:_tabBarForBackGroundImageView];
        
        _selectedIndex = button.tag;
    }
    

}




- (SinaWeibo *)sinaweibo
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaWeibo;
}


- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    NSLog(@"登陆");
}
- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo
{
    NSLog(@"注销");
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
