//
//  WeiboCommentTableViewCell.h
//  项目2
//
//  Created by Mee Leo on 28/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXLabel.h"
@interface WeiboCommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeNumberLabel;
@property (strong, nonatomic) IBOutlet WXLabel *commentContentLabel;

@end
