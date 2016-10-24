//
//  MainAbstractViewController.m
//  iRestaurantRepo
//
//  Created by Sodtseren Enkhee on 2/18/14.
//  Copyright (c) 2014 Sodtseren Enkhee. All rights reserved.
//

#import "MainAbstractViewController.h"
#import "MyAlertView.h"
#import <SEDefaults/SEDefaults.h>

@interface MainAbstractViewController ()

@end

@implementation MainAbstractViewController
@synthesize HUD;
@synthesize refreshControl;

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
    self.view.backgroundColor = [UIColor whiteColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark -
#pragma mark Rotation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark -
#pragma mark UIActions
-(void)handleRefresh:(UIRefreshControl *)refresh {
    // Reload my data
    //...
}

#pragma mark -
#pragma mark User Methods
- (BOOL)isModal {
    return self.presentingViewController.presentedViewController == self
    || self.navigationController.presentingViewController.presentedViewController == self.navigationController
    || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

@end
