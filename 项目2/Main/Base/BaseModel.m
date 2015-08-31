//
//  BaseModel.m
//  项目2
//
//  Created by Mee Leo on 23/8/2015.
//  Copyright © 2015 ios. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


-(instancetype)initWithDataDict:(NSDictionary *)dataDict{
    
    self = [super init];
    if (self) {
        
        [self setAttributes:dataDict];
        
    }
    return self;
    
}

-(NSDictionary *)attributeMapDictonary{
    
    return nil;
}


-(void)setAttributes:(NSDictionary *)dataDict{
    NSDictionary* attributeMapDict = [self attributeMapDictonary];
    
    if (attributeMapDict == nil) {
        NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithCapacity:[dataDict count]];
        
        for (NSString* key in dataDict) {
            [dict setValue:key forKey:key];   
            attributeMapDict = dict;
        }
    }
    
    NSArray* attrbuteNameArray = [attributeMapDict allKeys];
    for (NSString* attributeName in attrbuteNameArray) {
        SEL sel = [self getSetterSELWithAttributeName:attributeName];
        
        if ([self respondsToSelector:sel]) {
            
            NSString* dataDictKey = [attributeMapDict objectForKey:attributeName];
            
            id attributeValue = [dataDict objectForKey:dataDictKey];
            
            [self performSelector:sel withObject:attributeValue];
        }
        
    }
    
    
    
    
}


-(SEL)getSetterSELWithAttributeName:(NSString*)attributeName{
    
    NSString* capital = [[attributeName substringToIndex:1] uppercaseString];
    NSString* setterSELStr = [NSString stringWithFormat:@"set%@%@:",capital,[attributeName substringFromIndex:1]];
    return NSSelectorFromString(setterSELStr);
}

@end

