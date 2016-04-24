//
//  MainAbstractViewController.h
//  iRestaurantRepo
//
//  Created by Sodtseren Enkhee on 2/18/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainAbstractViewController : UIViewController<UIPopoverControllerDelegate>
//Header
@property (nonatomic, strong) UIView            *headerView;
@property (nonatomic, strong) UILabel           *titleLabel;
@property (nonatomic, strong) UIButton          *menuButton;
@property (nonatomic, strong) UIButton          *backButton;
//HUD
@property (nonatomic, strong) MBProgressHUD     *HUD;
@property (nonatomic, strong) UIRefreshControl  *refreshControl;
@property (nonatomic, strong) UIImageView  *backgroundImageView;

@property (nonatomic, strong) UIPopoverController *popoverController;

- (void)configureView;

//HUD
- (void)handleRefresh:(UIRefreshControl *)refresh;
- (void)showLoadingHUD;
//Back
- (void)backButtonClicked;

@end
