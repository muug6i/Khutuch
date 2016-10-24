//
//  LoginView.m
//  Khutuch
//
//  Created by niknok on 4/25/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "LoginView.h"

@interface LoginView()<UIGestureRecognizerDelegate>

@end

@implementation LoginView
@synthesize myScrollView;
@synthesize bgView;
@synthesize logoImageView;
@synthesize emailTextField;
@synthesize passwordTextField;
@synthesize loginButton;
@synthesize fbLoginButton;
@synthesize contactButton;
@synthesize loginIntButton;
@synthesize feedbackButton;
@synthesize loginSucceeded;
@synthesize parenController;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Custom initialization
        
        [self configureView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardDidShow:)
                                                     name:UIKeyboardDidShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardDidHide:)
                                                     name:UIKeyboardDidHideNotification
                                                   object:nil];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    for (UIView *view in [self.myScrollView subviews]) {
        if ([view isFirstResponder]) {
            [view resignFirstResponder];
            break;
        }
    }
}

#pragma mark UIGestureRecognizerDelegate methods
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES; // handle the touch
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark -
#pragma mark KeyboardDelegate
#pragma mark -
- (void)keyboardDidShow: (NSNotification *) notif {
    
    // Do something here
    UIScrollView *scrollView = self.myScrollView;
    
    NSDictionary *userInfo = [notif userInfo];
    
    NSValue *animationCurveObject = [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    NSValue *animationDurationObject = [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSValue *keyboardEndRectObject = [userInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    
    NSUInteger animationCurve = 0;
    double animationDuration = 0.0f;
    CGRect keyboardEndRect = CGRectMake(0, 0, 0, 0);
    
    [animationCurveObject getValue:&animationCurve];
    [animationDurationObject getValue:&animationDuration];
    [keyboardEndRectObject getValue:&keyboardEndRect];
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    keyboardEndRect = [self convertRect:keyboardEndRect fromView:window];
    
    [UIView beginAnimations:@"changeTableViewContentInset" context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
    
    CGRect intersectionOfKeyboardRectAndWindowRect = CGRectIntersection(window.frame, keyboardEndRect);
    CGFloat bottomInset = intersectionOfKeyboardRectAndWindowRect.size.height;
    
    scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, bottomInset, 0.0f);
    
    [UIView commitAnimations];
}

- (void)keyboardDidHide: (NSNotification *) notif {
    // Do something here
    UIScrollView *scrollView = self.myScrollView;
    
    if (UIEdgeInsetsEqualToEdgeInsets(scrollView.contentInset, UIEdgeInsetsZero))
        return;
    
    NSDictionary *userInfo = [notif userInfo];
    
    NSValue *animationCurveObject = [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    NSValue *animationDurationObject = [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSValue *keyboardEndRectObject = [userInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    
    NSUInteger animationCurve = 0;
    double animationDuration = 0.0f;
    CGRect keyboardEndRect = CGRectMake(0, 0, 0, 0);
    
    [animationCurveObject getValue:&animationCurve];
    [animationDurationObject getValue:&animationDuration];
    [keyboardEndRectObject getValue:&keyboardEndRect];
    
    [UIView beginAnimations:@"changeTableViewContentInset" context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
    
    scrollView.contentInset = UIEdgeInsetsZero;
    
    [UIView commitAnimations];
}

- (void)loginSuccessWithAnimated:(BOOL)animated {
    
//    [USERDEF setBool:YES forKey:kLoggedIn];
    [USERDEF synchronize];
    
    self.emailTextField.text = @"";
    self.passwordTextField.text = @"";
    
    if (self.loginSucceeded) {
        self.loginSucceeded();
    }
}

- (void)configureView {
    
    self.backgroundColor = CLEAR_COLOR;
    
    [self addSubview:self.myScrollView];
    [self.myScrollView addSubview:self.bgView];
    [self.myScrollView addSubview:self.logoImageView];
    [self.myScrollView addSubview:self.emailTextField];
    [self.myScrollView addSubview:self.passwordTextField];
    [self.myScrollView addSubview:self.loginButton];
    [self.myScrollView addSubview:self.fbLoginButton];
    [self.myScrollView addSubview:self.contactButton];
    [self.myScrollView addSubview:self.loginIntButton];
    [self.myScrollView addSubview:self.feedbackButton];
    
    //FRAME
    self.myScrollView.frame = self.bounds;
    self.myScrollView.contentSize = self.myScrollView.bounds.size;
}

#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark UIActions
- (void)loginButtonClicked:(UIButton *)button {
    
    if (self.emailTextField.text.length == 0 || self.passwordTextField.text.length == 0) {
        [SEUtils showAlert:NSLocalizedString(@"Хэрэглэгчийн нэр болон нууц үгээ оруулна уу!", nil)];
        return;
    }
    
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
    [self loginSuccessWithAnimated:YES];
//    [self postLogin];
}

#pragma mark -
#pragma mark Getters
- (UIScrollView *)myScrollView {
    if (myScrollView == nil) {
        myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        myScrollView.backgroundColor = CLEAR_COLOR;
        myScrollView.delegate = self;
        myScrollView.showsVerticalScrollIndicator = NO;
        myScrollView.showsHorizontalScrollIndicator = NO;
        myScrollView.decelerationRate = 0.1f;
        myScrollView.pagingEnabled = NO;
        myScrollView.alwaysBounceVertical = YES;
    }
    return myScrollView;
}

-(UIImageView *)bgView{
    if (bgView ==nil){
        bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        bgView.image = [UIImage imageNamed:@"bluesky.png"];
//        bgView.image = 
    }
    return bgView;
}
- (UIImageView *)logoImageView {
    if (logoImageView == nil) {
        logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-90)/2, 20, 90, 90)];
        logoImageView.image = [UIImage imageNamed:@"unegui_logo"];
    }
    return logoImageView;
}



- (UITextField *)emailTextField {
    if (emailTextField == nil) {
        emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 190, SCREEN_WIDTH-40, 40)];
        emailTextField.delegate = self;
        emailTextField.textColor = BLACK_COLOR;
        emailTextField.backgroundColor = [UIColor whiteColor];
        emailTextField.font = FONT_NORMAL_SMALL;
        emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        emailTextField.textAlignment = NSTextAlignmentLeft;
        emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        emailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        emailTextField.returnKeyType = UIReturnKeyNext;
        emailTextField.clearButtonMode = UITextFieldViewModeAlways;
        
        [emailTextField setClipsToBounds:YES];
        [emailTextField.layer setBorderColor:GRAY_COLOR.CGColor];
        [emailTextField.layer setBorderWidth:1.0f];
        
        //LeftView
        emailTextField.leftViewMode = UITextFieldViewModeAlways;
        emailTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 35)];
        emailTextField.leftView.backgroundColor = CLEAR_COLOR;
        
        emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Хэрэглэгчийн нэр", nil) attributes:@{NSForegroundColorAttributeName: [[UIColor blackColor] colorWithAlphaComponent:0.5f]}];
    }
    return emailTextField;
}
- (UITextField *)passwordTextField {
    if (passwordTextField == nil) {
        passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 240, SCREEN_WIDTH-40, 40)];
        passwordTextField.delegate = self;
        passwordTextField.textColor = BLACK_COLOR;
        passwordTextField.backgroundColor = [UIColor whiteColor];
        passwordTextField.font = FONT_NORMAL_SMALL;
        passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        passwordTextField.textAlignment = NSTextAlignmentLeft;
        passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        passwordTextField.returnKeyType = UIReturnKeyNext;
        passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
        passwordTextField.secureTextEntry = YES;
        
        [passwordTextField setClipsToBounds:YES];
        [passwordTextField.layer setBorderColor:GRAY_COLOR.CGColor];
        [passwordTextField.layer setBorderWidth:1.0f];
        
        //LeftView
        passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        passwordTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 35)];
        passwordTextField.leftView.backgroundColor = CLEAR_COLOR;
        
        passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Нууц үг", nil) attributes:@{NSForegroundColorAttributeName: [[UIColor blackColor] colorWithAlphaComponent:0.5f]}];
    }
    return passwordTextField;
}


- (UIButton *)loginButton {
    if (loginButton == nil) {
        
        loginButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 295, SCREEN_WIDTH-40, 40)];
        loginButton.backgroundColor = MAIN_COLOR;
        [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        loginButton.titleLabel.font = FONT_NORMAL;
        loginButton.clipsToBounds = YES;
        [loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [loginButton setTitle:NSLocalizedString(@"Нэвтрэх", nil) forState:UIControlStateNormal];
    }
    return loginButton;
}

- (UIButton *)loginIntButton {
    if (loginIntButton == nil) {
        
        loginIntButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 350, 135, 40)];
        loginIntButton.backgroundColor = [MAIN_COLOR colorWithAlphaComponent:0.8f];
        [loginIntButton addTarget:self action:@selector(loginIntButton:) forControlEvents:UIControlEventTouchUpInside];
        [loginIntButton.titleLabel setFont:FONT_NORMAL];
        [loginIntButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [loginIntButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [loginIntButton setTitle:NSLocalizedString(@"Нэвтрэх заавар", nil) forState:UIControlStateNormal];
    }
    return loginIntButton;
}

- (UIButton *)contactButton {
    if (contactButton == nil) {

        contactButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-155, 350, 135, 40)];
        contactButton.backgroundColor = [MAIN_COLOR colorWithAlphaComponent:0.8f];
        [contactButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        contactButton.titleLabel.font = FONT_NORMAL;
        contactButton.clipsToBounds = YES;
        [contactButton addTarget:self action:@selector(contactButton:) forControlEvents:UIControlEventTouchUpInside];
        [contactButton setTitle:NSLocalizedString(@"Холбоо барих", nil) forState:UIControlStateNormal];
    }
    return contactButton;
}


//- (UIButton *)fbLoginButton {
//    if (fbLoginButton == nil) {
//        
//        fbLoginButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 290, SCREEN_WIDTH-40, 40)];
//        fbLoginButton.backgroundColor = CLEAR_COLOR;
//        [fbLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        fbLoginButton.titleLabel.font = FONT_NORMAL;
//        fbLoginButton.clipsToBounds = YES;
//        [fbLoginButton setBackgroundImage:[UIImage imageNamed:@"fb_button"] forState:UIControlStateNormal];
//        [fbLoginButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
//        [fbLoginButton setTitle:NSLocalizedString(@"Facebook эрхээр нэвтрэх", nil) forState:UIControlStateNormal];
//        [fbLoginButton addTarget:self action:@selector(fbLoginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [fbLoginButton setTitle:NSLocalizedString(fbLoginButton.titleLabel.text, nil) forState:UIControlStateNormal];
//    }
//    return fbLoginButton;
//}

//- (UIButton *)feedbackButton {
//    if (feedbackButton == nil) {
//        feedbackButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.bounds.size.height-50, SCREEN_WIDTH-40, 35)];
//        feedbackButton.backgroundColor = CLEAR_COLOR;
//        [feedbackButton addTarget:self action:@selector(feedbackButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [feedbackButton.titleLabel setFont:FONT_NORMAL];
//        [feedbackButton setTitleColor:GRAY_COLOR forState:UIControlStateNormal];
//        [feedbackButton setTitle:NSLocalizedString(@"Санал хүсэлт", nil) forState:UIControlStateNormal];
//        
//        feedbackButton.hidden = YES;
//    }
//    return feedbackButton;
//}


@end
