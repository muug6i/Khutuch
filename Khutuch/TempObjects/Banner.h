//
//  Banner.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 4/30/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banner : NSObject

@property (nonatomic, strong) NSString  *itemid;
@property (nonatomic, strong) NSString  *bfile;
@property (nonatomic, strong) NSString  *url;

//
@property (nonatomic, strong) UIImage   *bfile_data;
@property (nonatomic, assign) int       bfile_downloading;

@end
