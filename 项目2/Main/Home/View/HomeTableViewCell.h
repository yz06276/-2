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
@property (strong, nonatomic) IBOutlet WXLabel *textView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *from;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet WXLabel *textView2;

@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UILabel *rePostCount;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ImageViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textView2Height;
@property(nonatomic,assign)BOOL isHaveImage;

@end
