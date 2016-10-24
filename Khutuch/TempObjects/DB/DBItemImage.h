//
//  DBItemImage.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/27/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBItemImage : NSManagedObject

@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSDate * db_inserted_date;
@property (nonatomic, retain) NSString * item_id;
@property (nonatomic, retain) NSString * recent_item_id;

@end
