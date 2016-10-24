//
//  MainViewController.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/14/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewWithHeaderViewController.h"
#import <FXBlurView/FXBlurView.h>
#import "DDPageControl.h"
#import <AutoScrollLabel/CBAutoScrollLabel.h>
#import "MainMenuCollectionCell.h"
#import "BusRouteTableViewController.h"
#import "WestZodiacViewController.h"
#import "EastZodiacViewController.h"
#import "LavlahViewController.h"

@interface MainViewController : MainViewWithHeaderViewController

@property (nonatomic, strong) CBAutoScrollLabel *autoScrollLabel;
@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSArray *mainArray;


@property (nonatomic, strong) UIScrollView      *slideScrollView;
@property (strong, nonatomic) DDPageControl      *pageControl;
@property (nonatomic, strong) UIImageView          *backImage;
@property (nonatomic, strong) UIImageView          *advertiseImageView;





@end
