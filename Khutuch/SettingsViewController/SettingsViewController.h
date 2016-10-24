//
//  SettingsViewController.h
//  Khutuch
//
//  Created by Kaizen-Mongolia on 1/16/16.
//  Copyright © 2016 Kaizen-Mongolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsTableViewCell.h"
#import "MainViewWithHeaderViewController.h"

@interface SettingsViewController : MainViewWithHeaderViewController

@property (nonatomic, strong) UIImageView       *bgView;
@property (nonatomic, strong) UITableView       *myTableView;
@property (nonatomic, strong) NSArray           *settingsArray;

@end
