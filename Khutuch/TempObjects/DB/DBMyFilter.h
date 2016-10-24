//
//  DBMyFilter.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/20/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBMyFilter : NSManagedObject

@property (nonatomic, retain) NSString * cat_id;
@property (nonatomic, retain) NSString * cat_name;
@property (nonatomic, retain) NSDate * db_inserted_date;
@property (nonatomic, retain) NSString * search_string;
@property (nonatomic, retain) NSString * sub_cat_id;
@property (nonatomic, retain) NSString * sub_cat_name;
@property (nonatomic, retain) NSString * filter_string;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * desc;

@end
