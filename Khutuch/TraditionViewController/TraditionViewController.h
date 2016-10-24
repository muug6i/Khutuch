//
//  TraditionViewController.h
//  Khutuch
//
//  Created by niknok on 4/25/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TraditionCollectionViewCell.h"
#import "TraditionCollectionHeaderView.h"
#import "MainViewWithHeaderViewController.h"

@interface TraditionViewController : MainViewWithHeaderViewController
@property (nonatomic, strong) UICollectionView  *myCollectionView;
@property (nonatomic, strong) NSArray  *traditionArray;
@end
