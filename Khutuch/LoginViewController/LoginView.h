//
//  LoginView.h
//  Khutuch
//
//  Created by niknok on 4/25/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "MainAbstractViewController.h"

@interface LoginView : UIView<UIScrollViewDelegate, UITextFieldDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) UIScrollView  *myScrollView;
@property (nonatomic, strong) UIImageView   *bgView;
@property (nonatomic, strong) UIImageView   *logoImageView;
@property (nonatomic, strong) UITextField   *emailTextField;
@property (nonatomic, strong) UITextField   *passwordTextField;
@property (nonatomic, strong) UIButton      *loginButton;
@property (nonatomic, strong) UIButton      *fbLoginButton;
@property (nonatomic, strong) UIButton      *contactButton;
@property (nonatomic, strong) UIButton      *loginIntButton;
@property (nonatomic, strong) UIButton      *feedbackButton;

@property (nonatomic, copy) void (^loginSucceeded)();

@property (nonatomic, strong) MainAbstractViewController  *parenController;
@end
