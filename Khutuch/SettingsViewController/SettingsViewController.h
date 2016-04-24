//
//  OrderedViewController.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FXBlurView/FXBlurView.h>
#import "SortButton.h"

@interface SettingsViewController : UIViewController

@property (nonatomic, strong) FXBlurView        *blurView;
@property (nonatomic, strong) UIImageView       *bgView;
@property (nonatomic, strong) UICollectionView  *menuCollectionView;
@property (nonatomic, strong) UITableView       *mainTableView;
@property (nonatomic, strong) UICollectionView  *bTagCollectionView;

@property (nonatomic, strong) UIButton          *searchButton;
@property (nonatomic, strong) UITextField       *searchFieldl;

@property (nonatomic, strong) UIButton          *menuButton;

@property (nonatomic, strong) SortButton        *sortPriceButton;
@property (nonatomic, strong) SortButton        *sortTypePrice;

@property (nonatomic, strong) UITableView       *menuTableView;

@end
