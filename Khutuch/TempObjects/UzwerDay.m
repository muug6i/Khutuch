//
//  UzwerDay.m
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 8/24/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import "UzwerDay.h"

@implementation UzwerDay
@synthesize day;

@synthesize year;
@synthesize horoscopeMonth;

- (NSDate *)getDate {
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:self.day.intValue];
    [comps setMonth:self.horoscopeMonth.month.intValue];
    [comps setYear:self.year.intValue];
    
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
    
    return date;
}

@end
