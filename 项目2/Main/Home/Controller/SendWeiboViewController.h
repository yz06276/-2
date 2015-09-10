//
//  SendWeiboViewController.h
//  项目2
//
//  Created by Mee Leo on 31/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoombleImageView.h"
#import "BaseViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface SendWeiboViewController : BaseViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,CLLocationManagerDelegate>

{
    ZoombleImageView *_zoomImageView;
    UIView* _editorBar;
    UITextView* _textView;

    
}
@property (strong,nonatomic)UITextView* textFieldView;
@property (strong,nonatomic)UIView* editorBar;


@end
