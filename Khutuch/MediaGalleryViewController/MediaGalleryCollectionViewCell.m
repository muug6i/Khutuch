//
//  MediaGalleryCollectionViewCell.m
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 9/30/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import "MediaGalleryCollectionViewCell.h"

@interface MediaGalleryCollectionViewCell()

@end

@implementation MediaGalleryCollectionViewCell
@synthesize myScrollView;
@synthesize bgImageView;
@synthesize indicatorView;
//@synthesize media;
@synthesize indexPath;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.contentView.backgroundColor = MAIN_BG_COLOR;
        
        [self configureView];
    }
    return self;
}

- (void)configureView {
    [self addSubview:self.myScrollView];
    [self.myScrollView addSubview:self.bgImageView];
    [self addSubview:self.indicatorView];
    
    //Double tap
    {
        UITapGestureRecognizer *tapTwice = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        tapTwice.numberOfTapsRequired = 2;
        [self.bgImageView addGestureRecognizer:tapTwice];

        //One Tap
        {
            UITapGestureRecognizer* tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            [tapOne requireGestureRecognizerToFail:tapTwice];
            [self.bgImageView addGestureRecognizer:tapOne];
        }
    }

//    //Up, Down swipes
//    {
//        UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleUpSwipe:)];
//        [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
//        [self.bgImageView addGestureRecognizer:swipeUp];
//        
//        UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleDownSwipe:)];
//        [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
//        [self.bgImageView addGestureRecognizer:swipeDown];
//    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.indicatorView.frame = CGRectMake(0, 0, 60, 60);
    self.indicatorView.center = self.contentView.center;
    
    self.bgImageView.image = [UIImage imageNamed:@"no-thumbnail-big.png"];
    [self.indicatorView startAnimating];
    
//    if (self.media.downloadSucceeded) {
//        self.bgImageView.image = self.media.imageData;
//        [self.indicatorView stopAnimating];
//    } else {
//        [self.media downloadImage];
//    }
//    
//    __weak typeof(self)weakSelf = self;
//    self.media.downloadStatusChangedBlock = ^(ItemImage *itim){
//        if (itim == self.media) {
//            
//            if (weakSelf.media.downloadFailed) {
//                [weakSelf.indicatorView stopAnimating];
//            } else {
//                [weakSelf layoutSubviews];
//            }
//        }
//    };
}

#pragma mark -
#pragma mark UIActions
- (void)handleDoubleTap:(UITapGestureRecognizer *)gesture {
    [self doubleTapped];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(galleryPageViewCellDoubleClicked:)]) {
        [self.delegate galleryPageViewCellDoubleClicked:self];
    }
}
- (void)handleTap:(UITapGestureRecognizer *)gesture {
    
//    if (self.delegate && [self.delegate respondsToSelector:@selector(galleryPageViewCellClicked:)]) {
//        [self.delegate galleryPageViewCellClicked:self];
//    }
}
- (void)handleUpSwipe:(UITapGestureRecognizer *)gesture {
    if (self.delegate && [self.delegate respondsToSelector:@selector(galleryPageViewUpSwiped:)]) {
        [self.delegate galleryPageViewUpSwiped:self];
    }
}
- (void)handleDownSwipe:(UITapGestureRecognizer *)gesture {
    if (self.delegate && [self.delegate respondsToSelector:@selector(galleryPageViewDownSwiped:)]) {
        [self.delegate galleryPageViewDownSwiped:self];
    }
}

#pragma mark -
#pragma mark User
- (void)doubleTapped {
    if (self.myScrollView.zoomScale <= 1.0f) {
        [self.myScrollView setZoomScale:2.0f animated:YES];
    } else {
        [self.myScrollView setZoomScale:1.0f animated:YES];
    }
}

#pragma mark UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [scrollView.subviews objectAtIndex:0];
}

#pragma mark -
#pragma mark Getters
- (UIScrollView *)myScrollView {
    if (myScrollView == nil) {
        myScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        myScrollView.backgroundColor = CLEAR_COLOR;
        myScrollView.showsVerticalScrollIndicator = YES;
        myScrollView.showsHorizontalScrollIndicator = NO;
        [myScrollView setMaximumZoomScale:4.0f];
        [myScrollView setMinimumZoomScale:1.0f];
        myScrollView.delegate = self;
    }
    return myScrollView;
}
- (UIImageView *)bgImageView {
    if (bgImageView == nil) {
        bgImageView = [[UIImageView alloc] initWithFrame:self.myScrollView.frame];
        bgImageView.backgroundColor = CLEAR_COLOR;
        bgImageView.clipsToBounds = YES;
        bgImageView.contentMode = UIViewContentModeScaleAspectFit;
        bgImageView.userInteractionEnabled = YES;
    }
    return bgImageView;
}
- (UIActivityIndicatorView *)indicatorView {
    if (indicatorView == nil) {
        indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicatorView.backgroundColor = CLEAR_COLOR;
        indicatorView.hidesWhenStopped = YES;
    }
    return indicatorView;
}

@end
