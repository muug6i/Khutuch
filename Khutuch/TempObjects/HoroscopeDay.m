//
//  HoroscopeDay.m
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/31/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import "HoroscopeDay.h"

@implementation HoroscopeDay
@synthesize day;
@synthesize sar_ner;
@synthesize bileg_udur_ner;
@synthesize arga_udur_ner;
@synthesize nar;
@synthesize us_zasah_tuhai;
@synthesize udur;
@synthesize sain_tsag;
@synthesize hol_yavah;
@synthesize baljinnyam;
@synthesize dashnyam;
@synthesize modon_hohimoi;
@synthesize tersuud;
@synthesize us_zasah;
@synthesize barildlaga;
@synthesize shuten_barildlaga;
@synthesize suudal;
@synthesize sar;
@synthesize bileg_udur;

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
