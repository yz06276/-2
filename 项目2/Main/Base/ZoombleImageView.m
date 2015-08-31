//
//  ZoombleImageView.m
//  项目2
//
//  Created by Mee Leo on 29/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//



#import "ZoombleImageView.h"
#import "UIImageView+WebCache.h"

@interface ZoombleImageView ()<NSURLSessionDataDelegate,NSURLSessionTaskDelegate>


@property(strong,nonatomic)UIScrollView* scrollView;
@property(nonatomic,strong)UIImageView* originalImageview;

@end
@implementation ZoombleImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self  _initTap];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self _initTap];
    }
    return self;
}





- (instancetype)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self) {
        
        [self _initTap];
        
    }
    return self;
}




- (void)_initTap{
    
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoomIn)];
    
    [self addGestureRecognizer:tap];
    
    
    self.contentMode  = UIViewContentModeScaleAspectFit;
    
}


- (void)zoomIn{
    
    //隐藏原来图片  搞一个scrollView 放在总得window上
    
    self.hidden = YES;
    
    [self _creatScroolView];
    
    
    CGRect superRect = [self convertRect:self.bounds toView:self.window];
    
    

    
    
}




-(void)_creatScroolView{
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    [self.window addSubview:_scrollView];
    
    
    UIImage* image = [[UIImage alloc]init];
    
    
    [self sd_setImageWithURL:[NSURL URLWithString:self.imageURL] placeholderImage:image options:SDWebImageHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        UIProgressView* progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
        progressView.progress = 1.0*receivedSize/expectedSize;
        [self addSubview:progressView];
        if (receivedSize == expectedSize) {
            
            [progressView removeFromSuperview];
        }
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        _scrollView.contentSize = image.size;
        
        
    }];
    
   
    
}


-(void)savePhoto:(UILongPressGestureRecognizer*)longPress{
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
