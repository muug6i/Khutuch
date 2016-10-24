//
//  WestZodiacViewController.h
//  Khutuch
//
//  Created by niknok on 4/30/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "MainViewWithHeaderViewController.h"
#import "WestZodiacCollectionViewCell.h"

@interface WestZodiacViewController : MainViewWithHeaderViewController

@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, strong) UIImageView          *bgImage;
@property (nonatomic, strong) UILabel   *zodiacLabel;
@property (nonatomic, strong) NSArray   *zodiacArray;

@end
