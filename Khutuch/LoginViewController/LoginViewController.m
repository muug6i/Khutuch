//
//  LoginViewController.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/19/14.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "TabBarController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginView;
//
@synthesize loginSucceeded;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = MAIN_BG_COLOR;
    [self.view addSubview:self.loginView];
    
    __weak typeof(self)weakSelf = self;
    self.loginView.loginSucceeded = ^{
        [weakSelf loginSuccessWithAnimated:YES];
    };
    
//    self.titleLabel.text = NSLocalizedString(@"Нэвтрэх", nil);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)loginSuccessWithAnimated:(BOOL)animated {
    
//    LoginUserDetailViewController *controller = [[LoginUserDetailViewController alloc] initWithNibName:nil bundle:nil];
//    [self.navigationController pushViewController:controller animated:animated];
    TabBarController *tabBar = [[TabBarController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:tabBar animated:animated];
    
    if (self.loginSucceeded) {
        self.loginSucceeded();
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //    if ([LOGIN_USER isLoggedin]) {
    //        [self loginSuccessWithAnimated:NO];
    //    }
}

#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark UIActions

#pragma mark -
#pragma mark Getters
- (LoginView *)loginView {
    if (loginView == nil) {
        loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        loginView.parenController = self;
    }
    return loginView;
}



@end
