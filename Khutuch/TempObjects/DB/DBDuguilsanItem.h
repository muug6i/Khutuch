//
//  DBDuguilsanItem.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/27/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBDuguilsanItem : NSManagedObject

@property (nonatomic, retain) NSString * itemid;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * advs;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * ognoo;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * holded;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * gmap;
@property (nonatomic, retain) NSString * ip;
@property (nonatomic, retain) NSDate * db_inserted_date;
@property (nonatomic, retain) NSString * myzar;
@property (nonatomic, retain) NSNumber * is_recent;

@end
