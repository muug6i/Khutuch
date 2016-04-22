//
//  MainViewController.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/14/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FXBlurView/FXBlurView.h>

@interface MainViewController : UIViewController

@property (nonatomic, strong) FXBlurView        *blurView;
@property (nonatomic, strong) UIImageView       *bgView;
@property (nonatomic, strong) UICollectionView  *menuCollectionView;

@property (nonatomic, strong) UITableView       *mainTableView;
@property (nonatomic, strong) UITableView       *othersTableView;

@property (nonatomic, strong) UICollectionView  *bTagCollectionView;

@property (nonatomic, strong) UITextField       *searchFieldl;
@property (nonatomic, strong) UIButton          *searchButton;
@property (nonatomic, strong) UIButton          *loginButton;


@end
