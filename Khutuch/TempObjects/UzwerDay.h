//
//  UzwerDay.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 8/24/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HoroscopeMonth.h"

@interface UzwerDay : NSObject

@property (nonatomic, strong) NSString  *day;

@property (nonatomic, strong) NSString          *year;
@property (nonatomic, strong) HoroscopeMonth    *horoscopeMonth;

@property (nonatomic, strong) NSArray           *eventArray;

- (NSDate *)getDate;

@end
