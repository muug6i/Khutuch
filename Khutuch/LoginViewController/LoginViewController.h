//
//  LoginViewController.h
//  Minu
//
//  Created by Kaizen-Mongolia on 1/19/14.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic, strong) UILabel       *logo;

@property (nonatomic, strong) UITextField   *userNameField;
@property (nonatomic, strong) UITextField   *passwordField;
@property (nonatomic, strong) UIButton      *loginButton;

@property (nonatomic, strong) UIButton      *lostPasswordButton;
@property (nonatomic, strong) UIButton      *registerButton;


@property (nonatomic, strong) UIView        *registerView;

@property (nonatomic, strong) UITextField   *regUserNameField;

@property (nonatomic, strong) UITextField   *regPasswordField;
@property (nonatomic, strong) UITextField   *regRePasswordField;

@property (nonatomic, strong) UIButton      *regRegisterButton;
@property (nonatomic, strong) UIButton      *regCancelButton;


@end
