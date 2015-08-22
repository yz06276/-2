//
//  ThemeLabel.m
//  项目2
//
//  Created by ios on 15/8/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "ThemeLabel.h"
#define ChangeThemeNotification @"ChangeTheme"
@implementation ThemeLabel

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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLabelColor) name:ChangeThemeNotification object:nil];
    }

    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLabelColor) name:ChangeThemeNotification object:nil];
    }
    
    return self;
}

- (void)setColorName:(NSString *)colorName
{
    if(![_colorName isEqualToString:colorName])
    {
        _colorName = colorName;
        [self changeLabelColor];
    }
}

- (void)changeLabelColor
{
    ThemeManager *themeManager = [ThemeManager sharedThemeManager];
    
    UIColor *color = [themeManager getThemeColor:self.colorName];
    
    [self setTintColor:color];
    [self setTextColor:color];
}

@end
