//
//  MainTableViewCellOnMore.h
//  项目2
//
//  Created by ios on 15/8/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeImageView.h"
#import "ThemeLabel.h"
@interface MainTableViewCellOnMore : UITableViewCell


@property (weak, nonatomic) IBOutlet ThemeImageView *leftImageView;

@property (weak, nonatomic) IBOutlet ThemeLabel *leftLabel;

@property (weak, nonatomic) IBOutlet ThemeLabel *rightLabel;

@end
