//
//  ThemeManager.m
//  项目2
//
//  Created by ios on 15/8/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "ThemeManager.h"
#define ChangeThemeNotification @"ChangeTheme"
#define DefaultTheme @"Cat"


@implementation ThemeManager

+ (instancetype)sharedThemeManager
{
    static ThemeManager *themeManager;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        
        themeManager = [[ThemeManager alloc] init];
        
    });
    
    return themeManager;
}


- (id)init
{
    if(self = [super init])
    {
        _themeName = DefaultTheme;
        
        NSString *savedName = [[NSUserDefaults standardUserDefaults] valueForKey:@"savedThemeName"];
        
        if(savedName.length > 0)
        {
            _themeName = savedName;
        }
        
        
        NSString *content = [[NSBundle mainBundle]pathForResource:@"theme" ofType:@"plist"];
        
        _dicOfAllThemePath = [NSDictionary dictionaryWithContentsOfFile:content];
        
        
        
        NSString *colorPath = [[self getThemePath] stringByAppendingPathComponent:@"config.plist"];
        
        _dicForColorInfo = [NSDictionary dictionaryWithContentsOfFile:colorPath];
        
    }
    
    return self;
}




- (NSString *)getThemePath
{
    NSString *temp = [self.dicOfAllThemePath valueForKey:self.themeName];
    NSString *themePath = [[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:temp];
    
    return themePath;
}

- (UIImage *)getImage:(NSString *)imageName
{
    NSString *imagePath = [[self getThemePath] stringByAppendingPathComponent:imageName];

    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    return image;
}

- (void)setThemeName:(NSString *)themeName
{
    if(![_themeName isEqualToString:themeName])
    {
        _themeName = themeName;
        
        [[NSUserDefaults standardUserDefaults] setObject:_themeName forKey:@"savedThemeName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self sendNotificationOfNeedforChangeTheme];
    }
}




- (void)sendNotificationOfNeedforChangeTheme
{
    [[NSNotificationCenter defaultCenter] postNotificationName:ChangeThemeNotification object:self];
}

- (UIColor *)getThemeColor:(NSString *)colorName
{
    
    NSString *colorPath = [[self getThemePath] stringByAppendingPathComponent:@"config.plist"];
    
    _dicForColorInfo = [NSDictionary dictionaryWithContentsOfFile:colorPath];
    NSDictionary *rgbDic = [_dicForColorInfo valueForKey:colorName];
    
    NSLog(@"%@",rgbDic);
    
    CGFloat r = [rgbDic[@"R"] floatValue];
    CGFloat g = [rgbDic[@"G"] floatValue];
    CGFloat b = [rgbDic[@"B"] floatValue];
    
    
    CGFloat alpha = [rgbDic[@"alpha"] floatValue];
    
    if(rgbDic[@"alpha"] == nil)
    {
        alpha = 1;
    }
    
    UIColor *color = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:alpha];
    
    return color;
}

@end
