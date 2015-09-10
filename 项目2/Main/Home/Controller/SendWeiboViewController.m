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
#import <AFNetworking.h>
#import "DataService.h"
#import "BaseViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"

@interface SendWeiboViewController ()


{
    UIImage *_sendImage;
    

}

@property (strong,nonatomic) CLLocationManager* locationManager;
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
    self.view.backgroundColor = [UIColor clearColor];
    
    [self _creatNaviItems];
    [self _createEditorViews];
    [self _location];
    
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
    
    _textFieldView = [[UITextView alloc]initWithFrame:CGRectMake(15, 80, kwth-30, 200)];
    _textFieldView.font = [UIFont systemFontOfSize:16.0f];
    _textFieldView.backgroundColor = [UIColor clearColor];
    _textFieldView.editable = YES;
    
    _textFieldView.backgroundColor = [UIColor colorWithRed:223.0/255 green:223.0/255 blue:223.0/255 alpha:0.5];
    _textFieldView.layer.cornerRadius = 10;
    _textFieldView.layer.borderWidth= 2;
    _textFieldView.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:_textFieldView];
    
    
    _editorBar  = [[UIView alloc]initWithFrame:CGRectMake(0, kheight-40, kwth, 55)];
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
        ThemeButton *button = [[ThemeButton alloc] initWithFrame:CGRectMake(15+(kwth/5)*i, 0, 40, 33)];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 10+i;
        button.imageNameForNormalState = imgName;
        [_editorBar addSubview:button];
        
        
    }
    
    
}

- (void)buttonAction:(UIButton*)button{
    
#warning 完成tabBar 的各项功能
    
    if (button.tag == 10) {
        [self _selectPhoto];
    }
    NSLog(@"%d",button.tag);
    
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
    
    AFHTTPRequestOperation *operation =  [DataService sendWeibo:weiboTextContent image:_sendImage block:^(id result) {
        NSLog(@"发送成功");
        //状态栏显示
        [self showStatusTip:@"发送成功" show:NO operation:nil];
        
    }];
    
    [self showStatusTip:@"正在发送..." show:YES operation:operation];
    [self closeSelf];
    
    
    
    
}

-(void)SentWeiboHTTPAction{
 
  
    
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
    
//    _textFieldView.height = kwth - _editorBar.height - keyboardHeight - 64;
    _editorBar.top = kheight - keyboardHeight-33;
    
}


#pragma mark - 定位事件处理

- (void)_location{
    
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
        
        if ( [[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            
            [_locationManager requestAlwaysAuthorization];
            
        }
    }
    
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    
    
}



-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    [_locationManager stopUpdatingLocation];
    
    CLLocation* location = [locations lastObject];
    
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    NSLog(@"longituge 经度:%lf  , latitude 纬度：%lf",coordinate.longitude,coordinate.latitude);
    
    NSString* coordinateStr = [NSString stringWithFormat:@"%f,%f",coordinate.longitude,coordinate.latitude];
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    
//    [params setObject:coordinateStr forKey:@"coordinate"];
//    [DataService requestAFUrl:@"location/geo/geo_to_address.json" httpMethod:@"GET" params:params data:nil block:^(id result) {
//        
//        NSLog(@"%@",result);
//        
//    }];
    
    NSString* longitude = [NSString stringWithFormat:@"+%lf",coordinate.longitude];
    NSString* latitude = [NSString stringWithFormat:@"+%lf",coordinate.latitude];
    
    [params setObject:longitude forKey:@"long"];
    [params setObject:latitude forKey:@"lat"];
    
    [DataService requestAFUrl:@"place/nearby/pois.json" httpMethod:@"GET" params:params data:nil block:^(id result) {
        
        NSLog(@"################################\n%@",result);
    }];

    
    MapViewController* mapVC = [[MapViewController alloc]init];
    CLLocationCoordinate2D center  = coordinate;
    MKCoordinateSpan span = {0.1,0.1};
    MKCoordinateRegion regin = {center,span};
    [mapVC.mapView setRegion:regin];
    
    [self.navigationController pushViewController:mapVC animated:YES];
 
}


#pragma mark - 处理照片相关
- (void)_selectPhoto{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
    
    [actionSheet showInView:self.view];
    
    //UIImagePickerController
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    
    UIImagePickerControllerSourceType sourceType;
    //选择相机 或者 相册
    if (buttonIndex == 0) {//拍照
        
        sourceType = UIImagePickerControllerSourceTypeCamera;
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (!isCamera) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"摄像头无法使用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alert show];
            
            return;
        }
        
        
    }else if(buttonIndex == 1){ //选择相册
        
        sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
    }else{
        
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    
}
//照片选择代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //弹出相册控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    //2 取出照片
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    //3 显示缩略图
    
    if (_zoomImageView == nil) {
        
        _zoomImageView = [[ZoombleImageView alloc] initWithImage:image];
        _zoomImageView.frame = CGRectMake(10, _textFieldView.bottom+10, 80, 80);
        [self.view addSubview:_zoomImageView];
        
//        _zoomImageView.delegate = self;
    }
    _zoomImageView.image = image;
    _sendImage = image;
    
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
