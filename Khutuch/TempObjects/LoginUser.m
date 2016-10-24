//
//  LoginUser.m
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 10/14/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import "LoginUser.h"

@implementation LoginUser
@synthesize itemid;
@synthesize name;
@synthesize username;
@synthesize email;
@synthesize phone;
@synthesize token;

+ (LoginUser *)getLoginUser {
    static dispatch_once_t once;
    static LoginUser *sharedObject;
    dispatch_once(&once, ^{
        sharedObject = [[LoginUser alloc] init];
        
        if ([DATABASE_MANAGER countForEntity:@"DBLoginUser"] > 0)
            [sharedObject reload];
    });
    return sharedObject;
}

- (BOOL)isLoggedin {
    return [USERDEF boolForKey:kLoggedIn];
}

- (void)reload {
    NSArray *arr = [DATABASE_MANAGER getObjectsForEntity:@"DBLoginUser" withSortKey:@"db_inserted_date" andSortAscending:YES];
    if (arr > 0) {
        NSManagedObject *loginUserManagedObj = [arr firstObject];
        
        self.itemid = [loginUserManagedObj valueForKey:@"itemid"];
        self.name = [loginUserManagedObj valueForKey:@"name"];
        self.username = [loginUserManagedObj valueForKey:@"username"];
        self.email = [loginUserManagedObj valueForKey:@"email"];
        self.phone = [loginUserManagedObj valueForKey:@"phone"];
        self.token = [loginUserManagedObj valueForKey:@"token"];
    }
}

- (void)clear {
    [DATABASE_MANAGER deleteAllObjectsForEntity:@"DBLoginUser"];
    
    self.itemid = nil;
    self.name = nil;
    self.username = nil;
    self.email = nil;
    self.phone = nil;
    self.token = nil;
}

- (void)saveToDB {
    [DATABASE_MANAGER deleteAllObjectsForEntity:@"DBLoginUser"];
    [DATABASE_MANAGER writeToDatabaseThisObject:self entityName:@"DBLoginUser" db_inserted_date:nil];
}

@end
