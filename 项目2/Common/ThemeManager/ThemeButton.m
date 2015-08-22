//
//  ThemeButton.m
//  项目2
//
//  Created by ios on 15/8/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManager.h"
#define ChangeThemeNotification @"ChangeTheme"
@implementation ThemeButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeImage) name:ChangeThemeNotification object:nil];
    }
    
    return self;
}

- (void)setImageNameForNormalState:(NSString *)imageNameForNormalState
{
    if(![_imageNameForNormalState isEqualToString:imageNameForNormalState])
    {
        _imageNameForNormalState = imageNameForNormalState;
        [self changeImage];
    }
}

- (void)setImageNameForHeighiiteState:(NSString *)imageNameForHeighiiteState
{
    if(![_imageNameForHeighiiteState isEqualToString:imageNameForHeighiiteState])
    {
        _imageNameForHeighiiteState = imageNameForHeighiiteState;
        [self changeImage];
    }

}

- (void)setImageNameForBgHeightliteState:(NSString *)imageNameForBgHeightliteState
{
    if(![_imageNameForBgHeightliteState isEqualToString:imageNameForBgHeightliteState])
    {
        _imageNameForBgHeightliteState = imageNameForBgHeightliteState;
        [self changeImage];
    }
}

- (void)setImageNameForBgNormalState:(NSString *)imageNameForBgNormalState
{
    if(![_imageNameForBgNormalState isEqualToString:imageNameForBgNormalState])
    {
        _imageNameForBgNormalState = imageNameForBgNormalState;
        [self changeImage];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ChangeThemeNotification object:nil];
}


/*
 
 @property(nonatomic,copy)NSString *imageNameForNormalState;
 
 @property(nonatomic,copy)NSString *imageNameForHeighiiteState;
 
 @property(nonatomic,copy)NSString *imageNameForBgNormalState;
 
 @property(nonatomic,copy)NSString *imageNameForBgHeightliteState;
 
 */


- (void)changeImage
{
    
    ThemeManager *manager = [ThemeManager sharedThemeManager];
    
    UIImage *image1 = [manager getImage:self.imageNameForNormalState];
    UIImage *image2 = [manager getImage:self.imageNameForHeighiiteState];
    [self setImage:image1 forState:UIControlStateNormal];
    [self setImage:image2 forState:UIControlStateHighlighted];
    
    UIImage *image3 = [manager getImage:self.imageNameForBgNormalState];
    UIImage *image4 = [manager getImage:self.imageNameForBgHeightliteState];
    
    [self setBackgroundImage:image3 forState:UIControlStateNormal];
    [self setBackgroundImage:image4 forState:UIControlStateHighlighted];
    
    
}









@end
