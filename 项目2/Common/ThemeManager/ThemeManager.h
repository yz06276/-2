//
//  ThemeManager.h
//  项目2
//
//  Created by ios on 15/8/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ThemeManager : NSObject

@property(nonatomic,copy)NSString *themeName;
@property(nonatomic,strong)NSDictionary *dicOfAllThemePath;
@property(nonatomic,strong)NSDictionary *dicForColorInfo;

+ (instancetype)sharedThemeManager;

- (NSString *)getThemePath;

- (UIImage *)getImage:(NSString *)imageName;

- (void)sendNotificationOfNeedforChangeTheme;

- (UIColor *)getThemeColor:(NSString *)colorName;




@end
