//
//  BaseModel.h
//  项目2
//
//  Created by Mee Leo on 23/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
//初始化方法
-(instancetype)initWithDataDict:(NSDictionary*)dataDict;

//属性映射字典
-(NSDictionary*)attributeMapDictonary;


//设置属性
-(void)setAttributes:(NSDictionary*)dataDict;

@end
