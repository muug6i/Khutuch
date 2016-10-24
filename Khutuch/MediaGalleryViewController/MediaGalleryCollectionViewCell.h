//
//  MediaGalleryCollectionViewCell.h
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 9/30/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ItemImage.h"

@class MediaGalleryCollectionViewCell;

@protocol MediaGalleryViewCollectionCellDelegate <NSObject>

- (void)galleryPageViewCellDoubleClicked:(MediaGalleryCollectionViewCell *)cell;
- (void)galleryPageViewCellClicked:(MediaGalleryCollectionViewCell *)cell;

- (void)galleryPageViewUpSwiped:(MediaGalleryCollectionViewCell *)cell;
- (void)galleryPageViewDownSwiped:(MediaGalleryCollectionViewCell *)cell;

@end

@interface MediaGalleryCollectionViewCell : UICollectionViewCell<UIScrollViewDelegate>

@property (nonatomic, strong) NSObject<MediaGalleryViewCollectionCellDelegate> *delegate;

@property (nonatomic, strong) UIScrollView              *myScrollView;
@property (nonatomic, strong) UIImageView               *bgImageView;
@property (nonatomic, strong) UIActivityIndicatorView   *indicatorView;

//@property (nonatomic, strong) ItemImage     *media;

@property (nonatomic, strong) NSIndexPath   *indexPath;

@end
