//
//  BaseViewController.h
//  项目2
//
//  Created by ios on 15/8/19.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
@interface BaseViewController : UIViewController

{
    UIWindow *_tipWindow;
}
- (void)setbaseBarItem;

//1 显示加载提示-自己实现
- (void)showLoading:(BOOL)show;
//3 状态栏提示
- (void)showStatusTip:(NSString *)title
                 show:(BOOL)show
            operation:(AFHTTPRequestOperation *)operation;


@end
