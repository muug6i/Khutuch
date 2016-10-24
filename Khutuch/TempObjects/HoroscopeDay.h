//
//  HoroscopeDay.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/31/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HoroscopeMonth.h"

@interface HoroscopeDay : NSObject

@property (nonatomic, strong) NSString  *day;
@property (nonatomic, strong) NSString  *sar_ner;
@property (nonatomic, strong) NSString  *bileg_udur_ner;
@property (nonatomic, strong) NSString  *arga_udur_ner;
@property (nonatomic, strong) NSString  *nar;
@property (nonatomic, strong) NSString  *us_zasah_tuhai;
@property (nonatomic, strong) NSString  *udur;
@property (nonatomic, strong) NSString  *sain_tsag;
@property (nonatomic, strong) NSString  *hol_yavah;
@property (nonatomic, strong) NSString  *baljinnyam;
@property (nonatomic, strong) NSString  *dashnyam;
@property (nonatomic, strong) NSString  *modon_hohimoi;
@property (nonatomic, strong) NSString  *tersuud;
@property (nonatomic, strong) NSString  *us_zasah;
@property (nonatomic, strong) NSString  *barildlaga;
@property (nonatomic, strong) NSString  *shuten_barildlaga;
@property (nonatomic, strong) NSString  *suudal;
@property (nonatomic, strong) NSString  *sar;
@property (nonatomic, strong) NSString  *bileg_udur;

@property (nonatomic, strong) NSString          *year;
@property (nonatomic, strong) HoroscopeMonth    *horoscopeMonth;

- (NSDate *)getDate;

@end
