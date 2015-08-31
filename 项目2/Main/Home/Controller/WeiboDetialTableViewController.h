//
//  WeiboDetialTableViewController.h
//  项目2
//
//  Created by Mee Leo on 28/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"
@interface WeiboDetialTableViewController : UITableViewController

@property (strong,nonatomic)NSString* access_token;
@property (nonatomic,copy)NSNumber* weiboID;
@property (strong,nonatomic)HomeTableViewCell* WeiboCell;
@property (strong,nonatomic)NSArray* weiboCommentModelArray;

@end
