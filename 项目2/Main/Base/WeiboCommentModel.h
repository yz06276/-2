//
//  WeiboCommentModel.h
//  项目2
//
//  Created by Mee Leo on 28/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import "BaseModel.h"
#import "UserModel.h"
@interface WeiboCommentModel : BaseModel

@property (strong,nonatomic)UserModel* userModel;
@property (copy,nonatomic)NSString* creatDate;
@property (copy,nonatomic)NSString* commentContent;

@end
