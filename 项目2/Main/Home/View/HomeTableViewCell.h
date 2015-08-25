//
//  HomeTableViewCell.h
//  项目2
//
//  Created by Mee Leo on 23/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXLabel.h"

@interface HomeTableViewCell : UITableViewCell <WXLabelDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet WXLabel *textView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *from;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;

@end
