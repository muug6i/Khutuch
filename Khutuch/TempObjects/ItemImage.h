//
//  ItemImage.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 7/8/15.
//  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemImage : NSObject

@property (nonatomic, strong) NSString  *link;
@property (nonatomic, strong) NSString  *description_;
@property (nonatomic, strong) NSString  *item_id;
@property (nonatomic, strong) NSString  *recent_item_id;

//TEMP
@property (nonatomic, strong) UIImage  *imageData;
@property (nonatomic, assign) BOOL     uploadSucceeded;
@property (nonatomic, assign) BOOL     uploadFailed;
@property (nonatomic, assign) BOOL     uploading;

@property (nonatomic, copy) void (^downloadStatusChangedBlock)(ItemImage *itemImage);
@property (nonatomic, assign) BOOL     downloadSucceeded;
@property (nonatomic, assign) BOOL     downloadFailed;
@property (nonatomic, assign) BOOL     downloading;

- (void)downloadImage;

@end
