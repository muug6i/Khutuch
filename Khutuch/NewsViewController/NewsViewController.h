//
//  NewsViewController.h
//  Khutuch
//
//  Created by niknok on 4/25/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCollectionViewCell.h"
#import "NewsCollectionHeaderView.h"
#import "MainViewWithHeaderViewController.h"

@interface NewsViewController : MainViewWithHeaderViewController

@property (nonatomic, strong) UICollectionView  *myCollectionView;
@property (nonatomic, strong) NSArray  *newsArray;

@end
