//
//  Uitility.m
//  项目2
//
//  Created by Mee Leo on 24/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import "Uitility.h"

@implementation Uitility

+(NSString *)DateStringTansformer:(NSString *)weiboDate{
    
    NSString *formatterStr = @"EEE MMM dd HH:mm:ss Z yyyy";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    
    [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    
    NSDate *date = [[NSDate alloc] init];
    date = [formatter dateFromString:weiboDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM月dd日 HH:mm"];
    
    NSString *time = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:date]];
    
    return time;
    
    
}

@end
