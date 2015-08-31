//
//  WeiboDetialTableViewController.m
//  项目2
//
//  Created by Mee Leo on 28/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import "WeiboDetialTableViewController.h"
#import "WeiboCommentModel.h"
#import "WeiboContentModel.h"
#import "AppDelegate.h"
#import "Uitility.h"
#import "HomeTableViewCell.h"
#import "WeiboCommentTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface WeiboDetialTableViewController () <SinaWeiboRequestDelegate>


@property(strong,nonatomic)SinaWeibo* Weibo;
@end


@implementation WeiboDetialTableViewController


-(void)viewWillAppear:(BOOL)animated{
    
   
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registCellNibOrClass];
    self.tableView.estimatedRowHeight = 100.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
  
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)setWeiboCommentModelArray:(NSArray *)weiboCommentModelArray{
    
    _weiboCommentModelArray = weiboCommentModelArray;
    [self.tableView reloadData];
    
}
-(void)registCellNibOrClass{
    
  
    
    UINib* cellNib = [UINib nibWithNibName:@"WeiboCommentTableViewCell" bundle:nil];
    
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"commentCell"];
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        
    return self.weiboCommentModelArray.count+1;
    
    
  
    
    
}

#pragma  mark - weibo Request Delegate

-(void)request:(SinaWeiboRequest *)request didReceiveResponse:(NSURLResponse *)response{
    
    NSLog(@"comment response%@",response);
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        return _WeiboCell;
    }
    
    
    WeiboCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
    WeiboCommentModel* model = self.weiboCommentModelArray[indexPath.row-1];
    
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.userModel.profile_image_url]];
    cell.userNameLabel.text = model.userModel.name;
    cell.commentTimeLabel.text = model.creatDate;
    cell.commentContentLabel.text = model.commentContent;
    
    
    // Configure the cell...
    
        return cell;
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
