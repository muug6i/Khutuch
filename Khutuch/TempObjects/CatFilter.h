//
//  CatFilter.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/9/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatFilterValue.h"

@interface CatFilter : NSObject

@property (nonatomic, strong) NSString  *filter_name;
@property (nonatomic, strong) NSString  *post_name;
@property (nonatomic, strong) NSArray   *filters;

//AddItemFields
@property (nonatomic, strong) NSString  *type;
@property (nonatomic, strong) NSString  *required;
@property (nonatomic, strong) NSString  *relative_filters;
@property (nonatomic, strong) NSString  *unit;
@property (nonatomic, strong) NSString  *min_val;
@property (nonatomic, strong) NSString  *max_val;
@property (nonatomic, strong) NSString  *relative_filters_value;
@property (nonatomic, strong) NSString  *disabled;

//TEMP
@property (nonatomic, assign) BOOL      reloadFilterValsRequired;
@property (nonatomic, assign) BOOL      mydisabled;
@property (nonatomic, assign) BOOL      disableMultiSelection;

@property (nonatomic, strong) CatFilterValue    *selectedCatFilterValue;

@end
