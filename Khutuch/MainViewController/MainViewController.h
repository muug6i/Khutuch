//
//  MainViewController.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/14/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainAbstractViewController.h"
#import <FXBlurView/FXBlurView.h>

@interface MainViewController : MainAbstractViewController

@property (nonatomic, strong) UIScrollView *myScrollView;

@property (nonatomic, strong) UIView          *headView;
@property (nonatomic, strong) UIView          *advertiseMentView;

@property (nonatomic, strong) UIButton          *newsButton;
@property (nonatomic, strong) UIButton          *trafficButton;
@property (nonatomic, strong) UIButton          *searchButton;

@property (nonatomic, strong) UIButton          *weatherButton;
@property (nonatomic, strong) UIButton          *referenceButton;

@property (nonatomic, strong) UIButton          *easternAstrologyButton;
@property (nonatomic, strong) UIButton          *westernAstrologyButton;
@property (nonatomic, strong) UIButton          *classicButton;

@property (nonatomic, strong) UIButton          *tvButton;
@property (nonatomic, strong) UIButton          *getInformationButton;
@property (nonatomic, strong) UIButton          *jokeButton;

@property (nonatomic, strong) UIButton          *radioButton;
@property (nonatomic, strong) UIButton          *busRouteButton;
@property (nonatomic, strong) UIButton          *sonjooButton;



@end
