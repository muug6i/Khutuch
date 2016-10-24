//
//  MainViewWithHeaderViewController.m
//  Khutuch
//
//  Created by niknok on 4/29/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "MainViewWithHeaderViewController.h"

@interface MainViewWithHeaderViewController ()

@end

@implementation MainViewWithHeaderViewController
@synthesize headerView;
@synthesize titleLabel;
@synthesize backButton;
@synthesize sepView;
@synthesize reloadButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setClipsToBounds:YES];
    
    if (self.navigationController.viewControllers.count > 1) {
        self.backButton.hidden = NO;
        self.reloadButton.hidden = NO;
        self.backButton.frame = CGRectMake(10, 0, 20, 30);
        self.reloadButton.frame = CGRectMake(SCREEN_WIDTH-40, 0, 30, 30);
        self.titleLabel.frame = CGRectMake(25, 5, SCREEN_WIDTH-60, 25);
        
        self.backButton.hidden = NO;
        
    } else {
        if ([self isModal]) {
            self.backButton.hidden = YES;
            self.titleLabel.hidden = YES;
            self.headerView.hidden = YES;

            self.backButton.frame = CGRectMake(0, 0, 20, 30);
            self.reloadButton.frame = CGRectMake(34, 20, 30, 30);
            self.titleLabel.frame = CGRectMake(30, 5, SCREEN_WIDTH-60, 25);
            
//            self.backButton.hidden = NO;
            
        } else {
            self.backButton.hidden = YES;
            self.titleLabel.hidden = YES;
            self.headerView.hidden = YES;
            self.backButton.frame = CGRectMake(20, 0, 20, 30);
            self.reloadButton.frame = CGRectMake(78, 20, 30, 30);
            self.titleLabel.frame = CGRectMake(30, 5, SCREEN_WIDTH-60, 25);
            
//            self.backButton.hidden = NO;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //    self.screenName = self.titleLabel.text;
}

- (void)configureView {
    [super configureView];
    
    self.view.backgroundColor = MAIN_COLOR;
    
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.backButton];
    [self.headerView addSubview:self.sepView];
    [self.headerView addSubview:self.reloadButton];
    
    //FRAME
    self.headerView.frame = CGRectMake(0, 70, SCREEN_WIDTH, 30);
    self.titleLabel.frame = CGRectMake(25, 5, SCREEN_WIDTH-60, 25);
    self.backButton.frame = CGRectMake(0, 50, 20, 30);
    self.sepView.frame = CGRectMake(0, 30, SCREEN_WIDTH, 1);
    self.reloadButton.frame = CGRectMake(88, 50, 30, 30);
}


#pragma mark -
#pragma mark UIActions

- (void)backButtonClicked:(UIButton *)button {
    
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        if ([self isModal]) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}
- (void)logoButtonClicked:(UIButton *)button {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)reloadButtonClicked:(UIButton *)button {
    //override
}
#pragma mark -
#pragma mark User
- (BOOL)checkPushedThisControllerClass:(Class)class {
    for (UIViewController *_controller in self.navigationController.viewControllers) {
        if ([_controller isKindOfClass:class]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark -
#pragma mark Getters
- (UIView *)headerView {
    if (headerView == nil) {
        headerView = [[UIView alloc] initWithFrame:CGRectZero];
        headerView.backgroundColor = MAIN_COLOR;
    }
    return headerView;
}
- (UILabel *)titleLabel {
    if (titleLabel == nil) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.backgroundColor = CLEAR_COLOR;
        titleLabel.font = FONT_NORMAL;
        titleLabel.text = @"";
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.numberOfLines = 2;
    }
    return titleLabel;
}


- (UIButton *)backButton {
    if (backButton == nil) {
        backButton = [[UIButton alloc] initWithFrame:CGRectZero];
        backButton.backgroundColor = CLEAR_COLOR;
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return backButton;
}
- (UIView *)sepView {
    if (sepView == nil) {
        sepView = [[UIView alloc] initWithFrame:CGRectZero];
        sepView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5f];
    }
    return sepView;
}
- (UIButton *)reloadButton {
    if (reloadButton == nil) {
        reloadButton = [[UIButton alloc] initWithFrame:CGRectZero];
        reloadButton.backgroundColor = CLEAR_COLOR;
        [reloadButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [reloadButton setImage:[UIImage imageNamed:@"reload"] forState:UIControlStateNormal];
        
        [reloadButton addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [reloadButton setHidden:YES];
    }
    return reloadButton;
}

@end
