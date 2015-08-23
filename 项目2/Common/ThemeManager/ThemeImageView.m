//
//  ThemeImageView.m
//  项目2
//
//  Created by ios on 15/8/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "ThemeImageView.h"
#import "ThemeManager.h"
#define ChangeThemeNotification @"ChangeTheme"
@implementation ThemeImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ChangeThemeNotification object:nil];
}


- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeImage) name:ChangeThemeNotification object:nil];
    }
    
    return self;
}

- (void)setImgName:(NSString *)imgName
{
    if(![_ImgName isEqualToString:imgName])
    {
        _ImgName = imgName;
        
        [self changeImage];
    }

}


- (void)changeImage
{
    ThemeManager *manager = [ThemeManager sharedThemeManager];
    
    UIImage *image = [manager getImage:self.ImgName];
    NSLog(@"image ddhajsjq= %@",image);
    [self setImage:image];
    
}

@end
