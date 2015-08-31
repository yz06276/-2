//
//  SendWeiboViewController.m
//  项目2
//
//  Created by Mee Leo on 31/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import "SendWeiboViewController.h"
#import "ThemeButton.h"
#import "AppDelegate.h"
#import "MMDrawerController.h"
@interface SendWeiboViewController ()

@end

@implementation SendWeiboViewController

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _creatNaviItems];
    [self _createEditorViews];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    [_textFieldView becomeFirstResponder];
    
}

-(void)_creatNaviItems{
    
    ThemeButton* closeButton = [[ThemeButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    closeButton.imageNameForNormalState = @"button_icon_close.png";
    [closeButton addTarget:self action:@selector(closeSelf) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* closeItem = [[UIBarButtonItem alloc]initWithCustomView:closeButton];
    [self.navigationItem setLeftBarButtonItem:closeItem];
    
    
    ThemeButton* sendButton = [[ThemeButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    sendButton.imageNameForNormalState = @"button_icon_ok.png";
    [sendButton addTarget:self action:@selector(sendWeiboAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* sendItem = [[UIBarButtonItem alloc]initWithCustomView:sendButton];
    [self.navigationItem setRightBarButtonItem:sendItem];
    

    
}


-(void)_createEditorViews{
    
    _textFieldView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, kwth, 0)];
    _textFieldView.font = [UIFont systemFontOfSize:16.0f];
    _textFieldView.backgroundColor = [UIColor clearColor];
    _textFieldView.editable = YES;
    
    _textFieldView.backgroundColor = [UIColor clearColor];
    _textFieldView.layer.cornerRadius = 10;
    _textFieldView.layer.borderWidth= 2;
    _textFieldView.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:_textFieldView];
    
    
    _editorBar  = [[UIView alloc]initWithFrame:CGRectMake(0, kheight, kwth, 55)];
    _editorBar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_editorBar];
    
    NSArray* images = @[
                        @"compose_toolbar_1.png",
                        @"compose_toolbar_4.png",
                        @"compose_toolbar_3.png",
                        @"compose_toolbar_5.png",
                        @"compose_toolbar_6.png"
                        ];
    for (NSInteger i = 0; i < images.count; i++) {
        
        NSString *imgName = images[i];
        ThemeButton *button = [[ThemeButton alloc] initWithFrame:CGRectMake(15+(kwth/5)*i, 20, 40, 33)];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 10+i;
        button.imageNameForNormalState = imgName;
        [_editorBar addSubview:button];
        
        
    }
    
    
}

- (void)buttonAction:(UIButton*)button{
    
#warning 完成tabBar 的各项功能
    NSLog(@"%li",button.tag);
    
}


-(void)sendWeiboAction{
    
    NSString* weiboTextContent = _textFieldView.text;
    NSString* errorMessage = nil;
    
    if(weiboTextContent.length == 0){
        
        errorMessage = @"微博内容不能为空";
        
    }else if(weiboTextContent.length > 139){
        errorMessage = @"微博太长了。内容应小于140个中文字符";
    }
    
    if(errorMessage.length != 0){
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"提示" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* alertAction = [UIAlertAction actionWithTitle:@"提示" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        return ;
        
    }];
    
        [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:^{
        
        
    }];
        
    }
    
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params setObject:weiboTextContent forKey:@"status"];
    
    
    
}

-(void)SentWeiboHTTPAction{
 
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    SinaWeibo* weibo = appDelegate.sinaWeibo;
    
    
#warning 发微博未实现 ， 上面紧邻函数 也没有处理好包含图片的发微博处理
    
    
    
}


- (void)closeSelf{
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    if ([window.rootViewController isKindOfClass:[MMDrawerController class]]) {
        MMDrawerController* mmDrawer = (MMDrawerController *)window.rootViewController;
        
        [mmDrawer closeDrawerAnimated:YES completion:^(BOOL finished) {
            //blank
            
        }];
        
    }
    
    [_textFieldView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:^{
        
       //blank
    }];
    
}

#pragma mark - 键盘事件处理
-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSLog(@"%@",notification);
    
    NSValue* boundsValue = [notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardFrame = [boundsValue CGRectValue];
    
    CGFloat keyboardHeight = keyboardFrame.size.height;
    
    _textFieldView.height = kwth - _editorBar.height - keyboardHeight - 64;
    _editorBar.top = _textFieldView.bottom;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
