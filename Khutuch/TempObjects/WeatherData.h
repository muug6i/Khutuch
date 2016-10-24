//
//  WeatherData.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/30/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *high;
@property (nonatomic, strong) NSString *low;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *image;

@end
