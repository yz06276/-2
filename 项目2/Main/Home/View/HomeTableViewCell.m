//
//  HomeTableViewCell.m
//  项目2
//
//  Created by Mee Leo on 23/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "WXLabel.h"
@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.textView.wxLabelDelegate = self;
    self.backgroundColor = [UIColor clearColor];
    self.backgroundView= nil;
    self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    

    // Configure the view for the selected state
}

- (NSString *)contentsOfRegexStringWithWXLabel:(WXLabel *)wxLabel
{
    //需要添加链接字符串的正则表达式：@用户、http://、#话题#
    NSString *regex1 = @"@\\w+";
    NSString *regex2 = @"http(s)?://([A-Za-z0-9._-]+(/)?)*";
    NSString *regex3 = @"#\\w+#";
    NSString *regex = [NSString stringWithFormat:@"(%@)|(%@)|(%@)",regex1,regex2,regex3];
    return regex;
}


@end
