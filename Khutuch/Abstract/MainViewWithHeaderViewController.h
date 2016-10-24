//
//  MainViewWithHeaderViewController.h
//  Khutuch
//
//  Created by niknok on 4/29/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import "MainAbstractViewController.h"

@interface MainViewWithHeaderViewController : MainAbstractViewController

@property (nonatomic, strong) UIView        *headerView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UIButton      *backButton;
@property (nonatomic, strong) UIView        *sepView;
@property (nonatomic, strong) UIButton      *reloadButton;


- (void)backButtonClicked:(UIButton *)button;
- (void)reloadButtonClicked:(UIButton *)button;


@end
