//
//  RightViewController.m
//  项目2
//
//  Created by Mee Leo on 22/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import "RightViewController.h"
#import "ThemeButton.h"
#import "ThemeManager.h"
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"
#import "BaseNavigationController.h"
#import "SendWeiboViewController.h"
#import "ThemeImageView.h"

@interface RightViewController ()
@property (weak, nonatomic) IBOutlet ThemeButton *button1;
@property (weak, nonatomic) IBOutlet ThemeButton *button2;
@property (weak, nonatomic) IBOutlet ThemeButton *button3;
@property (weak, nonatomic) IBOutlet ThemeButton *button4;
@property (weak, nonatomic) IBOutlet ThemeButton *button5;

@end



@implementation RightViewController
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *imageNames = @[@"newbar_icon_1.png",
                            @"newbar_icon_2.png",
                            @"newbar_icon_3.png",
                            @"newbar_icon_4.png",
                            @"newbar_icon_5.png"];
    ThemeManager *themeManager = [ThemeManager sharedThemeManager];
    ThemeImageView* bgImageView = [[ThemeImageView alloc] initWithFrame:CGRectMake(0, 0, kwth, kheight)];
    
    bgImageView.image = [themeManager getImage:@"bg_home.jpg"];
    
    
    [self.view insertSubview:bgImageView atIndex:0];

    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImageView.image];
    
    
    NSArray* buttonArray = @[
                             _button1,
                             _button2,
                             _button3,
                             _button4,
                             _button5,
                             ];
    static int i = 0;
    
    for (ThemeButton* button in buttonArray) {
        
        button.imageNameForBgNormalState = imageNames[i];
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        i++;
        
    }
    
    
    // Do any additional setup after loading the view.
}

-(void)buttonAction:(UIButton*)button{
    
    if (button.tag == 0) {
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
            
            SendWeiboViewController* senderVC = [[SendWeiboViewController alloc]init];
            senderVC.title = @"发送微博";
            
            BaseNavigationController* baseNav = [[BaseNavigationController alloc]initWithRootViewController:senderVC];
            
            [self.mm_drawerController presentViewController:baseNav animated:YES completion:^{
                
               //blank
            }];
            
            
            
        }];
        
        
    }
    
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
