//
//  LoginViewController.m
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/19/14.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize logo;
@synthesize userNameField;
@synthesize passwordField;
@synthesize lostPasswordButton;
@synthesize registerButton;
@synthesize loginButton;


@synthesize registerView;
@synthesize regUserNameField;
@synthesize regPasswordField;
@synthesize regRePasswordField;
@synthesize regRegisterButton;
@synthesize regCancelButton;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    
    [self.view addSubview:self.logo];
    [self.view addSubview:self.userNameField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.loginButton];
    
    [self.view addSubview:self.lostPasswordButton];
    [self.view addSubview:self.registerButton];
    
    [self.view addSubview:self.registerView];
    [self.registerView addSubview:self.regUserNameField];
    [self.registerView addSubview:self.regRePasswordField];
    [self.registerView addSubview:self.regPasswordField];
    [self.registerView addSubview:self.regRegisterButton];
    [self.registerView addSubview:self.regCancelButton];
    self.registerView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (void) registerButtonClicked {
    self.registerView.hidden = !self.registerView.hidden;
}

- (void) lostPasswordClicked {

}

#pragma mark - Getters
- (UILabel *) logo {
    if (!logo) {
        logo = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-120)/2, 120, 120, 50)];
        logo.text = @"minu";
        logo.font = [UIFont fontWithName:@"Courier" size:32];
        logo.textAlignment = NSTextAlignmentCenter;
        logo.textColor = UIColor.whiteColor;
    }
    return logo;
}

- (UITextField *) userNameField {
    if (!userNameField) {
        userNameField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-238)/2, 200, 238, 44)];
        userNameField.placeholder = @"Хэрэглэгчийн нэр";
        userNameField.textAlignment = NSTextAlignmentCenter;
        userNameField.textColor = UIColor.whiteColor;
        userNameField.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_button"]];
    }
    return userNameField;
}

- (UITextField *) passwordField {
    if (!passwordField) {
        passwordField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-238)/2, 260, 238, 44)];
        passwordField.placeholder = @"Нууц үг";
        passwordField.secureTextEntry = YES;
        passwordField.textAlignment = NSTextAlignmentCenter;
        passwordField.textColor = UIColor.whiteColor;
        passwordField.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_button"]];
    }
    return passwordField;
}

- (UIButton *) loginButton {
    if (!loginButton) {
        loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        [loginButton setTitle:@"НЭВТРЭХ" forState:UIControlStateNormal];
        loginButton.titleLabel.textColor = UIColor.whiteColor;
        [loginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        loginButton.center = CGPointMake(self.view.frame.size.width/2, 330);
        loginButton.titleLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:15];
    }
    return loginButton;
}

- (UIButton *) lostPasswordButton {
    if (!lostPasswordButton) {
        lostPasswordButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        [lostPasswordButton setTitle:@"Нууц үгээ мартсан" forState:UIControlStateNormal];
        lostPasswordButton.titleLabel.textColor = UIColor.whiteColor;
        [lostPasswordButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        lostPasswordButton.center = CGPointMake(self.view.frame.size.width/2, 430);
        lostPasswordButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
        [lostPasswordButton addTarget:self action:@selector(lostPasswordClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return lostPasswordButton;
}

- (UIButton *) registerButton {
    if (!registerButton) {
        registerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-45-50, self.view.frame.size.width, 45)];
        registerButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"buurtguuleh_button"]];
        [registerButton setTitle:@"Бүртгүүлэх" forState:UIControlStateNormal];
        [registerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [registerButton addTarget:self action:@selector(registerButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return registerButton;
}

- (UIView *) registerView {
    if (!registerView) {
        registerView = [[UIView alloc] initWithFrame:self.view.frame];
        registerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    }
    return registerView;
}

- (UITextField *) regUserNameField {
    if (!regUserNameField) {
        regUserNameField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-238)/2, 120, 238, 44)];
        regUserNameField.placeholder = @"Хэрэглэгчийн нэр";
        regUserNameField.textAlignment = NSTextAlignmentCenter;
        regUserNameField.textColor = UIColor.whiteColor;
        regUserNameField.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_button"]];
    }
    return regUserNameField;
}

- (UITextField *) regPasswordField {
    if (!regPasswordField) {
        regPasswordField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-238)/2, 180, 238, 44)];
        regPasswordField.placeholder = @"Нууц үг";
        regPasswordField.secureTextEntry = YES;
        regPasswordField.textAlignment = NSTextAlignmentCenter;
        regPasswordField.textColor = UIColor.whiteColor;
        regPasswordField.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_button"]];
    }
    return regPasswordField;
}

- (UITextField *) regRePasswordField {
    if (!regRePasswordField) {
        regRePasswordField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-238)/2, 230, 238, 44)];
        regRePasswordField.placeholder = @"Нууц үг давтах";
        regRePasswordField.secureTextEntry = YES;
        regRePasswordField.textAlignment = NSTextAlignmentCenter;
        regRePasswordField.textColor = UIColor.whiteColor;
        regRePasswordField.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_button"]];
    }
    return regRePasswordField;
}

- (UIButton *) regRegisterButton {
    if (!regRegisterButton) {
        regRegisterButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-90-50, self.view.frame.size.width, 45)];
        regRegisterButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"buurtguuleh_button"]];
        [regRegisterButton setTitle:@"Бүртгүүлэх" forState:UIControlStateNormal];
        [regRegisterButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [regRegisterButton addTarget:self action:@selector(registerButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return regRegisterButton;
}

- (UIButton *) regCancelButton {
    if (!regCancelButton) {
        regCancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-45-50, self.view.frame.size.width, 45)];
        regCancelButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"buurtguuleh_button"]];
        [regCancelButton setTitle:@"Болих" forState:UIControlStateNormal];
        [regCancelButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [regCancelButton addTarget:self action:@selector(registerButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return regCancelButton;
}

@end
