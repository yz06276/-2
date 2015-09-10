//
//  WeiboAnnotationView.h
//  项目2
//
//  Created by Mee Leo on 2/9/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface WeiboAnnotationView : MKAnnotationView

@property (nonatomic,readonly)CLLocationCoordinate2D ccoordinate;
@property (nonatomic,copy)NSString* title;
@property (nonatomic,copy)NSString* subtitle;


-(void)setCcoordinate:(CLLocationCoordinate2D)ccoordinate;


@end
