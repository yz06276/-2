//
//  WeiboContentModel.m
//  项目2
//
//  Created by Mee Leo on 23/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import "WeiboContentModel.h"
#import "UserModel.h"
@implementation WeiboContentModel


- (NSDictionary*)attributeMapDictonary{
    
    //   @"属性名": @"数据字典的key"
    NSDictionary *mapAtt = @{
                             
                             
                             @"createDate":@"created_at",
                             @"weiboId":@"id",
                             @"text":@"text",
                             @"source":@"source",
                             @"favorited":@"favorited",
                             @"thumbnailImage":@"thumbnail_pic",
                             @"bmiddlelImage":@"bmiddle_pic",
                             @"originalImage":@"original_pic",
                             @"geo":@"geo",
                             @"repostsCount":@"reposts_count",
                             @"commentsCount":@"comments_count",
                             };
    
    return mapAtt;
}

-(void)setAttributes:(NSDictionary *)dataDict{
    
    [super setAttributes:dataDict];
    NSDictionary* userDict = [dataDict objectForKey:@"user"];
    if (userDict != nil) {
        UserModel* userModel = [[UserModel alloc]initWithDataDict:userDict];
        self.userModel = userModel;
    }
    NSDictionary* retweetedDict = [dataDict objectForKey:@"retweeted_status"];
    if (nil != retweetedDict) {
        self.retweetedWeibo = [[WeiboContentModel alloc]initWithDataDict:retweetedDict];
    }
}


@end
