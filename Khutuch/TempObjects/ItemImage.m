////
////  ItemImage.m
////  uneguimn-ios
////
////  Created by Sodtseren Enkhee on 7/8/15.
////  Copyright (c) 2015 Sodtseren Enkhee. All rights reserved.
////
//
//#import "ItemImage.h"
//
//@implementation ItemImage
//@synthesize link;
//@synthesize description_;
//@synthesize item_id;
//@synthesize recent_item_id;
////
//@synthesize imageData;
//@synthesize uploadSucceeded;
//@synthesize uploadFailed;
//@synthesize uploading;
////
//@synthesize downloadSucceeded;
//@synthesize downloadFailed;
//@synthesize downloading;
//@synthesize downloadStatusChangedBlock;
//
//- (void)downloadImage {
//    
//    if (self.downloadSucceeded || self.downloading) {
//        return;
//    }
//    
//    if (self.link.length == 0) {
//        self.downloadFailed = NO;
//        self.downloadSucceeded = YES;
//        self.downloading = NO;
//        
//        if (self.downloadStatusChangedBlock) {
//            self.downloadStatusChangedBlock(self);
//        }
//        
//        return;
//    }
//    
//    NSString *urlString = [self.link stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    DDLogError(@"URLSTRING: %@", urlString);
//    
//    AFHTTPRequestOperationManager *manager = [CONNECTION_MANAGER getRequestOperationManager];
//    
//    AFImageResponseSerializer *serializer = [[AFImageResponseSerializer alloc] init];
//    serializer.acceptableContentTypes = [serializer.acceptableContentTypes setByAddingObject:@"image/jpg"];
//    manager.responseSerializer = serializer;
//    
//    manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
//    
//    self.downloadFailed = NO;
//    self.downloadSucceeded = NO;
//    self.downloading = YES;
//    
//    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        self.imageData = responseObject;
//        
//        self.downloadFailed = NO;
//        self.downloadSucceeded = YES;
//        self.downloading = NO;
//        
//        if (self.downloadStatusChangedBlock) {
//            self.downloadStatusChangedBlock(self);
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        DDLogError(@"%@", error);
//        
//        self.downloadFailed = YES;
//        self.downloadSucceeded = NO;
//        self.downloading = NO;
//        
//        if (self.downloadStatusChangedBlock) {
//            self.downloadStatusChangedBlock(self);
//        }
//        
//    }];
//}
//
//@end
