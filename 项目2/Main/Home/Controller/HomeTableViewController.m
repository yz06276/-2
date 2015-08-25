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
@interface HomeTableViewController ()<UITextViewDelegate>



@end

@implementation HomeTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    
    self = [super initWithStyle:style];
     UINib* cellNib = [UINib nibWithNibName:@"HomeTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"homeCell"];
    
    UINib* cellNib2 = [UINib nibWithNibName:@"HomeTableViewCell2" bundle:nil];
    [self.tableView registerNib:cellNib2 forCellReuseIdentifier:@"homeCell2"];
    self.tableView.backgroundColor = [UIColor clearColor];
    
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
    
   
        HomeTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" ];
        cell.time.text = [Uitility DateStringTansformer:model.createDate];
        cell.textView.text = model.text;
        cell.userName.text = model.userModel.name;
        cell.from.text = @"weibo.com";
        [cell.iconImage sd_setImageWithURL:[NSURL URLWithString:model.userModel.profile_image_url]];
    if (model.bmiddlelImage.length != 0) {
        [cell.imageView1 sd_setImageWithURL:[NSURL URLWithString:model.bmiddlelImage]];

    }
    
    cell.textView.linespace = 8.0f;
    cell.textView.mutiHeight = 1.0f;
    
    
        
        return cell;
    
//        
//    }else{
//    HomeTableViewCell* cellincell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
//        HomeTableViewCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell2" ];
//    cell.cellInCell = cellincell;
//    
//     cell.cellInCell.time.text = [Uitility DateStringTansformer:model.createDate];
//            cell.cellInCell.textView.text = model.text;
//            cell.cellInCell.userName.text = model.userModel.name;
//            cell.cellInCell.from.text = @"weibo.com";
//            [cell.cellInCell.iconImage sd_setImageWithURL:[NSURL URLWithString:model.userModel.profile_image_url]];
//        if (model.bmiddlelImage.length != 0) {
//            [cell.cellInCell.imageView1 sd_setImageWithURL:[NSURL URLWithString:model.bmiddlelImage]];
//    
//        }
//    return cell;
//
//        NSURL* url = [NSURL URLWithString:@"http://www.baidu.com"];
//            NSString* s1 = @"fuckYourPussyAsshole项目说明： 已经有完工的安卓客户端， 歌词往往都像诗词一样浓缩，搭配着音乐，平淡的文字也有了更多的感情色彩，这是一个用户用歌词来抒发自己情感的平台， 用户可以搭配图片和歌词发布歌词， 制作歌词明信片，有歌词频道，用户可以在创建频道，在频道内发布歌词片段，用户之间可以聊天和添加好友。同时还有个人主页，类似朋友圈一样。 用户可以把自己的歌词片段或其他的歌词片段分享到朋友圈等。";
//        NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc]initWithString:s1];
//        [attrString addAttribute:NSLinkAttributeName value:url range:[s1 rangeOfString:@"fuckYourPussyAsshole"]];
//        
//        [attrString addAttribute:NSKernAttributeName //字间距
//                           value:@3
//                           range:[s1 rangeOfString:@"频道内发布"]];
//        NSMutableParagraphStyle* style = [[NSMutableParagraphStyle alloc]init];
//        style.alignment = NSTextAlignmentNatural;//对齐方式
//        style.firstLineHeadIndent = 60;//首行缩进
//        style.lineHeightMultiple = 1 ; //行高，倍数
//        style.lineSpacing = 10; //行间距  常数
//        
//        [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, s1.length)];
////        cell.textView.linkTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor],
////                                             NSUnderlineStyleAttributeName:@"2"};
//        cell.textView.editable = NO;
//        cell.textView.attributedText = attrString;
//        return cell;
//        
//    }
//    if (!(indexPath.row%2)) {
//        if () {
//            i
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
