//
//  BaseViewController.m
//  项目2
//
//  Created by ios on 15/8/19.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "BaseViewController.h"
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setbaseBarItem{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Tag" style:UIBarButtonItemStylePlain target:self action:@selector(showLeftMMDrawer)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(showRightMMDrawer)];
    
    
}

- (void)showLeftMMDrawer{
    
    MMDrawerController* leftMMDrawer = self.mm_drawerController;
    [leftMMDrawer openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        
        
    }];
    
}
- (void)showRightMMDrawer{
    
    MMDrawerController* leftMMDrawer = self.mm_drawerController;
    [leftMMDrawer openDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
        
        
    }];
    
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
