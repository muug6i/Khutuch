//
//  Item.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 6/26/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, strong) NSString  *itemid;
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *advs;
@property (nonatomic, strong) NSString  *image;
@property (nonatomic, strong) NSString  *phone;
@property (nonatomic, strong) NSString  *ognoo;
@property (nonatomic, strong) NSString  *price;
@property (nonatomic, strong) NSString  *holded;
@property (nonatomic, strong) NSString  *email;
@property (nonatomic, strong) NSString  *url;
@property (nonatomic, strong) NSString  *gmap;
@property (nonatomic, strong) NSString  *cat_title;
@property (nonatomic, strong) NSArray   *bannerArray;

@property (nonatomic, strong) NSArray   *itemImageArray;

@property (nonatomic, strong) NSString  *ip;
@property (nonatomic, strong) NSArray   *filterArray;
@property (nonatomic, strong) NSArray   *similiarArray;

@property (nonatomic, strong) NSString  *myzar;
@property (nonatomic, strong) NSNumber  *is_recent;

@property (nonatomic, strong) NSArray   *offerArray;
@property (nonatomic, strong) NSString  *cat_all;

@end
