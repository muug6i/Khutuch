//
//  MainCategory.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 6/26/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainCategory : NSObject

@property (nonatomic, strong) NSString *itemid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *parent_id;

@property (nonatomic, strong) NSMutableArray  *subCatArray;

@property (nonatomic, strong) NSString *advs_count;

//TEMP
@property (nonatomic, assign) BOOL              expanded;
@property (nonatomic, assign) BOOL              isSelected;
//@property (nonatomic, strong) NSMutableArray    *propertyArray;

@end
