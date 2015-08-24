//
//  WeiboViewLayoutFrame.h
//  项目2
//
//  Created by Mee Leo on 24/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboContentModel.h"
#import "UserModel.h"
@interface WeiboViewLayoutFrame : NSObject

@property (nonatomic,assign) CGRect textFrame; //微博内容的frame
@property (nonatomic,assign) CGRect srTextFrame;//原微博内容的frame
@property (nonatomic,assign) CGRect bgImgFrame;//原微博背景图片的frame
@property (nonatomic,assign) CGRect imgFrame;//微博图片的frame

@property (nonatomic,assign) CGRect frame;//整个weiboView的frame





@end
