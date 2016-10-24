//
//  MediaGalleryViewController.m
//  uneguimn-ios
//
//  Created by Sodtseren Enkhee on 9/30/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import "MediaGalleryViewController.h"
#import "MediaGalleryCollectionViewCell.h"

@interface MediaGalleryViewController ()<UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MediaGalleryViewCollectionCellDelegate> {
    //Flags
    BOOL isShowHeader;
    BOOL isShowFooter;
}

@property (nonatomic, strong) UIImageView           *descriptionImageView;
@property (nonatomic, strong) UITextView            *descriptionTextView;

@property (nonatomic, strong) UICollectionView      *myCollectionView;

@end

@implementation MediaGalleryViewController
@synthesize mediaArray;
@synthesize currentIndex;
@synthesize myCollectionView;
@synthesize descriptionImageView;
@synthesize descriptionTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.myCollectionView setContentOffset:CGPointMake(self.currentIndex*self.myCollectionView.bounds.size.width, 0) animated:NO];
//    [self pageChanged];
}

- (void)configureView {
    [super configureView];
    
    self.view.backgroundColor = MAIN_COLOR;
    
    //Initialize Layout Flags
    {
        isShowHeader = YES;
        isShowFooter = YES;
    }
//    [self syncLayout:NO];
    
    [self.view addSubview:self.myCollectionView];
    
    [self.view addSubview:self.descriptionImageView];
    [self.view addSubview:self.descriptionTextView];
    
    [self.view bringSubviewToFront:self.headerView];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark -
#pragma mark Rotation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (IS_IPHONE) {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    } else {
        return UIInterfaceOrientationIsLandscape(interfaceOrientation);
//        return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
    }
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    if (IS_IPHONE) {
        return UIInterfaceOrientationMaskPortrait;
    } else {
        return UIInterfaceOrientationMaskLandscape;
//        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
}

#pragma mark -
#pragma mark User
//- (void)syncLayout:(BOOL)animated {
////    [self syncShowFooter:animated];
//    [self syncShowHeader:animated];

//    self.titleLabel.text = [NSString stringWithFormat:@"%d/%d", [self getCurrentPageIndexForPagingMode]+1, (int)self.mediaArray.count];
//}
//- (void)syncShowHeader:(BOOL)animated {
//    
//    if (animated) {
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.2f];
//    }
//    
//    if (isShowHeader) {
//        self.closeButton.alpha
//        = 1.0f;
//    } else {
//        self.closeButton.alpha
//        = 0.0f;
//    }
//    
//    if (animated) {
//        [UIView commitAnimations];
//    }
//    
//}
//- (void)syncShowFooter:(BOOL)animated {
//    if (animated) {
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.3f];
//    }
//    
//    if (isShowFooter) {
//        
//        if ([self getCurrentMediaItem].description_.length > 0) {
//            self.descriptionImageView.alpha
//            = 1.0f;
//            
//            CGRect rect = self.descriptionImageView.frame;
//            rect.origin.y = SCREEN_HEIGHT-self.descriptionImageView.bounds.size.height;
//            self.descriptionImageView.frame = rect;
//            
//            self.descriptionTextView.frame = CGRectMake(10, self.view.bounds.size.height-70, descriptionImageView.bounds.size.width-20, 60);
//            
//        } else {
//            self.descriptionImageView.alpha
//            = 0.0f;
//            
//            CGRect rect = self.descriptionImageView.frame;
//            rect.origin.y = SCREEN_HEIGHT;
//            self.descriptionImageView.frame = rect;
//            
//            self.descriptionTextView.frame = CGRectMake(10, SCREEN_HEIGHT, descriptionImageView.bounds.size.width-20, 60);
//        }
//        
//    } else {
//        self.descriptionImageView.alpha
//        = 0.0f;
//        
//        CGRect rect = self.descriptionImageView.frame;
//        rect.origin.y = SCREEN_HEIGHT;
//        self.descriptionImageView.frame = rect;
//        
//        self.descriptionTextView.frame = CGRectMake(10, SCREEN_HEIGHT, descriptionImageView.bounds.size.width-20, 60);
//    }
//    
//    if (animated) {
//        [UIView commitAnimations];
//    }
//}

//- (int)getCurrentPageIndexForPagingMode {
//    CGFloat pageWidth = self.myCollectionView.bounds.size.width;
//    int subpageIndex = floor((self.myCollectionView.contentOffset.x - pageWidth/2) / pageWidth) + 1;
//    return subpageIndex;
//}

//- (ItemImage *)getCurrentMediaItem {
//    if ([self getCurrentPageIndexForPagingMode] < self.mediaArray.count) {
//        ItemImage *media = [self.mediaArray objectAtIndex:[self getCurrentPageIndexForPagingMode]];
//        return media;
//    } else {
//        return nil;
//    }
//}

//- (void)pageChanged {
//    ItemImage *media = [self getCurrentMediaItem];
//    self.descriptionTextView.text = media.description_;
//    
//    [self syncLayout:YES];
//}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MediaGalleryCollectionViewCell *cell = nil;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MediaGalleryCollectionViewCell" forIndexPath:indexPath];
    
    cell.myScrollView.zoomScale = 1.0f;
    cell.myScrollView.contentOffset = CGPointMake(0, 0);
    
    cell.indexPath = indexPath;
    cell.delegate = self;
//    
//    ItemImage *media = [self.mediaArray objectAtIndex:indexPath.row];
//    cell.media = media;
    
    [cell layoutSubviews];
    
    return cell;
}

#pragma mark -
#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-70);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 5;
}

#pragma mark -
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark -
#pragma mark MagazinePageViewCollectionCellDelegate
- (void)galleryPageViewCellDoubleClicked:(MediaGalleryCollectionViewCell *)cell {
    
}
- (void)galleryPageViewCellClicked:(MediaGalleryCollectionViewCell *)cell {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//- (void)galleryPageViewUpSwiped:(MediaGalleryCollectionViewCell *)cell {
//    isShowHeader = YES;
//    isShowFooter = isShowHeader;
//    
//    [self syncLayout:YES];
//}
//- (void)galleryPageViewDownSwiped:(MediaGalleryCollectionViewCell *)cell {
//    isShowHeader = NO;
//    isShowFooter = isShowHeader;
//    
//    [self syncLayout:YES];
//}


#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // Update the page index.
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    static NSInteger previousPage = 0;
//    CGFloat pageWidth = scrollView.frame.size.width;
//    float fractionalPage = scrollView.contentOffset.x / pageWidth;
//    NSInteger page = lround(fractionalPage);
//    if (previousPage != page) {
        // Page has changed, do your thing!
        // ...
        
//        [self pageChanged];
        
        // Finally, update previous page
//        previousPage = page;
//    }
//}


#pragma mark -
#pragma mark UIActions
- (void)closeButtonClicked:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Getters
- (UICollectionView *)myCollectionView {
    
    if (myCollectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, SCREEN_HEIGHT-70) collectionViewLayout:layout];
        myCollectionView.backgroundColor = CLEAR_COLOR;
        myCollectionView.dataSource = self;
        myCollectionView.delegate = self;
        
        myCollectionView.alwaysBounceHorizontal = YES;
        myCollectionView.alwaysBounceVertical = NO;
        myCollectionView.pagingEnabled = YES;
        
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        [myCollectionView registerClass:[MediaGalleryCollectionViewCell class] forCellWithReuseIdentifier:@"MediaGalleryCollectionViewCell"];
    }
    return myCollectionView;
}
- (UIView *)descriptionImageView {
    if (descriptionImageView == nil) {
        descriptionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
        descriptionImageView.backgroundColor = CLEAR_COLOR;
        descriptionImageView.image = [UIImage imageNamed:@"description_bg"];
        descriptionImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return descriptionImageView;
}
- (UITextView *)descriptionTextView {
    if (descriptionTextView == nil) {
        descriptionTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, self.view.bounds.size.height-70, descriptionImageView.bounds.size.width-20, 60)];
        descriptionTextView.backgroundColor = CLEAR_COLOR;
        descriptionTextView.font = FONT_NORMAL_SMALL;
        descriptionTextView.textColor = [UIColor whiteColor];
    }
    return descriptionTextView;
}

@end
