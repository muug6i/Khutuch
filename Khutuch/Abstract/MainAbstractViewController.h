//
//  MainAbstractViewController.h
//  iRestaurantRepo
//
//  Created by Sodtseren Enkhee on 2/18/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface MainAbstractViewController : UIViewController<UIPopoverControllerDelegate>


//HUD
@property (nonatomic, strong) MBProgressHUD     *HUD;
@property (nonatomic, strong) UIRefreshControl  *refreshControl;

- (void)configureView;
- (void)showLoadingHUD;

//HUD
- (void)handleRefresh:(UIRefreshControl *)refresh;

- (BOOL)isModal;

@end
