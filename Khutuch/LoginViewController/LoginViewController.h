//
//  LoginViewController.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/19/14.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"

@interface LoginViewController : UIViewController

@property (nonatomic, strong) LoginView     *loginView;

@property (nonatomic, copy) void (^loginSucceeded)();


@end
