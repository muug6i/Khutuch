//
//  RateBank.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/30/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RateBank : NSObject

@property (nonatomic, strong) NSString  *bankname;
@property (nonatomic, strong) NSString  *bank_id;
@property (nonatomic, strong) NSString  *logo;
@property (nonatomic, strong) NSArray   *rateArray;

@end
