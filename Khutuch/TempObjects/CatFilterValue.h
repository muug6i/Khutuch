//
//  CatFilterValue.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/9/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatFilterValue : NSObject

@property (nonatomic, strong) NSString  *filter_name;
@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSString  *value;
@property (nonatomic, strong) NSString  *itemid;
@property (nonatomic, strong) NSString  *item_id;
@property (nonatomic, strong) NSString  *recent_item_id;

//category/view_new
@property (nonatomic, assign) BOOL      isSelected;

@end
