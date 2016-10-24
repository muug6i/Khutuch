//
//  MediaGalleryViewController.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 9/30/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import "MainViewWithHeaderViewController.h"

@interface MediaGalleryViewController : MainViewWithHeaderViewController

@property (nonatomic, strong) NSArray   *mediaArray;
@property (nonatomic, assign) NSInteger currentIndex;

@end
