//
//  DBLastSearch.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 8/27/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBLastSearch : NSManagedObject

@property (nonatomic, retain) NSString * string;
@property (nonatomic, retain) NSDate * db_inserted_date;

@end
