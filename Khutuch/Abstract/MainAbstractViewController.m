//
//  MainAbstractViewController.m
//  iRestaurantRepo
//
//  Created by Sodtseren Enkhee on 2/18/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import "MainAbstractViewController.h"
#import "MyAlertView.h"

@interface MainAbstractViewController ()

@end

@implementation MainAbstractViewController
@synthesize popoverController;
@synthesize headerView;
@synthesize titleLabel;
@synthesize menuButton;
@synthesize backButton;
@synthesize HUD;
@synthesize refreshControl;
@synthesize backgroundImageView;

- (void)showLoadingHUD {
    if (HUD == nil) {
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.userInteractionEnabled = YES;
        self.HUD.labelText = NSLocalizedString(@"Уншиж байна...", nil);
    }
    [self.view addSubview:self.HUD];
    [self.HUD show:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)configureView {
    //UIRefreshControl
    {
        self.refreshControl = [[UIRefreshControl alloc] init];
        [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"manager_bg.jpg"]];
        imageView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20);
        [self.view addSubview:imageView];
    }
    [self.view addSubview:self.headerView];
}

#pragma mark - UIPopoverControllerDelegate

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.popoverController.delegate = nil;
    self.popoverController = nil;
}

#pragma mark -
#pragma mark Connection

#pragma mark -
#pragma mark UIActions
-(void)handleRefresh:(UIRefreshControl *)refresh {
    // Reload my data
    //...
}

- (void)backButtonClicked {
    if (![self.navigationController popViewControllerAnimated:YES]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark -
#pragma mark User Methods
- (BOOL)isModal {
    return self.presentingViewController.presentedViewController == self
    || self.navigationController.presentingViewController.presentedViewController == self.navigationController
    || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

#pragma mark -
#pragma mark Getters
- (UIView *)headerView {
    if (headerView == nil) {
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        headerView.backgroundColor = CLEAR_COLOR;
        headerView.clipsToBounds = YES;
        {
            UIView *view = [[UIView alloc] initWithFrame:headerView.bounds];
            view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5f];
            [headerView addSubview:view];
        }
        
        if (!IS_IPAD || ![self isModal])
        {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
            view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
            [headerView addSubview:view];
        }
        
        //SubViews
        {
            //Back button
            if (self.navigationController.viewControllers.count > 1 || [self isModal])
                [headerView addSubview:self.backButton];
            
            [headerView addSubview:self.titleLabel];
        }
    }
    return headerView;
}
- (UILabel *)titleLabel {
    if (titleLabel == nil) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-500)/2, 20, 500, 44)];
        titleLabel.backgroundColor = CLEAR_COLOR;
        titleLabel.textColor = BLACK_COLOR;
        titleLabel.font = FONT_LARGE;
        if (!IS_IPAD)
            titleLabel.font = FONT_NORMAL_BOLD;
        titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return titleLabel;
}
- (UIButton *)backButton {
    if (backButton == nil) {
        backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(39, 25, 34, 34);
        [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return backButton;
}

@end
