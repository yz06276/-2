//
//  MoreViewController.m
//  项目2
//
//  Created by ios on 15/8/19.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "MoreViewController.h"
#import "MainTableViewCellOnMore.h"
#import "ThemeManager.h"
#import "ThemeChangeTableViewController.h"


@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureMainTable];
    
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [_mainTableViewOnMore reloadData];

}

- (void)configureMainTable
{
    _mainTableViewOnMore = [[UITableView alloc] initWithFrame:CGRectMake(0,30, kwth ,kheight) style:UITableViewStyleGrouped];
    _mainTableViewOnMore.delegate = self;
    _mainTableViewOnMore.dataSource = self;
    _mainTableViewOnMore.backgroundColor = [UIColor clearColor];
    UINib *nib = [UINib nibWithNibName:@"MainTableViewCellOnMore" bundle:nil];
    [_mainTableViewOnMore registerNib:nib forCellReuseIdentifier:@"MoreCell"];

    
    [self.view addSubview:_mainTableViewOnMore];
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 2;
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCellOnMore *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreCell"];
    ThemeManager *themeManager = [ThemeManager sharedThemeManager];
    
    cell.backgroundColor = [themeManager getThemeColor:@"More_Item_color"];
    if(indexPath.section == 0)
    {
        if(indexPath.row == 0)
        {
            cell.leftImageView.ImgName = @"more_icon_theme.png";
            cell.leftLabel.text = @"主题选择";
            cell.leftLabel.colorName = @"More_Item_Text_color";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            
            cell.leftImageView.ImgName = @"more_icon_account.png";
            cell.leftLabel.text = @"账户管理";
            cell.leftLabel.colorName = @"More_Item_Text_color";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
    }
    else if (indexPath.section == 1)
    {
        cell.leftImageView.ImgName = @"more_icon_feedback.png";
        cell.leftLabel.text = @"意见反馈";
        cell.leftLabel.colorName = @"More_Item_Text_color";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else
    {
        cell.leftLabel.text = @"           登出当前账号";
        cell.leftLabel.colorName = @"More_Item_Text_color";
    }
    
    cell.backgroundColor = [themeManager getThemeColor:@"More_Item_color"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if(indexPath.section == 0 && indexPath.row ==0)
    {
        ThemeChangeTableViewController *vc = [[ThemeChangeTableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        [self.navigationController pushViewController:vc animated:YES];
      
    
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
