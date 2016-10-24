//
//  LoginUser.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 10/14/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginUser : NSObject

@property (nonatomic, strong) NSString *itemid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *token;

+ (LoginUser *)getLoginUser;

- (BOOL)isLoggedin;

- (void)reload;
- (void)clear;

- (void)saveToDB;

@end
