//
//  TableViewController.m
//  项目2
//
//  Created by Mee Leo on 23/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "HomeTableViewController.h"
#import "WeiboContentModel.h"
#import "Uitility.h"
#import "HomeTableViewCell2.h"
@interface HomeTableViewController ()



@end

@implementation HomeTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    
    self = [super initWithStyle:style];
     UINib* cellNib = [UINib nibWithNibName:@"HomeTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"homeCell"];
    
    UINib* cellNib2 = [UINib nibWithNibName:@"HomeTableViewCell2" bundle:nil];
    [self.tableView registerNib:cellNib2 forCellReuseIdentifier:@"homeCell2"];
    NSLog(@"123");

    return self;
    
}

-(void)setModelArray:(NSArray *)modelArray{
    _modelArray = modelArray;
    [self.tableView reloadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight =300.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

        return [_modelArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
 

//    cell.textLabel.text = [NSString stringWithFormat:@"%d",i];
    WeiboContentModel* model = _modelArray[indexPath.row];
    
   
    if (indexPath.row%2) {
        HomeTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" ];
        cell.time.text = [Uitility DateStringTansformer:model.createDate];
        cell.textView.text = model.text;
        cell.userName.text = model.userModel.name;
        cell.from.text = @"weibo.com";
        [cell.iconImage sd_setImageWithURL:[NSURL URLWithString:model.userModel.profile_image_url]];
        [cell.imageView1 removeFromSuperview];
        [cell.imageView2 removeFromSuperview];
        
        return cell;
     
        
    }else{
        HomeTableViewCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell2" ];
        cell.textView.text = model.text;
        return cell;
        
    }
//    if (!(indexPath.row%2)) {
//        if () {
//            <#statements#>
//        }
//        
//    }

    
    
}





/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
